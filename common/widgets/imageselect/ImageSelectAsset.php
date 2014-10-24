<?php
/**
 * @author Sam <mail.song.de.qiang@gmail.com>
 */
namespace common\widgets\imageselect;

use yii\web\AssetBundle;

class ImageSelectAsset extends AssetBundle
{

    public $sourcePath = '@webroot/common/widgets/imageselect/assets/';

    public $js = [
        'jquery.imgareaselect.pack.js'
    ];

    public $css = [
        'imgareaselect-default.css'
    ];

    public $depends = [
        'yii\web\JqueryAsset'
    ];
}