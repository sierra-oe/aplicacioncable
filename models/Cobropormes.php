<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "cobropormes".
 *
 * @property string $cobrosmes
 * @property int|null $generado
 * @property string|null $fechagenerado
 */
class Cobropormes extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'cobropormes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['cobrosmes'], 'required'],
            [['generado'], 'integer'],
            [['cobrosmes'], 'string', 'max' => 7],
            [['fechagenerado'], 'string', 'max' => 45],
            [['cobrosmes'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'cobrosmes' => 'Cobrosmes',
            'generado' => 'Generado',
            'fechagenerado' => 'Fechagenerado',
        ];
    }

    /**
     * {@inheritdoc}
     * @return CobropormesQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CobropormesQuery(get_called_class());
    }

    public static function getListado(){
        $tmp = Cobropormes::find()->all();
        $result = [];
        foreach($tmp as $record)
            $result[$record->cobrosmes] = $record->cobrosmes;
    }

    public function listadoServicioscompleto(){
        $result = Servicios::find()->all();

        $servicios = [];

        foreach ($result as $record)
                $servicios[$record->idservicio] = $record->nombre . ". Q. " . $record->tarifa;
        
        return $servicios;
    }
}
