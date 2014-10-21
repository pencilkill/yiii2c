<?php

$config = [
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => '',
        ],
    ],
];

if (!YII_ENV_TEST) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = 'yii\debug\Module';

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
        'generators' => [
            'crud' => [
                'class'     => 'backend\gii\generators\crud\Generator',
                'templates' => [
                    'app' => '@backend/gii/generators/crud/app'
                ],
                'template' => 'app',
                'enableI18N' => true,
                'messageCategory' => 'v/Example',
                'modelClass' => 'backend\models\exampleModel',
                'searchModelClass' => 'backend\models\search\example',
                'controllerClass' => 'backend\controllers\exampleController',
            ],
            'model' => [
                'class'     => 'backend\gii\generators\model\Generator',
                'ns' => 'backend\models',
                'templates' => [
                    'app' => '@backend/gii/generators/model/app'
                ],
                'template' => 'app',
                'enableI18N' => true,
                'messageCategory' => 'm/Example',
            ]
        ]
    ];
}

return $config;
