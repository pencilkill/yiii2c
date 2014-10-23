<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle{
	public $sourcePath = '@frontend/themes/bootstrap/web';
	public $css = [
		'css/site.css'
	];
	public $js = [];
	public $depends = [
		'yii\web\YiiAsset',
		'yii\bootstrap\BootstrapAsset'
	];

	public function init() {
		// Actually, for jQuery position
		$this->jsOptions = ['position' => \yii\web\View::POS_HEAD];
	}
}
