<?php

/* @var $this \yii\web\View */
/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => Yii::$app->name,
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => [
            
            [
                'label' => 'Clientes',
                'items' => [

                    
                     
                     '<li class="divider"></li>',
                     '<li class="dropdown-header">Nuevo cliente</li>',
                     ['label' => 'Agregar cliente', 'url' => '/clientes/create'],

                     '<li class="divider"></li>',
                     '<li class="dropdown-header">Listado de clientes</li>',
                     ['label' => 'Clientes', 'url' => '/clientes'],
                     
                ],
            ],

            [
                'label' => 'Contratos',
                'items' => [

                    '<li class="divider"></li>',
                     '<li class="dropdown-header">Contratación de servicios</li>',
                     ['label' => 'Nuevo contrato', 'url' => '/servicioscontratados/create'],
                     ['label' => 'Listado de Contratos', 'url' => '/servicioscontratados'],
                     
                     
                     '<li class="divider"></li>',
                     '<li class="dropdown-header">Servicios Prestados</li>',
                     ['label' => 'Servicios prestados', 'url' => '/servicios'],
                     
                ],
            ],

            [
                'label' => 'Reportes',
                'items' => [

                    '<li class="divider"></li>',
                     '<li class="dropdown-header">Reportes generales</li>',
                     ['label' => 'Reportes', 'url' => '/reporte/index'],
                     
                     
                     
                ],
            ],


            [
                'label' => 'Cobros',
                'items' => [

                    '<li class="divider"></li>',
                     '<li class="dropdown-header">Principal</li>',
                     
                     ['label' => 'Nuevo cobro', 'url' => '/cobros/create'],
                     ['label' => 'Cobro por zona', 'url' => '/cobros/indexlote'],
                     
                     
                     '<li class="divider"></li>',
                     '<li class="dropdown-header">Listado de cobro</li>',
                     ['label' => 'Listado de cobros', 'url' => '/cobros'],

                     '<li class="divider"></li>',
                     '<li class="dropdown-header">Generar cobros nuevo mes</li>',
                     ['label' => 'Cobros para nuevo mes', 'url' => '/cobros/mes'],
                     
                ],
            ],

            ['label' => 'Usuarios', 
            'items' =>[
                ['label' => 'Registrar', 'url' => '/site/registrar'],
                ['label' => 'Administrar Cuentas', 'url' => '/empleados/index']
            ]],



            
            Yii::$app->user->isGuest ? (
                ['label' => 'Ingresar', 'url' => ['/site/login']]
            ) : (
                '<li>'
                . Html::beginForm(['/site/logout'], 'post')
                . Html::submitButton(
                    'Logout (' . Yii::$app->user->identity->username . ')',
                    ['class' => 'btn btn-link logout']
                )
                . Html::endForm()
                . '</li>'
            )
        ],
    ]);
    NavBar::end();
    ?>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; Cable visión <?= date('Y') ?></p>

        <p class="pull-right"></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
