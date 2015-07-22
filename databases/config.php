<?php

	// 从文件中读取 mysql 数据库用户、密钥等配置信息
class config {
			public $host;
		 	public $user;
			public $pass;
			public $upload_path;
			public $domain;
			public $key_1;

		public  Function read_config( $file_name ) {
			//解析配置文件
			$res=parse_ini_file($file_name);
			$this->host=@$res[host];
			$this->user=@$res[user];
			$this->pass=@$res[pass];
		}
	}
/*	$config=new config();
	$config->read_config('test.ini');
		echo $config->user."\r\n";
		echo $config->pass."\r\n";*/
	?>