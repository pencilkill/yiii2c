<?php

/**
 * @copyright Copyright (c) 2014 Newerton Vargas de Araújo
 * @link http://newerton.com.br
 * @license http://www.opensource.org/licenses/bsd-license.php New BSD License
 * @package yii2-fancybox
 * @version 1.0.0
 */
namespace common\widgets\fancybox;

use yii\base\Widget;
use yii\helpers\Json;

/**
 * fancyBox is a tool that offers a nice and elegant way to add zooming
 * functionality for images, html content and multi-media on your webpages
 *
 * @author Newerton Vargas de Araújo <contato@newerton.com.br>
 * @since 1.0
 */
class FancyBox extends Widget
{

    /**
     *
     * @var type string target of the widget
     */
    public $target;

    /**
     *
     * @var type boolean whether to enable the easing functions. You must set the eansing on $config
     */
    public $helpers = true;

    /**
     *
     * @var type bollean whether to enable mouse interaction
     */
    public $mouse = true;
    // @ array of config settings for fancybox
    /**
     *
     * @var type array of config settings for fancybox
     */
    public $config = array();

    /**
     * @inheritdoc
     */
    public function init()
    {
        // publish the required assets
        $this->registerClientScript();
    }

    /**
     * @inheritdoc
     */
    public function run()
    {
        if (! empty($this->target))
        {
            $config = Json::encode($this->config);
            $view->registerJs("jQuery('{$this->target}').fancybox({$config});");
        }
    }

    /**
     * Registers required script for the plugin to work as DatePicker
     */
    public function registerClientScript()
    {
        $view = $this->getView();

        $assets = FancyBoxAsset::register($view);

        if ($this->mouse)
        {
            \common\widgets\mousewheel\MouseWheelAsset::register($view);
        }

        if ($this->helpers)
        {
            $view->registerCssFile($assets->baseUrl . '/helpers/jquery.fancybox-buttons.css', [
                \common\widgets\fancybox\FancyBoxAsset::className()
            ]);
            $view->registerCssFile($assets->baseUrl . '/helpers/jquery.fancybox-thumbs.css', [
                \common\widgets\fancybox\FancyBoxAsset::className()
            ]);

            $view->registerJsFile($assets->baseUrl . '/helpers/jquery.fancybox-buttons.js', [
                \common\widgets\fancybox\FancyBoxAsset::className()
            ]);
            $view->registerJsFile($assets->baseUrl . '/helpers/jquery.fancybox-media.js', [
                \common\widgets\fancybox\FancyBoxAsset::className()
            ]);
            $view->registerJsFile($assets->baseUrl . '/helpers/jquery.fancybox-thumbs.js', [
                \common\widgets\fancybox\FancyBoxAsset::className()
            ]);
        }
    }
}
