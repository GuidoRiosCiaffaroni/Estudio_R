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
    exit; // Impide el acceso directo.
}

//--------------------------------------------------
// 1. CONFIGURACIÓN BÁSICA: DIRECTORIO DE SCRIPTS
//--------------------------------------------------
if ( ! defined( 'SH_EXECUTOR_DIR' ) ) {
    // scripts/ dentro del plugin → .../wp-content/plugins/sh-executor/scripts/
    define( 'SH_EXECUTOR_DIR', trailingslashit( plugin_dir_path( __FILE__ ) ) . 'scripts' );
}

//--------------------------------------------------
// 2. ACTIVACIÓN / DESACTIVACIÓN
//--------------------------------------------------
register_activation_hook( __FILE__, 'sh_executor_activate' );
register_deactivation_hook( __FILE__, 'sh_executor_deactivate' );

function sh_executor_activate() {
    // Crea la carpeta scripts si no existe
    if ( ! file_exists( SH_EXECUTOR_DIR ) ) {
        wp_mkdir_p( SH_EXECUTOR_DIR );
    }

    // Capability personalizada
    $role = get_role( 'administrator' );
    if ( $role && ! $role->has_cap( 'sh_executor_run' ) ) {
        $role->add_cap( 'sh_executor_run' );
    }
}

function sh_executor_deactivate() {
    $role = get_role( 'administrator' );
    if ( $role && $role->has_cap( 'sh_executor_run' ) ) {
        $role->remove_cap( 'sh_executor_run' );
    }
}

//--------------------------------------------------
// 3. MENÚ DE ADMINISTRACIÓN
//--------------------------------------------------
add_action( 'admin_menu', 'sh_executor_admin_menu' );

function sh_executor_admin_menu() {
    add_management_page(
        __( 'Shell Executor', 'sh-executor' ),
        __( 'Shell Executor', 'sh-executor' ),
        'sh_executor_run',
        'sh-executor',
        'sh_executor_admin_page'
    );
}

function sh_executor_admin_page() {
    if ( ! current_user_can( 'sh_executor_run' ) ) {
        wp_die( __( 'No tienes permiso para ejecutar scripts.', 'sh-executor' ) );
    }

    // Procesar ejecución
    if ( isset( $_POST['sh_executor_nonce'] ) && wp_verify_nonce( $_POST['sh_executor_nonce'], 'sh_executor_run_script' ) ) {
        $selected = sanitize_text_field( $_POST['sh_script'] ?? '' );
        $result   = sh_executor_run_script( $selected );
        echo '<div class="notice notice-info"><pre>' . esc_html( $result ) . '</pre></div>';
    }

    // Listar scripts disponibles
    $scripts = sh_executor_get_scripts();
    ?>
    <div class="wrap">
        <h1><?php _e( 'Shell Executor', 'sh-executor' ); ?></h1>
        <?php if ( empty( $scripts ) ) : ?>
            <p><?php _e( 'No se encontraron scripts en la carpeta scripts/.', 'sh-executor' ); ?></p>
        <?php else : ?>
            <form method="post">
                <?php wp_nonce_field( 'sh_executor_run_script', 'sh_executor_nonce' ); ?>
                <table class="form-table" role="presentation">
                    <tr>
                        <th scope="row"><label for="sh_script"><?php _e( 'Selecciona un script', 'sh-executor' ); ?></label></th>
                        <td>
                            <select name="sh_script" id="sh_script">
                                <?php foreach ( $scripts as $script ) : ?>
                                    <option value="<?php echo esc_attr( basename( $script ) ); ?>"><?php echo esc_html( basename( $script ) ); ?></option>
                                <?php endforeach; ?>
                            </select>
                            <p class="description"><?php printf( __( 'Directorio: %s', 'sh-executor' ), SH_EXECUTOR_DIR ); ?></p>
                        </td>
                    </tr>
                </table>
                <?php submit_button( __( 'Run script', 'sh-executor' ) ); ?>
            </form>
        <?php endif; ?>
    </div>
    <?php
}

//--------------------------------------------------
// 4. FUNCIONES CORE
//--------------------------------------------------
function sh_executor_get_scripts() {
    return glob( SH_EXECUTOR_DIR . '*.sh' ) ?: [];
}

function sh_executor_run_script( $filename ) {
    $filepath = realpath( SH_EXECUTOR_DIR . $filename );

    // Seguridad: comprueba ruta y extensión
    if ( ! $filepath || strpos( $filepath, SH_EXECUTOR_DIR ) !== 0 || pathinfo( $filepath, PATHINFO_EXTENSION ) !== 'sh' ) {
        return __( 'Script no permitido.', 'sh-executor' );
    }

    // Garantiza permisos de ejecución
    if ( ! is_executable( $filepath ) ) {
        @chmod( $filepath, 0750 );
    }

    // Ejecuta y captura salida
    $cmd = escapeshellcmd( $filepath );
    $output = [];
    $return_var = 0;
    exec( $cmd . ' 2>&1', $output, $return_var );

    return sprintf( "%s\n-----------------------\nExit code: %d", implode( "\n", $output ), $return_var );
}

//--------------------------------------------------
// 5. WP‑CLI COMMAND
//--------------------------------------------------
if ( defined( 'WP_CLI' ) && WP_CLI ) {
    WP_CLI::add_command( 'sh-executor', 'sh_executor_cli_command' );
}

function sh_executor_cli_command( $args, $assoc_args ) {
    $filename = $args[0] ?? '';
    if ( empty( $filename ) ) {
        WP_CLI::error( 'Debes indicar el nombre del script. Ej: wp sh-executor mi_script.sh' );
    }

    $result = sh_executor_run_script( $filename );
    WP_CLI::line( $result );
}
