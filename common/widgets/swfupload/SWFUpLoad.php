<?php

/**
 * @author Sam <mail.song.de.qiang@gmail.com>
 * more about swfupload can be found at http://code.google.com/p/swfupload/, version: 2.5.2.
 */
namespace common\widgets\swfupload;

use yii\web\JsExpression;
use yii\base\Widget;
use yii\helpers\Json;
use yii\widgets\InputWidget;

class SWFUpload extends InputWidget
{

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
        parent::init();
        // publish the required assets
        \common\widgets\swfupload\SWFUploadAsset::register($this->getView());
    }

    /**
     * @inheritdoc
     */
    public function run()
    {
        session_id() || session_start();
        
        $publishUrl = $this->view->assetManager->publish('@common/widgets/swfupload/assets')[1];
        //
        $config = array(
            // Backend Settings
            'upload_url' => \yii\helpers\Url::base(),
            //'preserve_relative_urls' => false,
            'post_params' => array(
        	   'PHPSESSID' => session_id(),
            ),
            //'use_query_string' => false,
            //'requeue_on_error' => false,
            //'http_success' => [],
            //'assume_success_timeout' => 0,
            
            // File Upload Settings
            'file_post_name' => 'Filedata',
            'file_size_limit' => '2 MB',	// 2 MB
            'file_types' => '*.jpg',
            'file_types_description' => 'JPG Images',
            'file_upload_limit' => 0,
            'file_queue_limit' => 0,
            
            // Event Handler Settings - these functions as defined in Handlers.js
            //  The handlers are not part of SWFUpload but are part of my website and control how
            //  my website reacts to the SWFUpload events.
            //
            'swfupload_preload_handler' => new JsExpression('preLoad'),
            'swfupload_load_failed_handler' => new JsExpression('loadFailed'),
            'swfupload_loaded_handler' => new JsExpression('undefined'),
            
            //
            //'file_dialog_start_handler' => new JsExpression('undefined'),
            //'file_queued_handler' => new JsExpression('undefined'),
            'file_queue_error_handler' => new JsExpression('fileQueueError'),
            'file_dialog_complete_handler' => new JsExpression('fileDialogComplete'),
            
            //
            'upload_resize_start_handler' => new JsExpression('undefined'),
            'upload_start_handler' => new JsExpression('undefined'),
            'upload_progress_handler' => new JsExpression('uploadProgress'),
            'upload_error_handler' => new JsExpression('uploadError'),
            'upload_success_handler' => new JsExpression('uploadSuccess'),
            'upload_complete_handler' => new JsExpression('uploadComplete'),
            
            //
            //'mouse_click_handler' => new JsExpression('undefined'),
            //'mouse_out_handler' => new JsExpression('undefined'),
            //'mouse_over_handler' => new JsExpression('undefined'),
            
            // Button Settings
            'button_image_url' => "{$publishUrl}/images/SmallSpyGlassWithTransperancy_17x18.png",
            'button_placeholder_id' => "spanButtonPlaceholder{$this->id}",
            //'button_placeholder' => '',
            'button_width' => 18,
            'button_height' => 18,
            'button_text' => '<span class="btn-swf">Select Images <span class="btn-swf-xs">(2 MB Max)</span></span>',
            'button_text_style' => '.btn-swf { font-family: Helvetica, Arial, sans-serif; font-size: 12pt; } .btn-swf-xs { font-size: 10pt; }',
            'button_text_top_padding' => 0,
            'button_text_left_padding' => 18,
            //'button_action' => 'SWFUpload.BUTTON_ACTION.SELECT_FILES',
            //'button_disabled' => false,
            'button_cursor' => 'SWFUpload.CURSOR.HAND',
            'button_window_mode' => 'SWFUpload.WINDOW_MODE.TRANSPARENT',
            
            // Flash Settings
            'flash_url' => "{$publishUrl}/swfupload.swf",
            'flash9_url' => "{$publishUrl}/swfupload/swfupload_FP9.swf",
            //'prevent_swf_caching' => true,
            
            'custom_settings' => array(
                'upload_target' => "divFileProgressContainer{$this->id}",
                'publish_url' => $publishUrl,
                'thumbnails_id' => "thumbnails{$this->id}",
                'swfu' => "swfu{$this->id}"
            ),
            
            // Debug Settings
            //'debug_handler' => '',
            'debug' => false
        );
        
        $this->config = \yii\helpers\ArrayHelper::merge($config, $this->config);
        //
        $this->view->registerJs("var swfu{$this->id}; window.onload = function(){ swfu{$this->id} = new SWFUpload(" . Json::encode($this->config) . ");};", \yii\web\View::POS_END);
        
        return $this->view->render('@common/widgets/swfupload/views/image', [
            'widget' => $this
        ]);
    }
}