<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\Admin */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->params['breadcrumbs'][] = Yii::t('v/Admin', 'Admins');
?>
<div class="admin-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create') . Yii::t('v/Admin', 'Admin'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            // 'admin_id',
            'username',
            // 'password_hash',
            // 'password_reset_token',
            // 'auth_key',
            'email:email',
            [
    			'filter' => [false => Yii::t('app', 'no'), true => Yii::t('app', 'yes')],
			    'attribute' => 'status',
			    'format' => 'raw',
			    'value' => function ($model, $index, $widget) {
			        return Html::checkbox('status', $model->status, ['value' => false, 'uncheck' => true]);
			    },
			],
            // 'created_at',
            // 'updated_at',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
