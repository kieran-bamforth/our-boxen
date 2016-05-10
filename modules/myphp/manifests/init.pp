class myphp {
	class { 'php::global': version => '5.6.9'}
	include php::composer
	php::extension::intl { 'intl for 5.6.9': php => '5.6.9', version => '3.0.0'}
	php::extension::xdebug { 'xdebug for 5.6.9': php => '5.6.9', version => '2.3.2' }
	php::extension::imagick { 'imagick for 5.6.9': php => '5.6.9', version => '3.0.0' } 
}
