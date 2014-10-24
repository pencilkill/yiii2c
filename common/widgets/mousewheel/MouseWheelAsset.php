<?php
/**
 * @author Sam <mail.song.de.qiang@gmail.com>
 */
namespace common\widgets\mousewheel;

use yii\web\AssetBundle;

class MouseWheelAsset extends AssetBundle
{

    public $sourcePath = '@webroot/common/widgets/mousewheel/assets/';

    public $js = [
        'jquery.mousewheel.pack.js'
    ];

    public $depends = [
        'yii\web\JqueryAsset'
    ];
}