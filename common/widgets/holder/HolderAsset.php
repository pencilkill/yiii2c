<?php
/**
 * @author Sam <mail.song.de.qiang@gmail.com>
 */
namespace common\widgets\holder;

use yii\web\AssetBundle;

class HolderAsset extends AssetBundle
{

    public $sourcePath = '@webroot/common/widgets/holder/assets/';

    public $js = [
        'holder.js'
    ];

    public $depends = [
        'yii\web\JqueryAsset'
    ];
}