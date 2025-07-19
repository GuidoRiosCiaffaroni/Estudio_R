<?php
/**
 * Plugin Name: CSV Import
 * Plugin URI:  https://fundacionkimen/plugin/csv-import
 * Description: Ejecuta scripts .sh almacenados dentro de la carpeta del propio plugin (subcarpeta "scripts") mediante la interfaz de administración.
 * Version:     0.1.0
 * Author:      Guido Rios Ciaffaroni
 * License:     GPLv2 or later
 * Text Domain: csv-import
 */

if ( ! defined( 'ABSPATH' ) ) {
    exit; // Evita el acceso directo.
}

class CSV_Importer_Plugin {

    const VERSION = '0.1.0';
    const TABLE   = 'csv_importer';

    public function __construct() {
        register_activation_hook( __FILE__, [ $this, 'activate' ] );
        register_uninstall_hook( __FILE__, [ __CLASS__, 'uninstall' ] );

        add_action( 'admin_menu', [ $this, 'add_menu' ] );
        add_shortcode( 'csv_importer_table', [ $this, 'render_table_shortcode' ] );
    }

    /**
     * Crea la tabla personalizada al activar el plugin.
     */
    public function activate() {
        global $wpdb;

        $charset_collate = $wpdb->get_charset_collate();
        $table_name      = $wpdb->prefix . self::TABLE;

        $sql = "CREATE TABLE IF NOT EXISTS $table_name (
            id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
            col1 VARCHAR(255) NULL,
            col2 VARCHAR(255) NULL,
            col3 VARCHAR(255) NULL,
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY  (id)
        ) $charset_collate;";

        require_once ABSPATH . 'wp-admin/includes/upgrade.php';
        dbDelta( $sql );

        add_option( 'csv_importer_version', self::VERSION );
    }

    /**
     * Elimina la tabla y las opciones al desinstalar el plugin.
     */
    public static function uninstall() {
        global $wpdb;
        $table_name = $wpdb->prefix . self::TABLE;
        $wpdb->query( "DROP TABLE IF EXISTS $table_name;" );
        delete_option( 'csv_importer_version' );
    }

    /**
     * Añade el submenú en el panel de administración.
     */
    public function add_menu() {
        add_menu_page(
            __( 'CSV Importer', 'csv-importer' ),
            'CSV Importer',
            'manage_options',
            'csv-importer',
            [ $this, 'admin_page' ],
            'dashicons-media-spreadsheet'
        );
    }

    /**
     * Página de administración: formulario de subida y lista de importaciones.
     */
    public function admin_page() {
        if ( ! current_user_can( 'manage_options' ) ) {
            return;
        }

        // Procesa la carga si corresponde.
        if ( isset( $_POST['csv_importer_nonce'] ) && wp_verify_nonce( $_POST['csv_importer_nonce'], 'csv_importer_upload' ) ) {
            $this->handle_upload();
        }

        echo '<div class="wrap"><h1>CSV Import</h1>';
        echo '<form method="post" enctype="multipart/form-data">';
        wp_nonce_field( 'csv_importer_upload', 'csv_importer_nonce' );
        echo '<input type="file" name="csv_file" accept=".csv" required style="margin-bottom:10px;">';
        submit_button( 'Importar CSV' );
        echo '</form></div>';
    }

    /**
     * Gestiona la subida del fichero y la importación.
     */
    private function handle_upload() {
        if ( ! isset( $_FILES['csv_file'] ) ) {
            $this->admin_notice( 'error', 'No se encontró el archivo.' );
            return;
        }

        $file = $_FILES['csv_file'];

        if ( $file['error'] !== UPLOAD_ERR_OK ) {
            $this->admin_notice( 'error', 'Error al subir el archivo (código ' . $file['error'] . ').' );
            return;
        }

        $upload_overrides = [ 'test_form' => false ];
        $movefile         = wp_handle_upload( $file, $upload_overrides );

        if ( $movefile && ! isset( $movefile['error'] ) ) {
            $inserted = $this->import_csv( $movefile['file'] );
            $this->admin_notice( 'success', 'Importación finalizada. Filas insertadas: ' . intval( $inserted ) . '.' );
        } else {
            $this->admin_notice( 'error', 'Error: ' . esc_html( $movefile['error'] ) );
        }
    }

    /**
     * Lee el CSV y lo inserta en la tabla personalizada.
     *
     * @param string $filepath
     * @return int Filas insertadas.
     */
    private function import_csv( $filepath ) {
        global $wpdb;
        $table_name = $wpdb->prefix . self::TABLE;

        $handle = fopen( $filepath, 'r' );
        if ( ! $handle ) {
            return 0;
        }

        // Extrae encabezados.
        $headers = fgetcsv( $handle );
        if ( ! $headers ) {
            fclose( $handle );
            return 0;
        }

        $inserted = 0;
        while ( ( $data = fgetcsv( $handle ) ) !== false ) {
            $row = array_combine( $headers, $data );

            // Ajusta los nombres de las columnas según tu CSV.
            $wpdb->insert(
                $table_name,
                [
                    'col1' => $row['col1'] ?? null,
                    'col2' => $row['col2'] ?? null,
                    'col3' => $row['col3'] ?? null,
                ],
                [ '%s', '%s', '%s' ]
            );
            $inserted++;
        }
        fclose( $handle );
        return $inserted;
    }

    /**
     * Shortcode para mostrar la tabla en el frontend: [csv_importer_table]
     *
     * @param array $atts
     * @return string
     */
    public function render_table_shortcode( $atts ) {
        global $wpdb;
        $table_name = $wpdb->prefix . self::TABLE;
        $rows       = $wpdb->get_results( "SELECT * FROM $table_name ORDER BY id DESC LIMIT 100", ARRAY_A );

        if ( empty( $rows ) ) {
            return '<p>No hay datos importados.</p>';
        }

        ob_start();
        echo '<table class="wp-list-table widefat fixed striped">';
        echo '<thead><tr>';
        foreach ( array_keys( $rows[0] ) as $col ) {
            echo '<th>' . esc_html( $col ) . '</th>';
        }
        echo '</tr></thead><tbody>';

        foreach ( $rows as $row ) {
            echo '<tr>';
            foreach ( $row as $cell ) {
                echo '<td>' . esc_html( $cell ) . '</td>';
            }
            echo '</tr>';
        }
        echo '</tbody></table>';
        return ob_get_clean();
    }

    /**
     * Helper para mostrar avisos de administración.
     */
    private function admin_notice( $type, $message ) {
        echo '<div class="notice notice-' . esc_attr( $type ) . ' is-dismissible"><p>' . esc_html( $message ) . '</p></div>';
    }
}

new CSV_Importer_Plugin();

?>
