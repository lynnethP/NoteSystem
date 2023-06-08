<!DOCTYPE html>
<html>

<head>
  <title><?php echo _NAMESYSTEM_; ?> | <?php if (!empty($action)){ echo $action; } ?> <?php if (!empty($url)) { echo $url; } ?></title>
  <?php //require_once('assets/headers.php'); ?>
  <link rel="stylesheet" type="text/css" href="<?=_THEME_; ?>/css/inputFile.css">
</head>

<body class="hold-transition skin-blue sidebar-mini" style="width:100% !important;min-padding-right:0 !important;max-padding-right:0 !important;width:100% !important;">
  <div class="box-cargando" style="background:rgba(0,0,0,.8);position:absolute;top:0;bottom:0;left:0;right:0;width:100%;height:100vh;z-index:1100;text-align:center;display:none;color:#767676;">
    <img src="assets/gifty/loading-13.gif" alt="cargando" style="margin-top:15vh;max-height:100vh;max-width:100vh;width:30vh;">
    <h3>Cargando . . .</h3>
  </div>
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
          <li><a href="<?= _ROUTE_ . $this->encriptar('Alumnos'); ?>"><?php echo $url; ?></a></li>
          <li class="active"><?php if (!empty($action)) { echo $action; } echo " " . $url; ?></li>
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
                  <?php if ($amAlumnosR == "1") : ?>
                    <button type="button" class="btn btn-next btn-fill btn btn-success btn-wd btn-sm" data-toggle="modal" data-target="#modalAgregarArchivo">Subir archivo</button>
                    <div id="modalAgregarArchivo" class="#modalAgregarArchivo modal fade" role="dialog">

                      <div class="modal-dialog tamModals" style="text-align:left;">
                        <div class="modal-content">
                          <form role="form" method="post" enctype="multipart/form-data" id="form_data">
                            <div class="modal-header" style="background:#3c8dbc; color:white">
                              <button type="button" class="close" data-dismiss="modal" style="top:25px;">&times;</button>
                              <h4 class="modal-title" style="text-align: left;">Agregar Data</h4>
                            </div>

                            <div class="modal-body">
                              <div class="box-body">
                                <br>
                                <div class="file-input text-center custom-input-file">
                                  <input type="file" name="file[]" multiple id="file-input" class="file-input__input input-file" accept=".xls, .xlsx" />
                                  <label class="file-input__label" for="file-input">
                                    <i class="fa fa-upload zmdi zmdi-upload"></i>
                                    <span> Seleccionar Archivo</span></label>
                                  <span id="archivoSeleccionado"></span>
                                </div>
                                <div>
                                  <span>
                                  </span>
                                </div>
                                <br>
                              </div>
                            </div>

                            <div class="modal-footer">
                              <span type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</span>
                              <span type="submit" class="btn btn-primary subir" id="subir">Subir</span>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>


                    <button type="button" class="btn enviar2 btn-next btn-fill btn btn-primary btn-wd btn-sm" data-toggle="modal" data-target="#modalAgregarAlum">Agregar Nuevo</button>
                    <div id="modalAgregarAlum" class="modalAgregarAlum modal fade" role="dialog">
                      <div class="modal-dialog tamModals" style="text-align:left;">
                        <div class="modal-content">
                          <form role="form" method="post" id="formAgregar" enctype="multipart/form-data">
                            <div class="modal-header" style="background:#3c8dbc;color:white">
                              <button type="button" class="close" style="top:25px;" id="cerrarM">&times;</button>
                              <h4 class="modal-title" style="text-align: left;">Agregar Alumno</h4>
                            </div>
                            <div class="modal-body" style="max-height:70vh;overflow:auto;">
                              <div class="box-body">
                                <!-- ENTRADA PARA EL USUARIO -->
                                <div class="row">
                                  <div class="form-group col-xs-12 col-sm-12">
                                    <label for="cedula">Cedula</label>
                                    <div class="input-group" style="width:100%;">
                                      <span class="input-group-addon" style="width:5%;"><i class="fa fa-address-card"></i></span>
                                      <input type="text" class="form-control input-lg" name="nuevaCedula" placeholder="Ingresar cedula" id="cedula" maxlength="8" required>
                                    </div>
                                    <div style="width:100%;text-align:right;">
                                      <span id="cedulaS" class="mensajeError"></span>
                                    </div>
                                  </div>

                                  <!-- ENTRADA PARA EL NOMBRE -->
                                  <div class="form-group col-xs-12 col-sm-12">
                                    <label for="nombre">Nombre</label>
                                    <div class="input-group" style="width:100%;">
                                      <span class="input-group-addon" style="width:5%;"><i class="fa fa-user"></i></span>
                                      <input type="text" class="form-control input-lg" name="nuevoNombre" id="nombre" placeholder="Ingresar nombre" maxlength="25" required>
                                    </div>
                                    <div style="width:100%;text-align:right;">
                                      <span id="nombreS" class="mensajeError"></span>
                                    </div>
                                  </div>

                                  <!-- ENTRADA PARA EL APELLIDO -->
                                  <div class="form-group col-xs-12 col-sm-12">
                                    <label for="apellido">Apellido</label>
                                    <div class="input-group" style="width:100%;">
                                      <span class="input-group-addon" style="width:5%;"><i class="fa fa-user"></i></span>
                                      <input type="text" class="form-control input-lg" name="nuevoApellido" id="apellido" placeholder="Ingresar apellido" maxlength="25" required>
                                    </div>
                                    <div style="width:100%;text-align:right;">
                                      <span id="apellidoS" class="mensajeError"></span>
                                    </div>
                                  </div>

                                  <!--ENTRADA TELÉFONO -->
                                  <!-- <div class="form-group col-xs-12 col-sm-12">
                                  <label for="telefono">Telefono</label>
                                  <div class="input-group" style="width:100%;">
                                    <span class="input-group-addon" style="width:5%;"><i class="fa fa-user"></i></span>
                                    <input type="text" class="form-control input-lg" name="nuevoTeleono" id="telefono" placeholder="Ingresar Nro Telefonico" maxlength="11" required>
                                  </div>
                                  <div style="width:100%;text-align:right;">
                                    <span id="telefonoS" class="mensajeError"></span>
                                  </div>
                                </div> -->

                                  <!-- ENTRADA TRAYECTO -->
                                  <div class="form-group col-xs-12 col-sm-12">
                                    <label for="trayecto">Trayecto</label>
                                    <div class="input-group" style="width:100%;">
                                      <span class="input-group-addon" style="width:5%;"><i class="fa fa-address-card"></i></span>
                                      <select class="form-control" style="width:100%;" name="trayecto" placeholder="Ingresar trayecto" id="trayecto" required>
                                        <option value="">Seleccione un trayecto</option>
                                        <option value="1">Trayecto I</option>
                                        <option value="2">Trayecto II</option>
                                        <option value="3">Trayecto III</option>
                                        <option value="4">Trayecto IV</option>
                                      </select>
                                    </div>
                                    <div style="width:100%;text-align:right;">
                                      <span id="trayectoS" class="mensajeError"></span>
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
                  <table id="datatable" class="table table-striped text-center" style="text-align:center;width:100%;font-size:1em;">
                    <thead>
                      <tr>
                        <th>Nº</th>
                        <th>Cédula</th>
                        <th>Nombre y Apellido</th>
                        <th>Trayecto</th>
                        <!-- <th>Télefono</th> -->
                        <?php if ($amAlumnosE == 1 || $amAlumnosB == 1) : ?>
                          <th>Acciones</th>
                        <?php endif; ?>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      $num = 1;
                      foreach ($alumnos as $data) :
                        if (!empty($data['cedula_alumno'])) :
                          if ($data['cedula_alumno'] != $_SESSION['cuenta_persona']['cedula']) :
                            $imagen = "assets/img/perfil/user-default.png";
                            foreach ($usuarios as $users) {
                              if(!empty($users['cedula_usuario'])){
                                if($users['cedula_usuario']==$data['cedula_alumno']){
                                  if($users['imagen'] != ""){
                                    $imagen = $users['imagen'];
                                  }
                                }
                              }
                            }
                            $dataImagen = getimagesize($imagen); //Sacamos la información.
                            $ancho = $dataImagen[0]; //Ancho.
                            $alto = $dataImagen[1]; //Alto.

                            switch ($data['trayecto_alumno']) {
                              case '1':
                                $trayecto = 'I';
                                break;
                              case '2':
                                $trayecto = 'II';
                                break;
                              case '3':
                                $trayecto = 'III';
                                break;
                              case '4':
                                $trayecto = 'IV';
                                break;
                              default:
                                break;
                            }
                      ?>
                            <tr>
                              <td style="width:5%">
                                <span class="contenido2">
                                  <?php echo $num++; ?>
                                </span>
                              </td>
                              <td style="width:20%">
                                <span class="contenido2">
                                  <?php echo $data['cedula_alumno']; ?>
                                </span>
                              </td>
                              <td style="width:20%">
                                <span class="contenido2">
                                  <?php 
                                    if ($alto >= $ancho){
                                      $styleImg = "margin:0;padding:0 0;width:auto;height:80px;max-height:80px;";
                                    }
                                    if ($alto < $ancho){
                                      $styleImg = "margin:0;padding:0 0;width:auto;height:80px;max-height:80px;";
                                    }
                                  ?>
                                  <img style="<?=$styleImg; ?>" src="<?=$imagen;?>">
                                  <br>
                                  <?php echo $data['nombre_alumno'] . " " . $data['apellido_alumno']; ?>
                                </span>
                              </td>
                              <td style="width:20%">
                                <span class="contenido2">
                                  <?php echo "Trayecto " . $trayecto ; ?>
                                </span>
                              </td>

                              <?php if ($amAlumnosE == 1 || $amAlumnosB == 1) :  ?>
                                <td style="width:10%">
                                  <?php if ($amAlumnosE == 1) : ?>
                                    <button class="btn modificarBtn" style="border:0;background:none;color:#04a7c9" value="<?php echo $data['cedula_alumno'] ?>">
                                      <span class="fa fa-pencil"></span>
                                    </button>

                                    <!-- Modificar -->
                                    <button type="button" id="modificarButton<?= $data['cedula_alumno'] ?>" class="btn enviar2 btn-next btn-fill btn btn-primary btn-wd btn-sm" data-toggle="modal" data-target="#modalModificarAlum<?= $data['cedula_alumno'] ?>" style="display: none">Modificar</button>
                                    <div id="modalModificarAlum<?= $data['cedula_alumno'] ?>" class="modalModificarAlum modal fade modalModificarAlum<?= $data['cedula_alumno'] ?>" role="dialog">
                                      <div class="modal-dialog tamModals" style="text-align:left;">
                                        <div class="modal-content">
                                          <form role="form" method="post" id="formModificar" enctype="multipart/form-data">
                                            <div class="modal-header" style="background:#3c8dbc; color:white">
                                              <button type="button" class="close" data-dismiss="modal" style="top:25px;">&times;</button>
                                              <h4 class="modal-title" style="text-align: left;">Modificar Alumno</h4>
                                            </div>

                                            <div class="modal-body" style="max-height:70vh;overflow:auto;">
                                              <div class="box-body">
                                                <div class="row">

                                                  <!-- ENTRADA PARA EL USUARIO -->
                                                  <div class="form-group col-xs-12 col-sm-12">
                                                    <label for="cedula<?= $data['cedula_alumno'] ?>">Cedula</label>
                                                    <div class="input-group" style="width:100%;">
                                                      <span class="input-group-addon" style="width:5%;"><i class="fa fa-address-card"></i></span>
                                                      <input type="text" class="form-control input-lg cedulaModificar" maxlength="8" value="<?= $data['cedula_alumno'] ?>" name="<?= $data['cedula_alumno'] ?>" placeholder="Ingresar cedula" id="cedula<?= $data['cedula_alumno'] ?>" required>
                                                    </div>
                                                    <div style="width:100%;text-align:right;">
                                                      <span id="cedulaS<?= $data['cedula_alumno'] ?>" class="mensajeError"></span>
                                                    </div>
                                                  </div>

                                                  <!-- ENTRADA PARA EL NOMBRE -->
                                                  <div class="form-group col-xs-12 col-sm-12" style="margin-top:2%;">
                                                    <label for="nombre<?= $data['cedula_alumno'] ?>">Nombre</label>
                                                    <div class="input-group" style="width:100%;">
                                                      <span class="input-group-addon" style="width:5%;"><i class="fa fa-user"></i></span>
                                                      <input type="text" class="form-control input-lg nombreModificar" maxlength="25" value="<?= $data['nombre_alumno'] ?>" name="<?= $data['cedula_alumno'] ?>" id="nombre<?= $data['cedula_alumno'] ?>" placeholder="Ingresar nombre" required>
                                                    </div>
                                                    <div style="width:100%;text-align:right;">
                                                      <span id="nombreS<?= $data['cedula_alumno'] ?>" class="mensajeError"></span>
                                                    </div>
                                                  </div>


                                                  <!-- ENTRADA PARA EL APELLIDO -->
                                                  <div class="form-group col-xs-12 col-sm-12" style="margin-top:2%;">
                                                    <label for="apellido<?= $data['cedula_alumno'] ?>">Apellido</label>
                                                    <div class="input-group" style="width:100%;">
                                                      <span class="input-group-addon" style="width:5%;"><i class="fa fa-user"></i></span>
                                                      <input type="text" class="form-control input-lg apellidoModificar" maxlength="25" value="<?= $data['apellido_alumno'] ?>" name="<?= $data['cedula_alumno'] ?>" id="apellido<?= $data['cedula_alumno'] ?>" placeholder="Ingresar apellido" required>
                                                    </div>
                                                    <div style="width:100%;text-align:right;">
                                                      <span id="apellidoS<?= $data['cedula_alumno'] ?>" class="mensajeError"></span>
                                                    </div>
                                                  </div>


                                                  <!-- ENTRADA TRAYECTO -->
                                                  <div class="form-group col-xs-12 col-sm-12" style="margin-top:2%;">
                                                    <label for="trayecto<?= $data['cedula_alumno'] ?>">Trayecto</label>
                                                    <div class="input-group" style="width:100%;">
                                                      <span class="input-group-addon" style="width:5%;"><i class="fa fa-address-card"></i></span>
                                                      <select class="form-control select2 input-lg trayectoModificar" style="width:100%;" name="<?= $data['cedula_alumno'] ?>" placeholder="Ingresar trayecto" id="trayecto<?= $data['cedula_alumno'] ?>" required>
                                                        <option value="">Seleccione un trayecto</option>
                                                        <option <?php if ($data['trayecto_alumno'] == "1") {
                                                                  echo "selected";
                                                                } ?> value="1">Trayecto I</option>
                                                        <option <?php if ($data['trayecto_alumno'] == "2") {
                                                                  echo "selected";
                                                                } ?> value="2">Trayecto II</option>
                                                        <option <?php if ($data['trayecto_alumno'] == "3") {
                                                                  echo "selected";
                                                                } ?> value="3">Trayecto III</option>
                                                        <option <?php if ($data['trayecto_alumno'] == "4") {
                                                                  echo "selected";
                                                                } ?> value="4">Trayecto IV</option>
                                                      </select>
                                                    </div>
                                                    <div style="width:100%;text-align:right;">
                                                      <span id="trayectoS<?= $data['cedula_alumno'] ?>" class="mensajeError"></span>
                                                    </div>
                                                  </div>

                                                </div>

                                              </div>

                                            </div>


                                            <div class="modal-footer">
                                              <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>
                                              <button type="button" class="btn btn-primary modificarButtonModal" value="<?= $data['cedula_alumno'] ?>" id="modificar">Modificar</button>
                                            </div>
                                          </form>
                                        </div>

                                      </div>
                                    </div>
                                    <!-- Modificar -->

                                  <?php endif; ?>

                                  <?php if ($amAlumnosB == 1) : ?>
                                    <button class="btn eliminarBtn" style="border:0;background:none;color:red" value="<?php echo $data['cedula_alumno'] ?>">
                                      <span class="fa fa-trash"></span>
                                    </button>
                                  <?php endif; ?>
                                </td>
                              <?php endif; ?>

                            </tr>
                      <?php
                          endif;
                        endif;
                      endforeach;
                      ?>
                    </tbody>
                    <tfoot>
                      <tr>
                        <th>Nº</th>
                        <th>Cédula</th>
                        <th>Nombre y Apellido</th>
                        <th>Trayecto</th>
                        <?php if ($amAlumnosE == 1 || $amAlumnosB == 1) : ?>
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


  </div>
  <!-- ./wrapper -->

  <?php if (!empty($response)) : ?>
    <input type="hidden" class="responses" value="<?php echo $response ?>">
  <?php endif; ?>
  <script src="<?= _THEME_ ?>/js/alumnos.js"></script>
</body>

</html>