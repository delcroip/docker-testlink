<?php
/**
 * TestLink Open Source Project - http://testlink.sourceforge.net/
 * This script is distributed under the GNU General Public License 2 or later.
 *
 * Filename $RCSfile: custom_config.inc.php.example,v $
 *
 * @version $Revision: 1.7 $
 * @modified $Date: 2010/08/19 19:08:34 $ by $Author: franciscom $
 *
 * SCOPE:
 * Constants and configuration parameters used throughout TestLink DEFINED BY USERS.
 *
 * Use this file to overwrite configuration parameters (variables and defines)
 * present in:
 *             config.inc.php
 *             cfg/const.inc.php
 *-----------------------------------------------------------------------------
*/
$tlCfg->cookie->expire = (time()+60*60*24*30); // 30 days;
$tlCfg->cookie->domain = 'qa.openimis.org';
$tlCfg->cookie->secure = false;
$tlCfg->cookie->httponly = false;
$tlCfg->force_https = true;

$tlCfg->instance_name = 'openIMIS QA';
$tlCfg->password_reset_send_method = 'display_on_screen';
$tlCfg->document_generator->company_name = 'openIMIS initiative';
$tlCfg->document_generator->company_copyright = '2021 &copy; openIMIS';
$g_tl_admin_email     = 'support@openimis.org'; # for problem/error notification
$g_from_email         = 'support@openimis.org';  # email sender
$g_return_path_email  = 'support@openimis.org';


$tlCfg->sessionInactivityTimeout = 300;
// server should keep session data for 
ini_set('session.gc_maxlifetime', 300*60); // 300 minutes

// each client should remember their session id for
session_set_cookie_params(300*60); // 300 minutes



// *******************************************************************************
// *******************************************************************************
// Hint: After doing configuration changes, clean you Browser's cookies and cache
//
// use contents of this file as an example of custom configuration
//
// *******************************************************************************
//
// Uncomment this if you want dBug() display info
// define('DBUG_ON',1);

