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

<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <?php require_once('assets/top_menu.php'); ?>

    <?php require_once('assets/menu.php'); ?>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <!-- <section class="content-header" style="background:#FFF;padding-bottom:10px;border-bottom:2px solid #05A"> -->
      <section class="content-header">
        <!--  -->
        <h1>
          <?php echo $url; ?>
          <small><?php echo "Ver " . $url; ?></small>
        </h1>
        <ol class="breadcrumb">
          <li><a href="<?= _ROUTE_ . $this->encriptar("Home"); ?>"><i class="fa fa-dashboard"></i> Inicio </a></li>
          <li><a href="<?= _ROUTE_ . $this->encriptar("Clases"); ?>"><?php echo $url; ?></a></li>
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
                <div class="col-xs-12 col-sm-6">
                  <img src="assets/img/logolista.png" style="width:25px;">
                  <h3 class="box-title"><?php echo "" . $url . ""; ?></h3>
                </div>
                <input type="hidden" id="url" value="<?= $this->encriptar($this->url); ?>">
                <div class="col-xs-12 col-sm-6" style="text-align:right">
                  <?php if ($amClasesR == "1") : ?>
                    <button type="button" class="btn enviar2 btn-next btn-fill btn btn-primary btn-wd btn-sm" data-toggle="modal" data-target="#modalAgregarClase">Agregar Nuevo</button>
                    <div id="modalAgregarClase" class="modalAgregarClase modal fade" role="dialog">
                      <div class="modal-dialog tamModals tamModals" style="text-align:left;">
                        <div class="modal-content">
                          <form role="form" method="post" id="formAgregar" enctype="multipart/form-data">
                            <div class="modal-header" style="background:#3c8dbc; color:white">
                              <button type="button" class="close" data-dismiss="modal" style="top:25px;" id="cerrarM">&times;</button>
                              <h4 class="modal-title" style="text-align: left;">Agregar Clase</h4>
                            </div>
                            <div class="modal-body" style="max-height:70vh;overflow:auto">
                              <div class="box-body">
                                <div class="row">

                                  <!-- ENTRADA PARA SELECCIONAR SECCIONES-->
                                  <div class="form-group col-xs-12 col-sm-12">
                                    <label for="seccion">Seccion</label>
                                    <div class="input-group" style="width:100%;">
                                      <span class="input-group-addon" style="width:5%;"><i class="fa fa-cogs"></i></span>
                                      <select class="form-control select2 input-lg" style="width:100%;" name="seccion" id="seccion">
                                        <option value="">Sección</option>
                                        <?php foreach ($secciones as $date) : if (!empty($date['cod_seccion'])) :  ?>
                                            <option value="<?php echo $date['cod_seccion'] ?>"><?= $date['nombre_seccion']; ?> (<?= $date['year_seccion']; ?>)</option>
                                        <?php endif;
                                        endforeach; ?>
                                      </select>
                                    </div>
                                    <div style="width:100%;text-align:right;">
                                      <span id="seccionS" class="mensajeError"></span>
                                    </div>
                                  </div>

                                  <!-- ENTRADA PARA SELECCIONAR PERIODOS-->
                                  <div class="form-group col-xs-12 col-sm-12">
                                    <label for="periodo">Período</label>
                                    <div class="input-group" style="width:100%;">
                                      <span class="input-group-addon" style="width:5%;"><i class="fa fa-address-card"></i></span> 
                                      <select class="form-control select2 input-lg" style="width:100%;" name="periodo" placeholder="Ingresar periodo" id="periodo" required>
                                        <option value="">Seleccione un periodo</option>
                                        <?php
                                        foreach ($periodos as $per):
                                          if(!empty($per['id_periodo'])):
                                        ?>
                                        <!-- <option value="<?=$per['id_periodo']?>"><?=mb_strtoupper($per['year_periodo']."-".$per['nombre_periodo']); ?></option> -->
                                        <?php 
                                          endif;
                                        endforeach;
                                        ?>
                                      </select>
                                    </div>
                                    <div style="width:100%;text-align:right;">
                                      <span id="periodoS" class="mensajeError"></span>
                                    </div>
                                  </div>

                                  <!-- ENTRADA PARA SELECCIONAR SABERES -->
                                  <div class="form-group col-xs-12 col-sm-12">
                                    <label for="saber">Saber complementario</label>
                                    <div class="input-group" style="width:100%;">
                                      <span class="input-group-addon" style="width:5%;"><i class="fa fa-indent"></i></span>
                                      <select class="form-control select2 input-lg" style="width:100%;" name="nuevoPerfil" id="saber">
                                        <option value="">Saber Complementario</option>
                                        <?php foreach ($saberes as $dateS) : if (!empty($dateS['id_SC'])) :  ?>
                                            <!-- <option value="<?php echo $dateS['id_SC'] ?>"><?php echo $dateS['nombreSC'] ?></option> -->
                                        <?php endif;
                                        endforeach; ?>
                                      </select>
                                    </div>
                                    <div style="width:100%;text-align:right;">
                                      <span id="saberS" class="mensajeError"></span>
                                    </div>
                                  </div>

                                  <!-- ENTRADA PARA LOS ALUMNOS -->
                                  <div class="form-group col-xs-12 col-sm-12">
                                    <label for="profesor">Profesor</label>
                                    <div class="input-group" style="width:100%;">
                                      <span class="input-group-addon" style="width:5%;"><i class="fa fa-indent"></i></span>
                                      <select class="form-control select2 input-lg" style="width:100%;" name="nuevoPerfil" id="profesor">
                                        <option value="">Profesor</option>
                                        <?php foreach ($profesores as $dateP) : if (!empty($dateP['cedula_profesor'])) :  ?>
                                            <option value="<?php echo $dateP['cedula_profesor'] ?>"><?php echo $dateP['nombre_profesor'] . " " . $dateP['apellido_profesor'] ?></option>
                                        <?php endif;
                                        endforeach; ?>
                                      </select>
                                    </div>
                                    <div style="width:100%;text-align:right;">
                                      <span id="profesorS" class="mensajeError"></span>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="modal-footer">
                              <span type="button" class="btn btn-default pull-left" data-dismiss="modal" id="salirM">Salir</span>
                              <span type="button" class="btn btn-primary" id="guardar">Guardar</span>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
                  <?php endif; ?>
                </div>
              </div>


              <!-- /.box-header -->

              <div class="box-body ">
                <div class="table-responsive">
                  <table id="" class="datatable table table-striped text-center" style="text-align:center;width:100%;font-size:1em;">
                    <thead>
                      <tr>
                        <th>Nº</th>
                        <th>Saber Complementario</th>
                        <th>Sección</th>
                        <th>Profesor</th>
                        <?php if ($amClasesE == 1 || $amClasesB == 1) : ?>
                          <th>Acciones</th>
                        <?php endif; ?>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      $num = 1;
                      foreach ($clases as $data) :
                        if (!empty($data['id_clase'])) :
                      ?>
                          <tr>
                            <td style="width:5%">
                              <span class="contenido2">
                                <?php echo $num++; ?>
                              </span>
                            </td>


                            <td style="width:20%">
                              <span class="contenido2">
                                <?php echo $data['nombreSC']; ?>
                              </span>
                            </td>
                            <td style="width:20%">
                              <span class="contenido2">
                                <?php echo $data['nombre_seccion']."<br>(<small>".$data['year_seccion']."-".$data['nombre_periodo']."</smal>)"; ?>
                              </span>
                            </td>
                            <td style="width:20%">
                              <span class="contenido2">
                                <?php echo $data['nombre_profesor'] . " " . $data['apellido_profesor']; ?>
                              </span>
                            </td>

                            <?php if ($amClasesE == 1 || $amClasesB == 1) : ?>
                              <td style="width:10%">
                                <?php if ($amClasesE == 1) : ?>
                                  <button class="btn modificarBtn" style="border:0;background:none;color:#04a7c9" value="<?php echo $data['id_clase'] ?>">
                                    <span class="fa fa-pencil">

                                    </span>
                                  </button>

                                  <!-- Modificar -->
                                  <button type="button" id="modificarButton<?= $data['id_clase'] ?>" class="btn enviar2 btn-next btn-fill btn btn-primary btn-wd btn-sm" data-toggle="modal" data-target="#modalModificarClase<?= $data['id_clase'] ?>" style="display: none">Modificar</button>
                                  <div id="modalModificarClase<?= $data['id_clase'] ?>" class="modalModificarClase modal fade modalModificarClase<?= $data['id_clase'] ?>" role="dialog">
                                    <div class="modal-dialog tamModals" style="text-align:left;">

                                      <div class="modal-content">

                                        <form role="form" method="post" id="formModificar" enctype="multipart/form-data">

                                          <div class="modal-header" style="background:#3c8dbc; color:white">

                                            <button type="button" class="close" data-dismiss="modal" style="top:25px;">&times;</button>

                                            <h4 class="modal-title" style="text-align: left;">Modificar Clase</h4>

                                          </div>

                                          <div class="modal-body" style="max-height:70vvh;overflow:auto;">

                                            <div class="box-body">

                                              <div class="row">


                                                <!-- ENTRADA PARA EL SECCION -->
                                                <?php
                                                  $yearSeccion = date("Y"); 
                                                ?>
                                                <div class="form-group col-xs-12 col-sm-12">
                                                  <label for="seccion<?= $data['id_clase']; ?>">Seccion</label>
                                                  <div class="input-group" style="width:100%;">
                                                    <span class="input-group-addon" style="width:5%;"><i class="fa fa-cogs"></i></span>
                                                    <select class="form-control select2 input-lg seccionModificar" style="width:100%;" name="<?=$data['id_clase']; ?>" id="seccion<?= $data['id_clase']; ?>">
                                                      <option value="">Sección</option>
                                                      <?php foreach ($secciones as $date) : if (!empty($date['cod_seccion'])) :   ?>
                                                          <option value="<?php echo $date['cod_seccion'] ?>" <?php if ($date['cod_seccion'] == $data['cod_seccion']) { echo "selected"; $yearSeccion = $date['year_seccion']; } ?>><?= $date['nombre_seccion'] ?> (<?= $date['year_seccion']; ?>)</option>
                                                      <?php endif;
                                                      endforeach; ?>
                                                    </select>
                                                  </div>
                                                  <div style="width:100%;text-align:right;">
                                                    <span id="seccionS<?= $data['id_clase'] ?>" class="mensajeError"></span>
                                                  </div>
                                                </div>

                                                <div class="form-group col-xs-12 col-sm-12">
                                                  <label for="periodo">Período</label>
                                                  <div class="input-group" style="width:100%;">
                                                    <span class="input-group-addon" style="width:5%;"><i class="fa fa-address-card"></i></span> 
                                                    <select class="form-control select2 input-lg periodoModificar" style="width:100%;" name="<?= $data['id_clase']; ?>" placeholder="Ingresar periodo" id="periodo<?= $data['id_clase']; ?>" required>
                                                      <option value="">Seleccione un periodo</option>
                                                      <?php
                                                      foreach ($periodos as $per){
                                                        if(!empty($per['id_periodo'])){
                                                          if($per['year_periodo']==$yearSeccion){
                                                            ?>

                                                        <option <?php if($data['id_periodo']==$per['id_periodo']){ echo "selected"; } ?> value="<?=$per['id_periodo']?>"><?=mb_strtoupper($per['year_periodo']."-".$per['nombre_periodo']); ?></option>

                                                              <?php 
                                                            }
                                                          }
                                                        }
                                                      ?>
                                                    </select>
                                                  </div>
                                                  <div style="width:100%;text-align:right;">
                                                    <span id="periodoS" class="mensajeError"></span>
                                                  </div>
                                                </div> 

                                                <!-- ENTRADA PARA EL SABER -->
                                                <div class="form-group col-xs-12 col-sm-12" style="margin-top:2%;">
                                                  <label for="saber<?=$data['id_clase']; ?>">Saber complementario</label>
                                                  <div class="input-group" style="width:100%;">
                                                    <span class="input-group-addon" style="width:5%;"><i class="fa fa-indent"></i></span>
                                                    <select class="form-control select2 input-lg saberModificar" style="width:100%;" name="<?=$data['id_clase']; ?>" id="saber<?= $data['id_clase']; ?>">
                                                      <option value="">Saber Complementario</option>
                                                      <?php foreach ($saberes as $dateS) : if (!empty($dateS['id_SC'])) : ?>
                                                          <?php if (($dateS['trayecto_SC'] == $data['trayecto_SC']) && ($dateS['fase_SC'] == $data['fase_SC'])) : ?>
                                                            <option value="<?php echo $dateS['id_SC'] ?>" 
                                                              <?php 
                                                                if ($dateS['id_SC'] == $data['id_SC']) {
                                                                  echo "selected"; 
                                                                }else{
                                                                  foreach ($clases as $class) {
                                                                    if(!empty($class['id_clase'])){
                                                                      if($class['id_SC']==$dateS['id_SC']){
                                                                        echo "disabled";
                                                                      }
                                                                    }
                                                                  }
                                                                } ?>
                                                                ><?php echo $dateS['nombreSC'] 
                                                              ?>
                                                            </option>

                                                          <?php endif; ?>
                                                      <?php endif;
                                                      endforeach; ?>
                                                    </select>
                                                  </div>
                                                  <div style="width:100%;text-align:right;">
                                                    <span id="saberS<?= $data['id_clase'] ?>" class="mensajeError"></span>
                                                  </div>
                                                </div>

                                                <!-- ENTRADA PARA EL PROFESOR -->
                                                <div class="form-group col-xs-12 col-sm-12"  style="margin-top:2%;">
                                                  <label for="profesor<?= $data['id_clase']; ?>">Profesor</label>
                                                  <div class="input-group" style="width:100%;">
                                                    <span class="input-group-addon" style="width:5%;"><i class="fa fa-indent"></i></span>
                                                    <select class="form-control select2 input-lg profesorModificar" style="width:100%;" name="<?=$data['id_clase']; ?>" id="profesor<?= $data['id_clase']; ?>">
                                                      <option value="">Profesor</option>
                                                      <?php foreach ($profesores as $dateP) : if (!empty($dateP['cedula_profesor'])) : ?>
                                                          <option value="<?php echo $dateP['cedula_profesor'] ?>" <?php if ($dateP['cedula_profesor'] == $data['cedula_profesor']) { echo "selected"; } ?>><?php echo $dateP['nombre_profesor'] . " " . $dateP['apellido_profesor'] ?></option>
                                                      <?php endif;
                                                      endforeach; ?>
                                                    </select>
                                                  </div>
                                                  <div style="width:100%;text-align:right;">
                                                    <span id="profesorS<?= $data['id_clase'] ?>" class="mensajeError"></span>
                                                  </div>
                                                </div>
                                              </div>
                                            </div>
                                          </div>


                                          <div class="modal-footer">
                                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

                                            <button type="button" class="btn btn-primary modificarButtonModal" value="<?= $data['id_clase'] ?>" id="modificar">Modificar</button>

                                          </div>
                                        </form>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- Modificar -->

                                <?php endif; ?>

                                <?php if ($amClasesB == 1) : ?>
                                  <button class="btn eliminarBtn" style="border:0;background:none;color:red" value="<?php echo $data['id_clase'] ?>">
                                    <span class="fa fa-trash"></span>
                                  </button>
                                <?php endif; ?>
                              </td>
                            <?php endif; ?>



                          </tr>
                      <?php
                        endif;
                      endforeach;
                      ?>
                    </tbody>
                    <tfoot>
                      <tr>
                        <th>Nº</th>
                        <th>Saber Complementario</th>
                        <th>Sección</th>
                        <th>Profesor</th>
                        <?php if ($amClasesE == 1 || $amClasesB == 1) : ?>
                          <th>Acciones</th>
                        <?php endif; ?>
                      </tr>
                    </tfoot>
                  </table>

                </div>


              </div>
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
  <script src="<?= _THEME_ ?>/js/clases.js"></script>
</body>

</html>