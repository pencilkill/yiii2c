<?php
/**
 * @author Sam <mail.song.de.qiang@gmail.com>
 */
namespace common\widgets\bootbox;

use yii\web\AssetBundle;

class BootBoxAsset extends AssetBundle
{

    public $sourcePath = '@webroot/common/widgets/bootbox/assets/';

    public $js = [
        'bootbox.min.js'
    ];

    public $depends = [
        'yii\bootstrap\BootstrapAsset',
        'yii\bootstrap\BootstrapPluginAsset',
    ];
}