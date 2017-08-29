<?php
/**
 * File: ldap.php
 * Created on: Aug 10, 2010
 * Author: Luct
 * 
 */
 
$config['ldap_rdn']	= 'cn=admin,dc=com';	// User name

$config['ldap_password'] = '123456';			// Password
$config['ldap_server'] = 'ldap://192.168.2.106:389/'; // Server LDAP


$config['ldap_username_field'] = 'cn';
$config['ldap_fullname_field'] = 'sn';

$config['ldap_base_dn'] = 'ou=users,ou=nvspclaim,o=spectos,dc=com';
$config['ldap_role_dn'] = 'ou=roles,ou=nvspclaim,o=spectos,dc=com';

define('LDAP_DOMAIN_NAME', 'dn');
define('LDAP_USERNAME', 'cn');
define('LDAP_CUSTOMER_ID', 'customerId');
define('LDAP_STORE_ID', 'storeId');
define('LDAP_PASSWORD', 'userPassword');
define('LDAP_COMPANY_NAME', 'sn');
define('LDAP_EMAIL', 'email');
define('LDAP_PREFERRED_LANGUAGE', 'preferredLanguage');
define('LDAP_ENABLED', 'userEnabled');
define('LDAP_DESCRIPTION', 'description');
define('LDAP_FULL_NAME', 'name');
define('LDAP_TELEPHONE_NUMBER', 'telephoneNumber');
define('LDAP_ACTIVATION_START', 'activationstart');
define('LDAP_ACTIVATION_END', 'activationend');
define('LDAP_ROLE_NAME', 'rolename');
define('LDAP_HOUSE_NUMBER', 'houseIdentifier');
define('LDAP_STREET', 'street');
define('LDAP_CITY', 'city');
define('LDAP_COUNTRY', 'countryName');
define('LDAP_POSTCODE', 'postalCode');

$config['user_attributes'] = array(LDAP_USERNAME, LDAP_CUSTOMER_ID, LDAP_PASSWORD, LDAP_FULL_NAME, LDAP_EMAIL,
			LDAP_STORE_ID, LDAP_PREFERRED_LANGUAGE, LDAP_ENABLED, LDAP_DESCRIPTION,
			LDAP_COMPANY_NAME, LDAP_TELEPHONE_NUMBER, LDAP_DOMAIN_NAME,
			LDAP_ACTIVATION_START, LDAP_ACTIVATION_END, LDAP_ROLE_NAME,
			LDAP_HOUSE_NUMBER, LDAP_STREET, LDAP_CITY, LDAP_COUNTRY, LDAP_POSTCODE);

?>
