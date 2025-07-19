<?php
/**
 * Plugin Name: SH Executor
 * Plugin URI:  https://fundacionkimen/plugin/sh-executor
 * Description: Importa archivos CSV desde el escritorio de WordPress y almacena los datos en una tabla personalizada. Incluye un shortcode para mostrar los datos en el frontend.
 * Version:     0.1.0
 * Author:      Guido Rios Ciaffaroni
 * License:     GPLv2 or later
 * Text Domain: sh-executor
 */
if ( ! defined( 'ABSPATH' ) ) {
    exit;
}

// -----------------------------------------------------------------------------
// Configuración
// -----------------------------------------------------------------------------

define( 'SH_EXECUTOR_DIR', trailingslashit( plugin_dir_path( __FILE__ ) ) . 'scripts' );

// DEBUG: mostrar la ruta exacta en admin y log (elimina estas líneas en producción)
add_action( 'admin_notices', function () {
    if ( current_user_can( 'manage_options' ) ) {
        echo '<div class="notice notice-info is-dismissible"><p><strong>SH_EXECUTOR_DIR:</strong> ' . esc_html( SH_EXECUTOR_DIR ) . '</p></div>';
    }
} );
error_log( 'SH_EXECUTOR_DIR = ' . SH_EXECUTOR_DIR );

// -----------------------------------------------------------------------------
// Activación y desactivación
// -----------------------------------------------------------------------------

register_activation_hook( __FILE__, 'sh_executor_activate' );
function sh_executor_activate() {
    // Crear carpeta "scripts" si no existe
    if ( ! file_exists( SH_EXECUTOR_DIR ) ) {
        wp_mkdir_p( SH_EXECUTOR_DIR );
    }
    @chmod( SH_EXECUTOR_DIR, 0750 );

    // Añadir capability
    $role = get_role( 'administrator' );
    if ( $role && ! $role->has_cap( 'sh_executor_run' ) ) {
        $role->add_cap( 'sh_executor_run' );
    }
}

register_deactivation_hook( __FILE__, 'sh_executor_deactivate' );
function sh_executor_deactivate() {
    // Quitar capability
    $role = get_role( 'administrator' );
    if ( $role && $role->has_cap( 'sh_executor_run' ) ) {
        $role->remove_cap( 'sh_executor_run' );
    }
}

// -----------------------------------------------------------------------------
// Helper: obtener scripts disponibles
// -----------------------------------------------------------------------------

function sh_executor_get_scripts() {
    if ( ! is_dir( SH_EXECUTOR_DIR ) ) {
        return [];
    }
    $files = scandir( SH_EXECUTOR_DIR );
    $scripts = [];
    foreach ( $files as $file ) {
        if ( substr( $file, -3 ) === '.sh' && is_file( SH_EXECUTOR_DIR . '/' . $file ) ) {
            $scripts[] = $file;
        }
    }
    sort( $scripts );
    return $scripts;
}

// -----------------------------------------------------------------------------
// Página de administración
// -----------------------------------------------------------------------------

add_action( 'admin_menu', function () {
    add_management_page( __( 'Shell Executor', 'sh-executor' ), __( 'Shell Executor', 'sh-executor' ), 'sh_executor_run', 'sh-executor', 'sh_executor_admin_page' );
} );

function sh_executor_admin_page() {
    if ( ! current_user_can( 'sh_executor_run' ) ) {
        wp_die( __( 'No tienes permiso para acceder.', 'sh-executor' ) );
    }

    echo '<div class="wrap"><h1>Shell Executor</h1>';

    if ( isset( $_POST['sh_executor_nonce'] ) && wp_verify_nonce( $_POST['sh_executor_nonce'], 'sh_executor_run_script' ) ) {
        $script = sanitize_text_field( $_POST['script'] ?? '' );
        $full_path = realpath( SH_EXECUTOR_DIR . '/' . $script );

        if ( $full_path && strpos( $full_path, SH_EXECUTOR_DIR ) === 0 && is_executable( $full_path ) ) {
            $output = [];
            $return_var = 0;
            exec( escapeshellcmd( $full_path ) . ' 2>&1', $output, $return_var );

            echo '<h2>Resultado</h2><pre>' . esc_html( implode( "\n", $output ) ) . '</pre><p><strong>Exit code:</strong> ' . intval( $return_var ) . '</p>';
        } else {
            echo '<div class="notice notice-error"><p>' . __( 'Script inválido o no ejecutable.', 'sh-executor' ) . '</p></div>';
        }
    }

    $scripts = sh_executor_get_scripts();
    if ( empty( $scripts ) ) {
        echo '<p>' . __( 'No se encontraron scripts en la carpeta scripts/', 'sh-executor' ) . '</p>';
    } else {
        echo '<form method="post">';
        wp_nonce_field( 'sh_executor_run_script', 'sh_executor_nonce' );
        echo '<table class="widefat fixed striped"><thead><tr><th>Script</th><th>Acción</th></tr></thead><tbody>';
        foreach ( $scripts as $script ) {
            echo '<tr><td>' . esc_html( $script ) . '</td><td><button type="submit" name="script" value="' . esc_attr( $script ) . '" class="button button-primary">' . __( 'Ejecutar', 'sh-executor' ) . '</button></td></tr>';
        }
        echo '</tbody></table></form>';
    }

    echo '</div>';
}

// -----------------------------------------------------------------------------
// WP-CLI command
// -----------------------------------------------------------------------------
if ( defined( 'WP_CLI' ) && WP_CLI ) {
    WP_CLI::add_command( 'sh-executor', 'sh_executor_cli_command' );
}

function sh_executor_cli_command( $args ) {
    if ( empty( $args[0] ) ) {
        WP_CLI::error( 'Debes indicar el nombre del script.' );
    }

    $script = sanitize_text_field( $args[0] );
    $full_path = realpath( SH_EXECUTOR_DIR . '/' . $script );

    if ( ! $full_path || strpos( $full_path, SH_EXECUTOR_DIR ) !== 0 ) {
        WP_CLI::error( 'Script fuera de la ruta permitida.' );
    }

    if ( ! is_executable( $full_path ) ) {
        WP_CLI::error( 'El script no es ejecutable.' );
    }

    WP_CLI::line( 'Ejecutando: ' . $full_path );
    passthru( escapeshellcmd( $full_path ), $exit_code );
    WP_CLI::success( 'Exit code: ' . $exit_code );
}
