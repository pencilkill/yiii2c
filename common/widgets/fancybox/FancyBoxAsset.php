<?php
/**
 * @author Sam <mail.song.de.qiang@gmail.com>
 */
namespace common\widgets\fancybox;

use yii\web\AssetBundle;

class FancyBoxAsset extends AssetBundle
{

    public $sourcePath = '@webroot/common/widgets/fancybox/assets/';

    public $js = [
        'jquery.fancybox.pack.js'
    ];

    public $css = [
        'jquery.fancybox.css'
    ];

    public $depends = [
        'yii\web\JqueryAsset'
    ];
}