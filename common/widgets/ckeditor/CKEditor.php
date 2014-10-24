<?php
namespace common\widgets\ckeditor;

/**
 *
 * @author Sam <mail.song.de.qiang@gmail.com>
 * @example for basic:
 *          <?php \common\widgets\ckeditor\CKEditor::widget(array('model'=>$model, 'attribute'=>'content', 'value'=>$model->content)); ?>
 * @example for single: in this case, textarea tag is not included
 *          <?php \common\widgets\ckeditor\CKEditor::widget(array('options'=>array('id'=>'textarea_id'))); ?>
 * @example for name and value: in this case, value is not requried:
 *          <?php \common\widgets\ckeditor\CKEditor::widget(array('options'=>array('name'=>Html::activeName($model, 'content'))), 'value'=>$model->content); ?>
 * @example for multiple: in this case, textarea tag is not included
 *          <?php \common\widgets\ckeditor\CKEditor::widget(array('options'=>array('class'=>'textarea_class'))); ?>
 */
use yii\helpers\Html;
use yii\helpers\Json;

class CKEditor extends \yii\widgets\InputWidget
{

    const CKEDITOR_INSTANCE_CLASS = 'ckeditor';

    const CKEDITOR_CLASS = 'editor';

    /**
     * using as ckfinder instance id to identify different application
     */
    public $token;

    public $config;

    /**
     * using this ckeditor configuration as CKEditor.config
     * in this case, we can use $('editor').ckeditor() without extra config on fly
     */
    public $useAsGlobal = false;

    public function init()
    {
        parent::init();
        
        if ($this->token === null)
        {
            $this->token = Yii::$app->id;
        }

        if (empty($this->value))
        {
            $this->value = '';
        }

        /**
         * class 'ckeditor' is the default selector
         * IE will trigger uncaught exception for a already ckeditor instance
         */
        if (isset($this->options['class']) && $this->options['class'] === self::CKEDITOR_INSTANCE_CLASS)
        {
            $this->options['class'] = self::CKEDITOR_CLASS;
        }
    }

    public function run()
    {
        //
        \yii\web\JqueryAsset::register($this->getView());
        $this->getView()->registerJsFile('@web/ckeditor/ckeditor.js');
        $this->getView()->registerJsFile('@web/ckeditor/adapters/jquery.js');
        //
        $adapter = '.' . self::CKEDITOR_CLASS;
        if (isset($this->options['class']))
        {
            $adapter = '.' . $this->options['class'];
        }
        elseif (isset($this->options['id']))
        {
            $adapter = '#' . $this->options['id'];
        }
        elseif (isset($this->options['name']))
        {
            $adapter = '[name="' . $this->options['name'] . '"]';
        }

        $config = [
            'customConfig' => \yii\helpers\Url::to('@web/ckeditor/config.js.php?id=' . md5($this->token))
        ];

        if (isset($this->config))
        {
            $config = \yii\helpers\ArrayHelper::merge($config, $this->config);
        }

        if ($this->useAsGlobal)
        {
            $this->getView()->registerJs("jQuery.extend(true, CKEDITOR.config, " . Json::encode($config) . " || {});");
        }

        if ($adapter)
        {
            $this->getView()->registerJs("$('{$adapter}').ckeditor(" . Json::encode($config) . ");");
        }
    }
}
?>