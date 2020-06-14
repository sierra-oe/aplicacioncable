<?php

namespace app\models;

use phpDocumentor\Reflection\Types\Boolean;
use Yii;

/**
 * This is the model class for table "clientes".
 *
 * @property int $idcliente
 * @property string|null $correlativo
 * @property string|null $primernombre
 * @property string|null $segundonombre
 * @property string|null $primerapelldio
 * @property string|null $segundoapellido
 * @property string|null $direccion
 * @property string|null $dpi
 * @property string|null $referencias
 * @property string|null $telefono1
 * @property string|null $telefono2
 * @property string|null $nit
 * @property string $nombrezona
 *
 * @property Zona $nombrezona0
 * @property Servicioscontratados $servicioscontratados
 */
class Clientes extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'clientes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['direccion', 'referencias'], 'string'],
            [['nombrezona'], 'required'],
            [['correlativo'], 'string', 'max' => 5],
            [['primernombre', 'segundonombre', 'primerapelldio', 'segundoapellido'], 'string', 'max' => 75],
            [['dpi'], 'string', 'max' => 15],
            [['telefono1', 'telefono2'], 'string', 'max' => 40],
            [['nit', 'nombrezona','mail'], 'string', 'max' => 45],
            [['nombrezona'], 'required'],
            //'exist', 'skipOnError' => true, 'targetClass' => Zona::className(), 'targetAttribute' => ['nombrezona' => 'nombrezona']
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idcliente' => 'Idcliente',
            'correlativo' => 'Correlativo',
            'primernombre' => '1er. nombre',
            'segundonombre' => '2do. nombre',
            'primerapelldio' => '1er. apelldio',
            'segundoapellido' => '2do. apellido',
            'direccion' => 'Dirección',
            'dpi' => 'Dpi',
            'referencias' => 'Referencias',
            'telefono1' => 'Telefono 1',
            'telefono2' => 'Telefono 2',
            'nit' => 'Nit',
            'nombrezona' => 'Agrupación Cobro',
            'mail' => 'Correo electrónico',
        ];
    }

    public function guardar($zona)
    {

        $salida = FALSE;
        $connection = \Yii::$app->db;
        $transaction = $connection->beginTransaction();
        try {
            
            if ($this->nombrezona === '0'){
                $zona->save();
                $this->nombrezona = $zona->getNombrezona();
            }
            $salida = $this->save();

            /*$this->nombrezona = strtoupper($this->nombrezona);

            if ($this->nombrezona != '0') {
                $this->nom
                $salida = $this->save();
            }
            else{
                if ($zona->save())
                    $this->nombrezona = $zona->getNombrezona0();
                    $salida = $this->save();
            }*/
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollBack();
            throw $e;
        } catch (\Throwable $e) {
            $transaction->rollBack();
            throw $e;
        }
        return $salida;
    }

    public function getNombres(){
        return 'DPI: '. $this->dpi . '. ' . $this->primernombre . ' ' . $this->segundonombre . ' '. $this->primerapelldio . ' ' . $this->segundoapellido;
    }

    /**
     * Gets query for [[Nombrezona0]].
     *
     * @return \yii\db\ActiveQuery|ZonaQuery
     */
    public function getNombrezona0()
    {
        return $this->hasOne(Zona::className(), ['nombrezona' => 'nombrezona']);
    }

    public function getZona(){
        return $this->nombrezona;
    }

    /**
     * Gets query for [[Servicioscontratados]].
     *
     * @return \yii\db\ActiveQuery|yii\db\ActiveQuery
     */
    public function getServicioscontratados()
    {
        return $this->hasOne(Servicioscontratados::className(), ['idcliente' => 'idcliente']);
    }

    /**
     * {@inheritdoc}
     * @return ClientesQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ClientesQuery(get_called_class());
    }


     /**
     * @return clientes returns an array of zones 
     */
    public static function listadoClientes()
    {
        $result = Clientes::find()->all();

        $clientes = [];

        foreach ($result as $record)
            $clientes[$record->idcliente] = ($record->idcliente != '1') ? ($record->primernombre . ' ' . $record->segundonombre . ' ' . $record->primerapelldio . ' ' . $record->segundoapellido . '. Agrupación cobro: ' . $record->nombrezona . '. DPI: '. $record->dpi . '. Nit: '. $record->nit) : 'Ingrese nuevo usuario';

        return $clientes;
    }

    public function getIdcliente(){
        return $this->idcliente;
    }

    public function actualizar($zona)
    {

        $salida = FALSE;
        $connection = \Yii::$app->db;
        $transaction = $connection->beginTransaction();
        try {
            
            if ($this->nombrezona === '0'){
                $zona->save();
                $this->nombrezona = $zona->getNombrezona();
            }
            $salida = $this->save();

            Servicioscontratados::updateAll(['nombrezona' => $this->nombrezona],['idcliente' => $this->idcliente]);


            //Cobros::updateAll(['nombrezona' => $this->nombrezona],['idcliente' => $this->idcliente]);
            


            /*$this->nombrezona = strtoupper($this->nombrezona);

            if ($this->nombrezona != '0') {
                $this->nom
                $salida = $this->save();
            }
            else{
                if ($zona->save())
                    $this->nombrezona = $zona->getNombrezona0();
                    $salida = $this->save();
            }*/
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollBack();
            throw $e;
        } catch (\Throwable $e) {
            $transaction->rollBack();
            throw $e;
        }
        return $salida;
    }

}
