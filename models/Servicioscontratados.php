<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "servicioscontratados".
 *
 * @property int|null $mesesnopagados
 * @property float|null $subtotal
 * @property int $idcliente
 * @property int $idservicio
 * @property string $contratonumero
 * @property float|null $cobropactado
 * @property int|null $duracioncontrato
 * @property string|null $fechainicio
 * @property int $idservicioscontratados
 * @property string|null $nombrezona
 * @property string $nombreestado
 * @property int|null $trabajopendiente
 *
 * @property Cobros[] $cobros
 * @property Clientes $idcliente0
 * @property Estado $nombreestado0
 * @property Servicios $idservicio0
 * @property Trabajospendientes[] $trabajospendientes
 */
class Servicioscontratados extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'servicioscontratados';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['mesesnopagados', 'idcliente', 'idservicio', 'duracioncontrato'], 'integer'],
            [['subtotal', 'cobropactado'], 'number'],
            [['idcliente', 'idservicio', 'contratonumero', 'nombreestado'], 'required'],
            [['fechainicio'], 'safe'],
            [['nombrezona','contratonumero', 'nombreestado'], 'string', 'max' => 45],
            //[['nombrezona'], 'string', 'max' => 45],
            //[['idcliente'], 'unique'],
            //[['idservicio'], 'unique'],
            [['idcliente'], 'exist', 'skipOnError' => true, 'targetClass' => Clientes::className(), 'targetAttribute' => ['idcliente' => 'idcliente']],
            [['nombreestado'], 'exist', 'skipOnError' => true, 'targetClass' => Estado::className(), 'targetAttribute' => ['nombreestado' => 'nombre']],
            [['idservicio'], 'exist', 'skipOnError' => true, 'targetClass' => Servicios::className(), 'targetAttribute' => ['idservicio' => 'idservicio']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [


            'primernombre' => '1er nombre',
            'segundonombre' => '2do nombre',

            'primerapelldio' => '1er apellido',
            'segundoapellido' => '2do apellido',


            'mesesnopagados' => 'Mesesnopagados',
            'subtotal' => 'Subtotal',
            'idcliente' => 'Idcliente',
            'idservicio' => 'Idservicio',
            'contratonumero' => 'Contratonumero',
            'cobropactado' => 'Cobropactado',
            'duracioncontrato' => 'Duracioncontrato',
            'fechainicio' => 'Fechainicio',
            'idservicioscontratados' => 'Idservicioscontratados',
            'nombrezona' => 'Zona agrupación',
            'nombreestado' => 'Nombreestado',
            
        ];
    }

    /**
     * Gets query for [[Cobros]].
     *
     * @return \yii\db\ActiveQuery|yii\db\ActiveQuery
     */
    public function getCobros()
    {
        return $this->hasMany(Cobros::className(), ['idservicioscontratados' => 'idservicioscontratados']);
    }

    public function getCliente(){
        return Clientes::findOne(['idcliente'=> $this->idcliente]);
        //return $this->hasOne(Clientes::className(),['idcliente'=>$this->idcliente])->getZona();
    }

    /**
     * Gets query for [[Clientes]].
     *
     * @return \yii\db\ActiveQuery|yii\db\ActiveQuery
     */
    public function getClientes()
    {
        return $this->hasOne(Clientes::className(), ['idcliente' => 'idcliente']);
    }

    public static function getIdserviciocliente(){
        $result = Servicioscontratados::find()
                ->where(['nombreestado'=>'Aprobado'])
                ->all();

        $serviciosgeneral = Servicios::listadoServicioscompleto();


        $servicios = [];

        foreach ($result as $record){
                $cliente = $record->getCliente();
                $servicios[$record->idservicioscontratados] = $cliente->getNombres() . '. ' . $serviciosgeneral[$record->idservicio];
            }
        
        return $servicios;
    }


    public static function getIdserviciozona(){
        $result = Servicioscontratados::find()
                ->where(['nombreestado'=>'Aprobado'])
                ->all();

        


        $serviciosz = [];

        foreach ($result as $record){
                
                $serviciosz[$record->idservicioscontratados] = $record->zona;
            }
        
        return $serviciosz;
    }


    /**
     * Gets query for [[Idcliente0]].
     *
     * @return \yii\db\ActiveQuery|ClientesQuery
     */
    public function getIdcliente0()
    {
        return $this->hasOne(Clientes::className(), ['idcliente' => 'idcliente']);
    }

    /**
     * Gets query for [[Nombreestado0]].
     *
     * @return \yii\db\ActiveQuery|EstadoQuery
     */
    public function getNombreestado0()
    {
        return $this->hasOne(Estado::className(), ['nombre' => 'nombreestado']);
    }

    /**
     * Gets query for [[Idservicio0]].
     *
     * @return \yii\db\ActiveQuery|ServiciosQuery
     */
    public function getIdservicio0()
    {
        return $this->hasOne(Servicios::className(), ['idservicio' => 'idservicio']);
    }

    /**
     * hace los cambios cuando se crea el cliente
     */
    public function guardar($model)
    {
        $this->idcliente = $model->getIdcliente();
        $this->nombrezona = $model->nombrezona;
        
        return $this->save();
    }


    /**
     * {@inheritdoc}
     * @return ServicioscontratadosQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ServicioscontratadosQuery(get_called_class());
    }

    public function getZona(){
        return Clientes::findOne(['idcliente'=> $this->idcliente])->getZona();
        //return $this->hasOne(Clientes::className(),['idcliente'=>$this->idcliente])->getZona();
    }

    public function setMesnopagado(){
        $this->mesesnopagados ++;
        $this->save();
    }

    public function getMesnopagado(){
        return $this->mesesnopagados;
    }

    public function getCobropactado(){
        return $this->cobropactado;
    }

    public function getDeuda(){
        return $this->cobropactado * $this->mesesnopagados;
    }

    public function getId(){
        return $this->idservicioscontratados;
    }

    
}
