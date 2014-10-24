<?php

/**
 * @author Sam <mail.song.de.qiang@gmail.com>
 * more about imgareaselect can be found at http://odyniec.net/projects/imgareaselect/, version: 0.9.10.
 */
namespace common\widgets\imageselect;

use yii\base\Widget;
use yii\helpers\Json;

/**
 * fancyBox is a tool that offers a nice and elegant way to add zooming
 * functionality for images, html content and multi-media on your webpages
 *
 * @author Newerton Vargas de Araújo <contato@newerton.com.br>
 * @since 1.0
 */
class ImageSelect extends Widget
{

    /**
     *
     * @var type string target of the widget
     */
    public $target;

    /**
     *
     * @var type array of config settings for imageselect
     */
    public $config = array();

    /**
     * @inheritdoc
     */
    public function init()
    {
        // publish the required assets
        \common\widgets\imageselect\ImageSelectAsset::register($this->getView());
    }

    /**
     * @inheritdoc
     */
    public function run()
    {
        if (! empty($this->target))
        {
            $config = Json::encode($this->config);
            $view->registerJs("jQuery('{$this->target}').imgAreaSelect({$config});");
        }
    }
}
