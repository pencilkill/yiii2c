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
                'class'     => 'frontend\gii\generators\crud\Generator',
                'templates' => [
                    'app' => '@frontend/gii/generators/crud/app'
                ],
                'template' => 'app',
                'enableI18N' => true,
                'messageCategory' => 'v/Example',
                'modelClass' => 'frontend\models\exampleModel',
                'searchModelClass' => 'frontend\models\search\example',
                'controllerClass' => 'frontend\controllers\exampleController',
            ],
            'model' => [
                'class'     => 'frontend\gii\generators\model\Generator',
                'ns' => 'frontend\models',
                'templates' => [
                    'app' => '@frontend/gii/generators/model/app'
                ],
                'template' => 'app',
                'enableI18N' => true,
                'messageCategory' => 'm/Example',
            ]
        ]
    ];
}

return $config;
