<?php
/**
 * @author Sam <mail.song.de.qiang@gmail.com>
 */
namespace common\widgets\swfupload;

use yii\web\AssetBundle;

class SWFUploadAsset extends AssetBundle
{

    public $sourcePath = '@webroot/common/widgets/swfupload/assets/';

    public $js = [
        'swfupload.js',
        'handlers.js',
    ];

    public $css = [
	   'default.css',
    ];
    
    public $depends = [
        'yii\web\JqueryAsset',
    ];
}