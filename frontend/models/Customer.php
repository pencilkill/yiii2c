<?php
namespace frontend\models;

use Yii;
use yii\base\NotSupportedException;
use yii\behaviors\TimestampBehavior;
use yii\web\IdentityInterface;
/**
 * This is the model class for table "customer".
 *
 * @property integer $customer_id
 * @property string $customer_type_id
 * @property string $username
 * @property string $password_hash
 * @property string $password_reset_token
 * @property string $auth_key
 * @property string $email
 * @property string $first_name
 * @property string $last_name
 * @property integer $approval
 * @property integer $status
 * @property string $create_at
 * @property string $update_at
 *
 * @property CustomerType $customerType
 */
class Customer extends \yii\db\ActiveRecord implements IdentityInterface
{
	const STATUS_DELETED = 0;
	const STATUS_ACTIVE = 10;
	const ROLE_USER = 10;
	
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'customer';
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
    	return [
    		TimestampBehavior::className(),
    	];
    }
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'password_hash', 'auth_key', 'email'], 'required'],
            [['approval', 'status'], 'integer'],
            [['customer_type_id', 'created_at', 'updated_at'], 'safe'],
            [['username', 'password_hash', 'password_reset_token', 'auth_key', 'first_name', 'last_name'], 'string', 'max' => 64],
            [['email'], 'string', 'max' => 256]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'customer_id' => Yii::t('m/Customer', 'Customer ID'),
            'customer_type_id' => Yii::t('m/Customer', 'Customer Type ID'),
            'username' => Yii::t('m/Customer', 'Username'),
            'password_hash' => Yii::t('m/Customer', 'Password Hash'),
            'password_reset_token' => Yii::t('m/Customer', 'Password Reset Token'),
            'auth_key' => Yii::t('m/Customer', 'Auth Key'),
            'email' => Yii::t('m/Customer', 'Email'),
            'first_name' => Yii::t('m/Customer', 'First Name'),
            'last_name' => Yii::t('m/Customer', 'Last Name'),
            'approval' => Yii::t('m/Customer', 'Approval'),
            'status' => Yii::t('m/Customer', 'Status'),
            'created_at' => Yii::t('m/Customer', 'Created At'),
            'updated_at' => Yii::t('m/Customer', 'Updated At'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCustomerType()
    {
        return $this->hasOne(CustomerType::className(), ['customer_type_id' => 'customer_type_id']);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
    	return static::findOne(['customer_id' => $id, 'status' => self::STATUS_ACTIVE]);
    }
    
    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
    	throw new NotSupportedException('"findIdentityByAccessToken" is not implemented.');
    }
    
    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
    	return static::findOne(['username' => $username, 'status' => self::STATUS_ACTIVE]);
    }
    
    /**
     * Finds user by password reset token
     *
     * @param string $token password reset token
     * @return static|null
     */
    public static function findByPasswordResetToken($token)
    {
    	if (!static::isPasswordResetTokenValid($token)) {
    		return null;
    	}
    
    	return static::findOne([
    		'password_reset_token' => $token,
    		'status' => self::STATUS_ACTIVE,
		]);
    }
    
    /**
     * Finds out if password reset token is valid
     *
     * @param string $token password reset token
     * @return boolean
     */
    public static function isPasswordResetTokenValid($token)
    {
    	if (empty($token)) {
    		return false;
    	}
    	$expire = Yii::$app->params['user.passwordResetTokenExpire'];
    	$parts = explode('_', $token);
    	$timestamp = (int) end($parts);
    	return $timestamp + $expire >= time();
    }
    
    /**
     * @inheritdoc
     */
    public function getId()
    {
    	return $this->getPrimaryKey();
    }
    
    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
    	return $this->auth_key;
    }
    
    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
    	return $this->getAuthKey() === $authKey;
    }
    
    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return boolean if password provided is valid for current user
     */
    public function validatePassword($password)
    {
    	return Yii::$app->security->validatePassword($password, $this->password_hash);
    }
    
    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password)
    {
    	$this->password_hash = Yii::$app->security->generatePasswordHash($password);
    }
    
    /**
     * Generates "remember me" authentication key
     */
    public function generateAuthKey()
    {
    	$this->auth_key = Yii::$app->security->generateRandomString();
    }
    
    /**
     * Generates new password reset token
     */
    public function generatePasswordResetToken()
    {
    	$this->password_reset_token = Yii::$app->security->generateRandomString() . '_' . time();
    }
    
    /**
     * Removes password reset token
     */
    public function removePasswordResetToken()
    {
    	$this->password_reset_token = null;
    }
}
