<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'dollar' );

/** MySQL database password */
define( 'DB_PASSWORD', '12345' );

/** MySQL hostname */
define( 'DB_HOST', '10.102.219.156' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'M ]>gGHF=rw^!46-e*BwT3uE8pf:V@tX.LZ#i}oK9Key&OY!RhVOSO725lc8D@o+' );
define( 'SECURE_AUTH_KEY',  'y~|ZrOE7)@JNdUy,U<,: ^nr)dSre{@[MKNqX<C@/1UK:g~Ihe1Isc_<)W`z?A![' );
define( 'LOGGED_IN_KEY',    'LZ$G+AR?b2 n{Dtv;4*M#W`o)PzQfB*aC$*&Vz=7DeA?+}~,>d%./gqFs~0=QOC}' );
define( 'NONCE_KEY',        'M79d^U@}T:]0pZ|d> rJjr|?S1-|qrpsPlgzyl5ry6kW(qe0BhCKg>l}^jK{5+`-' );
define( 'AUTH_SALT',        '}Fc%if ]e1k8Q~/(4:>I;~dEmIPx}E8ecXAjP63@txF2/3T3Wh?BzrYetftLH2->' );
define( 'SECURE_AUTH_SALT', 'Akh|aDo8^j1jjQPwWMkL?AQ?|8{(I 8G`|~6MAtI$2J9+IGnG`DRcK(iCUpfHve]' );
define( 'LOGGED_IN_SALT',   '9ylz7=qEl00@QYfkTfQ@]|d-j,r^VEfPc<SmU+5!aa@SU@cm~vVih6.@, h.tIHH' );
define( 'NONCE_SALT',       '!x]j?EAKjdw]L(#7{:|?T/Db x|oBVt3TIO33mQl9kS_!E6.T]ly4l=V?s-e|x& ' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
