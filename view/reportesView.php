<!DOCTYPE html>
<html>

<head>
    <title><?php echo _NAMESYSTEM_; ?> | <?php if (!empty($action)) {
                                                echo $action;
                                            } ?> <?php if (!empty($url)) {
                                                        echo $url;
                                                    } ?></title>
    <?php //require_once('assets/headers.php'); 
    ?>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<link rel="stylesheet" href="<?= _ROUTE_ ?>assets/css/reportes.css">

<body class="hold-transition skin-blue sidebar-mini">

    <div class="wrapper">

        <?php require_once('assets/top_menu.php'); ?>

        <?php require_once('assets/menu.php'); ?>


        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    <?php echo $url; ?>
                    <small><?php echo "Ver " . $url; ?></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="<?= _ROUTE_ . $this->encriptar('Home'); ?>"><i class="fa fa-dashboard"></i> Inicio </a></li>
                    <li><a href="<?= _ROUTE_ . $this->encriptar('Reportes'); ?>"><?php echo $url; ?></a></li>
                    <li class="active"><?php if (!empty($action)) {
                                            echo $action;
                                        }
                                        echo " " . $url; ?></li>
                </ol>
            </section>

            <br>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- /.box -->
                        <div class="box">
                            <div class="box-header">
                                <br><br><br><br>
                                <div class="col-md-12">


                                    <div class="row">
                                        <!-- <div class="col-lg-3 col-xs-6"></div> -->

                                        <br><br><br><br><br>

                                        <?php if ($_SESSION['cuenta_usuario']['nombre_rol'] == "Superusuario" ||  $_SESSION['cuenta_usuario']['nombre_rol'] == "Administrador") : ?>
                                            <div class="col-sm-0 col-md-2 col-lg-2 col-lg-offset-1">
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                                <div class="small-box bg-purple">
                                                    <div class="inner">
                                                        <h3 style="font-size: 26px;">Usuarios</h3>
                                                        <p>Lista de <br> Usuarios</p>
                                                    </div>
                                                    <div class="icon">
                                                        <i class="fa fa-users" style="margin-top: 20px; margin-left: -60px;"></i>
                                                    </div>
                                                    <a id="respaldar" href="<?= _ROUTE_ . $this->encriptar('Reportes') ?>/Usuarios" target="_blank" class="small-box-footer clics">
                                                        <i class="fa fa-arrow-circle-right" style="font-size:1.7em;margin-top:10px;margin-bottom:10px;"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        <?php endif; ?>
                                        <div class="col-sm-4 col-md-0 col-lg-3 col-lg-offset-1">
                                        </div>
                                        <div class="col-xs-12 col-md-4 col-sm-6 col-lg-3">
                                            <div class="small-box bg-maroon">
                                                <div class="inner">
                                                    <h3 style="font-size: 26px;">Notas</h3>

                                                    <p>Calificaciones <br> de los Alumnos</p>
                                                </div>
                                                <div class="icon">
                                                    <i class="fa  fa-bar-chart" style="margin-top: 30px;"></i>
                                                </div>
                                                <a id="respaldar" class="small-box-footer clics" data-toggle="modal" data-target="#modalNota">
                                                    <i class="fa fa-arrow-circle-right" style="font-size:1.7em;margin-top:10px;margin-bottom:10px;"></i>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="col-sm-4 col-md-0 col-lg-3 col-lg-offset-1">
                                        </div>
                                        <div class="col-xs-12 col-md-4 col-sm-6 col-lg-3">
                                            <div class="small-box bg-green">
                                                <div class="inner">
                                                    <h3 style="font-size: 26px;">Aprobación</h3>

                                                    <p>Porcentaje de <br> aprobados</p>
                                                </div>
                                                <div class="icon">
                                                    <i class="fa  fa-pie-chart" style="margin-top: 30px;"></i>
                                                </div>
                                                <a id="respaldar" class="small-box-footer clics" data-toggle="modal" data-target="#modalAprobado">
                                                    <i class="fa fa-arrow-circle-right" style="font-size:1.7em;margin-top:10px;margin-bottom:10px;"></i>
                                                </a>
                                            </div>
                                        </div>


                                        <div id="modalNota" class="modalNota modal fade" role="dialog">
                                            <div class="modal-dialog tamModals" style="text-align:left;">
                                                <div class="modal-content">
                                                    <form class="formNotas" role="form" action="<?= _ROUTE_ . $this->encriptar('Reportes') ?>/Notas" target="_blank" method="post" id="formAgregar" name="form" enctype="multipart/form-data">
                                                        <div class="modal-header" style="background:#3c8dbc; color:white">
                                                            <button type="button" class="close cerrarM" data-dismiss="modal" style="top:25px;" id="">&times;</button>
                                                            <h4 class="modal-title" style="text-align: left;">Reporte Nota</h4>
                                                        </div>
                                                        <div class="modal-body" style="max-height:70vh;overflow:auto">
                                                            <div class="box-body">
                                                                <div class="row" style="width:100%;">
                                                                    <!-- ENTRADA PARA LA SECCION -->
                                                                    <div class="form-group col-xs-12 col-sm-6">
                                                                        <label for="seccion">Sección</label>
                                                                        <div class="input-group" style="width:100%;">
                                                                            <span class="input-group-addon" style="width:5%;"><i class="fa fa-cogs"></i></span>
                                                                            <select class="form-control input-lg select2" style="width:100%;" name="seccion" id="seccion">
                                                                                <option value="">Sección</option>
                                                                                <?php foreach ($secciones as $date) : if (!empty($date['cod_seccion'])) : ?>
                                                                                        <option value="<?php echo $date['cod_seccion']."=".$date['id_periodo'] ?>"><?=$date['nombre_seccion'] ?> (<?=$date['year_seccion']; ?>) - <?="Fase ".$date['nombre_periodo']; ?></option>
                                                                                <?php endif;
                                                                                endforeach; ?>
                                                                            </select>
                                                                        </div>
                                                                        <div style="width:100%;text-align:right;">
                                                                            <span id="error_seccion" class="mensajeError"></span>
                                                                        </div>
                                                                    </div>

                                                                    <!-- ENTRADA PARA EL SABER -->
                                                                    <div class="form-group col-xs-12 col-sm-6">
                                                                        <label for="saber">Saber complementario</label>
                                                                        <div class="input-group" style="width:100%;">
                                                                            <span class="input-group-addon" style="width:5%;"><i class="fa fa-indent"></i></span>
                                                                            <select class="form-control input-lg select2" style="width:100% !important;" name="saber" id="saber">
                                                                                <option value="">Saber Complementario</option>
                                                                            </select>
                                                                        </div>
                                                                        <div style="width:100%;text-align:right;">
                                                                            <span id="error_saber" class="mensajeError"></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <hr>
                                                                </div>
                                                                <div class="row boxlist_alumnosnotas" style="display:none;">
                                                                    <div class="" id="reportPage">
                                                                        <div class="btn-group float-right">
                                                                            <span class="dropdown-toggle" style="width:100%;text-align:right !important;" data-toggle="dropdown">
                                                                                <span class="fa fa-align-justify"></span>
                                                                            </span>
                                                                            <ul class="dropdown-menu">
                                                                                <li><a href="#" id="downloadPdf">Download PDF</a></li>
                                                                                <li><a href="#" id="save-png">Download PNG</a></li>
                                                                                <li><a href="#" id="save-jpg">Download JPG</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <canvas id="chartNotas">
                                                                        </canvas>
                                                                        <div class="" id="chartCard">
                                                                            <div class="" id="chartBox">
                                                                                <canvas id="myChart"></canvas>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </form>

                                                        <div class="modal-footer">
                                                            <span type="button" class="btn btn-default pull-left salirM" data-dismiss="modal" id="">Salir</span>
                                                            <!-- <input type="submit" class="fa fa-file-pdf-o pdf" id="enviar"> -->
                                                            <div style="margin-right: 20px;">
                                                                <button disabled onclick="$('.formNotas').submit();" class="fa fa-file-pdf-o pdf buttons disabledd" id="enviar" title="PDF" style="background:none;border:none;font-size: 20px !important; margin: 0px 10px;"></button>
                                                                <!-- <input type="button" class="btn btn-primary pdf" id="pdf"  value="PDF"> -->
                                                                <button disabled type="button" class="fa fa-pie-chart porcentaje buttons disabledd" id="porcentaje" title="Porcentual" style="background:none;border:none;font-size: 20px !important; margin: 0px 10px;"></button >
                                                                <button disabled type="button" class="fa fa-bar-chart estadistico buttons disabledd" id="estadistico" title="Barra" style="background:none;border:none;font-size: 20px !important; margin: 0px 10px;"></button>
                                                                <style>.disabledd{color:#CCC !important;}</style>
                                                            </div>
                                                        </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="modalAprobado" class="modalAprobado modal fade" role="dialog">
                                            <div class="modal-dialog tamModals" style="text-align:left;">
                                                <div class="modal-content">
                                                    <form class="formAprobado" role="form" action="<?= _ROUTE_ . $this->encriptar('Reportes') ?>/Notas" target="_blank" method="post" id="formAgregar" name="form" enctype="multipart/form-data">
                                                        <div class="modal-header" style="background:#3c8dbc; color:white">
                                                            <button type="button" class="close cerrarM" data-dismiss="modal" style="top:25px;" id="">&times;</button>
                                                            <h4 class="modal-title" style="text-align: left;">Reporte Aprobados</h4>
                                                        </div>
                                                        <div class="modal-body" style="max-height:70vh;overflow:auto">
                                                            <div class="box-body">
                                                                <div class="row" style="width:100%;">
                                                                    <!-- ENTRADA PARA LA SECCION -->
                                                                    <div class="form-group col-xs-0 col-sm-3"></div>
                                                                    <div class="form-group col-xs-12 col-sm-6">
                                                                        <label for="seccion">Sección</label>
                                                                        <div class="input-group" style="width:100%;">
                                                                            <span class="input-group-addon" style="width:5%;"><i class="fa fa-cogs"></i></span>
                                                                            <select class="form-control input-lg select2 seccion seccionApx" style="width:100%;" name="seccion" id="secc ">
                                                                                <option value="">Sección</option>
                                                                                <?php foreach ($secciones as $date) : if (!empty($date['cod_seccion'])) : ?>
                                                                                        <option value="<?php echo $date['cod_seccion']."=".$date['id_periodo'] ?>"><?=$date['nombre_seccion'] ?> (<?=$date['year_seccion']; ?>) - <?="Fase ".$date['nombre_periodo']; ?></option>
                                                                                <?php endif;
                                                                                endforeach; ?>
                                                                            </select>
                                                                        </div>
                                                                        <div style="width:100%;text-align:right;">
                                                                            <span id="error_seccionApx" class="mensajeError"></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <hr>
                                                                </div>
                                                                <div class="row boxlist_alumnosnotas" style="display:none;">
                                                                    <div class="reportPage" id="">
                                                                        <div class="btn-group float-right">
                                                                            <span class="dropdown-toggle" style="width:100%;text-align:right !important;" data-toggle="dropdown">
                                                                                <span class="fa fa-align-justify"></span>
                                                                            </span>
                                                                            <ul class="dropdown-menu">
                                                                                <li><a href="#" class="downloadPdf" id="">Download PDF</a></li>
                                                                                <li><a href="#" class="save-png" id="">Download PNG</a></li>
                                                                                <li><a href="#" class="save-jpg" id="">Download JPG</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="" id="chartSuccess">
                                                                            <div class="" id="chartBoxSuccess">
                                                                                <canvas id="sucess"></canvas>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </form>

                                                        <div class="modal-footer">
                                                            <span type="button" class="btn btn-default pull-left salirM" data-dismiss="modal" id="">Salir</span>
                                                            <div style="margin-right: 20px;">
                                                                <button onclick="$('.formAprobado').submit();" disabled class="btn btn-primary aprobado buttonsApx disabledd" id="aprobado" title="Porcentual">Generar</span>
                                                            </div>
                                                        </div>
                                                </div>
                                            </div>
                                        </div>

                                        
                                    </div>

                                    <input type="hidden" id="url" value="<?= $this->encriptar($this->url); ?>">


                                    <br><br><br><br><br><br><br>
                                </div>
                                <!-- /.box-header -->

                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <?php require_once 'assets/footer.php'; ?>


        <?php //require_once 'assets/aside-config.php'; 
        ?>
    </div>
    <!-- ./wrapper -->


    <?php //require_once('assets/footered.php'); 
    ?>
    <?php if (!empty($response)) : ?>
        <input type="hidden" class="responses" value="<?php echo $response ?>">
    <?php endif; ?>
    <script src="<?= _THEME_ ?>/js/reportes.js"></script>
    <script src="<?= _THEME_ ?>/js/canvas-toBlob.js"></script>
    <script src="<?= _THEME_ ?>/js/FileSaver/dist/FileSaver.min.js"></script>
    <script src="<?= _ROUTE_ ?>view/vendor/plugins/chart/dist/Chart.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.0.0/chartjs-plugin-datalabels.min.js" integrity="sha512-R/QOHLpV1Ggq22vfDAWYOaMd5RopHrJNMxi8/lJu8Oihwi4Ho4BRFeiMiCefn9rasajKjnx9/fTQ/xkWnkDACg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.0/chart.min.js" integrity="sha512-asxKqQghC1oBShyhiBwA+YgotaSYKxGP1rcSYTDrB0U6DxwlJjU59B67U8+5/++uFjcuVM8Hh5cokLjZlhm3Vg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
</body>

</html>