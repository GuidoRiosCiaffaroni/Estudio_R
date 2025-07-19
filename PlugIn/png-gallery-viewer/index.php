<?php
/**
 * Plugin Name: PNG Gallery Viewer
 * Plugin URI:  https://fundacionkimen.cl/plugin/png-gallery-viewer
 * Description: Shortcode [png_gallery columns="4" lazy="yes"] que muestra todas las imágenes PNG ubicadas en /wp-content/plugins/sh-executor/archives/.
 * Version:     1.1.0
 * Author:      Guido Rios Ciaffaroni
 * License:     GPLv2 or later
 * License URI: https://www.gnu.org/licenses/gpl-2.0.html
 * Text Domain: png-gallery-viewer
 * Domain Path: /languages
 */


if ( ! defined( 'ABSPATH' ) ) {
    exit; // Exit if accessed directly.
}

final class PNG_Gallery_Viewer {

    const VERSION      = '1.2.0';
    const TEXT_DOMAIN  = 'png-gallery-viewer';
    const STYLE_HANDLE = 'png-gallery-viewer-style';

    /**
     * Ruta absoluta y URL pública al directorio de imágenes.
     */
    private string $dir_path;
    private string $dir_url;

    public function __construct() {
        // Directorio donde residen las imágenes PNG.
        $this->dir_path = trailingslashit( WP_PLUGIN_DIR . '/sh-executor/archives' );
        $this->dir_url  = trailingslashit( content_url( 'plugins/sh-executor/archives' ) );

        add_shortcode( 'png_gallery', [ $this, 'shortcode_handler' ] );
        add_action( 'wp_enqueue_scripts', [ $this, 'register_style' ] );
    }

    /**
     * Registra un handle de estilo vacío; CSS se inyecta en línea.
     */
    public function register_style() {
        wp_register_style( self::STYLE_HANDLE, false, [], self::VERSION );
    }

    /**
     * Callback del shortcode para renderizar la galería.
     *
     * @param array $atts Atributos del shortcode.
     * @return string     HTML generado.
     */
    public function shortcode_handler( $atts ): string {
        $atts = shortcode_atts(
            [
                'columns' => 4,    // Nº de columnas (1‑6)
                'lazy'    => 'yes',
                'width'   => '',   // Ancho en px (vacío = responsive)
                'height'  => ''    // Alto  en px (vacío = auto)
            ],
            $atts,
            'png_gallery'
        );

        $columns = max( 1, min( 6, absint( $atts['columns'] ) ) );
        $lazy    = ( 'yes' === strtolower( $atts['lazy'] ) );
        $width   = trim( $atts['width'] );
        $height  = trim( $atts['height'] );

        if ( ! is_dir( $this->dir_path ) || ! is_readable( $this->dir_path ) ) {
            return esc_html__( 'Directory not found or not readable.', self::TEXT_DOMAIN );
        }

        $files = glob( $this->dir_path . '*.png' );
        if ( empty( $files ) ) {
            return esc_html__( 'No PNG images were found.', self::TEXT_DOMAIN );
        }

        // Enqueue style and inject CSS.
        wp_enqueue_style( self::STYLE_HANDLE );
        $this->maybe_add_inline_style();

        // Construir galería.
        $html  = '<div class="png-gallery-viewer" style="--pgv-columns:' . esc_attr( $columns ) . ';">';
        foreach ( $files as $file ) {
            $url  = esc_url( $this->dir_url . basename( $file ) );
            $alt  = esc_attr( basename( $file ) );
            $style = '';

            if ( $width !== '' || $height !== '' ) {
                $style_attr = [];
                if ( $width  !== '' && is_numeric( $width ) )  { $style_attr[] = 'width:' . absint( $width ) . 'px';  }
                if ( $height !== '' && is_numeric( $height ) ) { $style_attr[] = 'height:' . absint( $height ) . 'px'; }
                $style = ' style="' . esc_attr( implode( ';', $style_attr ) ) . '"';
            }

            $html .= '<figure class="pgv-item"><img src="' . $url . '" alt="' . $alt . '"' . ( $lazy ? ' loading="lazy"' : '' ) . $style . '></figure>';
        }
        $html .= '</div>';

        return $html;
    }

    /**
     * Añade CSS inline la primera vez que se solicita.
     */
    private function maybe_add_inline_style(): void {
        static $added = false;
        if ( $added ) {
            return;
        }

        $css = '
        .png-gallery-viewer {
            display: grid;
            grid-template-columns: repeat(var(--pgv-columns,4), 1fr);
            gap: 1rem;
            margin: 1rem 0;
        }
        .png-gallery-viewer img {
            width: 100%;
            height: auto;
            display: block;
            border-radius: 4px;
            box-shadow: 0 1px 4px rgba(0,0,0,.12);
        }
        ';
        wp_add_inline_style( self::STYLE_HANDLE, $css );
        $added = true;
    }
}

new PNG_Gallery_Viewer();
