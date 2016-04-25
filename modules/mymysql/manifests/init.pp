class mymysql {
	include mysql
	mysql::db {'irkb':}
	mysql::db {'datawarehouse':}
	mysql::db {'mydb':}
	mysql::db {'mediatank-identity':}
	mysql::db {'mediatank-assets':}
	mysql::db {'wrapitin':}
	mysql::db {'es6_example':}
	mysql::db {'skylab_website':}
	mysql::db {'swimming':}
}