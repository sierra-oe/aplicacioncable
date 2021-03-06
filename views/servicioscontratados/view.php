<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Servicioscontratados */

$this->title = $model->idservicioscontratados;
$this->params['breadcrumbs'][] = ['label' => 'Servicioscontratados', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="servicioscontratados-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->idservicioscontratados], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->idservicioscontratados], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'mesesnopagados',
            'detmesesporpagar',
            'subtotal',
            'idcliente',
            'idservicio',
            'contratonumero',
            'cobropactado',
            'duracioncontrato',
            'fechainicio',
            'nombreestado',
            'idservicioscontratados',
            'nombrezona',
        ],
    ]) ?>

</div>
