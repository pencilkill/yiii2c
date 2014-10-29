<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
    	'db' => [
			'class' => 'yii\db\Connection',
			'dsn' => 'mysql:host=localhost;dbname=yii2advanced',
			'username' => 'root',
			'password' => '',
			'charset' => 'utf8'
		],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
    ],
];
