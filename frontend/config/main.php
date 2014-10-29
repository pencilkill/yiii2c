<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'frontend',
    'name' => 'My Company',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'frontend\controllers',
    'components' => [
        'user' => [
            'identityClass' => 'frontend\models\Customer',
            'enableAutoLogin' => true,
        ],
        'assetManager' => [
			'basePath' => '@webroot/web',
			'baseUrl' => '@web/web',
		],
		'view' => [
			'theme' => [
				'pathMap' => ['@frontend/views' => '@frontend/themes/bootstrap/views'],
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
    'params' => $params,
];
