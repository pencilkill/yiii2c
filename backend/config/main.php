<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'backend',
    'name' => 'My Company Administrator',
    'basePath' => dirname(__DIR__),
    'language' => 'zh-CN',
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log'],
    'modules' => [
		'rbac' => [
			'class' => 'mdm\admin\Module',
			'controllerMap' => [
				'assignment' => [
					'class' => 'mdm\admin\controllers\AssignmentController',
					'userClassName' => 'backend\models\Admin',
					'idField' => 'admin_id',
					'usernameField' => 'username',
					//'searchClass' => 'backend\models\search\Admin',
				]
			]
		],
	],
    'components' => [
        'user' => [
            'identityClass' => 'backend\models\Admin',
            'enableAutoLogin' => true,
        ],
        'assetManager' => [
			'basePath' => '@webroot/web',
			'baseUrl' => '@web/web',
		],
		'view' => [
			'theme' => [
				'pathMap' => ['@backend/views' => '@backend/themes/bootstrap/views'],
				'baseUrl' => '@web/web',
			],
		],
        'i18n' => [
            'translations' => [
                '*' => [
                    'class' => 'yii\i18n\PhpMessageSource',
                    'basePath' => '@backend/messages',
                    'sourceLanguage' => 'en_US',
                    'fileMap' => []
                    // 'app' => 'app.php',
                    // 'app/error' => 'error.php'
                    
                ]
            ]
        ],
        'authManager' => [
        	'class' => 'yii\rbac\DbManager',
        	'itemTable' => 'admin_item',
        	'itemChildTable' => 'admin_item_child',
        	'assignmentTable' => 'admin_assignment',
        	'ruleTable' => 'admin_rule',
		],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
    ],
    'as access' => [
    	'class' => 'mdm\admin\components\AccessControl',
    	'allowActions' => [
    		'*', // add or remove allowed actions to this list
    	]
	],
    'params' => $params,
];
