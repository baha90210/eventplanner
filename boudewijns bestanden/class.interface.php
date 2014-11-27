<?php
	interface system_user{
		public function login();
		public function logout();
	}
	class gebruiker implements system_user{
		public function login(){
			echo "gebruiker is ingelogd";
		}
		public function logout(){
			echo "gebruiker is uitgelogd";
		}
		public function whois(){
			echo "ik ben een gebruiker";
		}
	}

	
	class administrator implements system_user{
		public function login(){
			echo "admin is ingelogd";
		}
		public function logout(){
			echo "admin is uitgelogd";
		}
		public function whois(){
			echo "ik ben een admin";
		}
	}

	
	function login($username,$password){
		if($username == "admin" && $password == "demodemo") {
			return new administrator;
		}else{
			return new gebruiker;
		}
	}
	$user = login('admin','12345');
	$user->whois();
	$user->logout();
	

	