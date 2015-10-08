<?php
// =================================================================
// Local config file, add customizations to `wp-config.php` to
// this file. It will be included by default on `localhost`.
// =================================================================

// =================================================================
// MySQL settings - Pre-configured for included Vagrantfile;
// changing these can bork your install
// =================================================================

define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'wordpress' );
define( 'DB_PASSWORD', 'wordpress' );
define( 'DB_HOST', 'localhost' );

// =================================================================
// Enable Debug Mode
// =================================================================

define( 'SAVEQUERIES', true );
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_DISPLAY', true);
