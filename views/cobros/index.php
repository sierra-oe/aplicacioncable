<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\CobrosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Cobros';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cobros-index">

    <h1><?= Html::encode($this->title) ?></h1>


    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); 
    ?>

    <div class="panel panel-primary">
        <div class="panel-body">
            <?= Html::a('Agregar cobro', ['create'], ['class' => 'btn btn-block btn-success']) ?>

        </div>
    </div>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            [
                'attribute' => 'correlativo',
                'value' => 'clientes.correlativo',
            ],

            [
                'attribute' => 'primernombre',
                'value' => 'clientes.primernombre',
            ],


            [
                'attribute' => 'primerapelldio',
                'value' => 'clientes.primerapelldio',
            ],

            [
                'attribute' => 'contratonumero',
                'value' => 'servicioscontratados.contratonumero',
            ],
            //'idcobro',
            'factura',
            //'idempleado',
            'fecha',

            //
            //'idservicioscontratados',
            //'tipo',
            //'factura',
            'contrasenya',
            'zona',
            'anyomes',
            'mesesporcobrar',
            'mesesporcobrardet',
            'mesespagados',
            'mesespagadosdet',
            'totalcobrado',

            //adios

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

    <?php Pjax::end(); ?>







</div>