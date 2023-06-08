<!DOCTYPE html>
<html>

<head>
  <title><?php echo _NAMESYSTEM_; ?> | <?php if (!empty($action)) { echo $action; } ?> <?php if (!empty($url)) { echo $url; } ?></title>
  <?php //require_once('assets/headers.php'); ?>
  <link rel="stylesheet" type="text/css" href="<?=_THEME_; ?>/css/inputFile.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">
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
          <li><a href="<?= _ROUTE_ . $this->encriptar('Profesores'); ?>"><?php echo $url; ?></a></li>
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
                  <?php if ($amProfesoresR == "1") : ?>
                    <button type="button" class="btn btn-next btn-fill btn btn-success btn-wd btn-sm" data-toggle="modal" data-target="#modalAgregarArchivo">Subir archivo</button>
                    <div id="modalAgregarArchivo" class="#modalAgregarArchivo modal fade" role="dialog">
                      <div class="modal-dialog tamModals">
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

                    <button type="button" class="btn enviar2 btn-next btn-fill btn btn-primary btn-wd btn-sm" data-toggle="modal" data-target="#modalAgregarProf">Agregar Nuevo</button>
                    <div id="modalAgregarProf" class="#modalAgregarProf modal fade" role="dialog">
                      <div class="modal-dialog tamModals" style="text-align:left;">
                        <div class="modal-content">
                          <form role="form" method="post" id="formAgregar" enctype="multipart/form-data">
                            <div class="modal-header" style="background:#3c8dbc; color:white">
                              <button type="button" class="close" data-dismiss="modal" style="top:25px;" id="cerrarM">&times;</button>
                              <h4 class="modal-title" style="text-align: left;">Agregar Profesor</h4>
                            </div>
                            <div class="modal-body" style="max-height:70vh;overflow:auto;">
                              <div class="box-body">
                                <div class="row">
                                  <!-- ENTRADA PARA EL USUARIO -->
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
                                  <div class="form-group col-xs-12 col-sm-12">
                                    <label for="telefono">Telefono</label>
                                    <div class="input-group" style="width:100%;">
                                      <span class="input-group-addon" style="width:5%;"><i class="fa fa-user"></i></span>
                                      <input type="text" class="form-control input-lg" name="nuevoTeleono" id="telefono" placeholder="Ingresar Nro Telefonico" maxlength="11" required>
                                    </div>
                                    <div style="width:100%;text-align:right;">
                                      <span id="telefonoS" class="mensajeError"></span>
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
                        <th>Teléfono</th>
                        <?php if ($amProfesoresE == 1 || $amProfesoresB == 1) : ?>
                          <th>Acciones</th>
                        <?php endif; ?>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      $num = 1;
                      foreach ($profesores as $data) :
                        if (!empty($data['cedula_profesor'])) :
                          if ($data['cedula_profesor'] != $_SESSION['cuenta_persona']['cedula']) :
                            $imagen = "assets/img/perfil/user-default.png";
                            foreach ($usuarios as $users) {
                              if(!empty($users['cedula_usuario'])){
                                if($users['cedula_usuario']==$data['cedula_profesor']){
                                  if($users['imagen'] != ""){
                                    $imagen = $users['imagen'];
                                  }
                                }
                              }
                            }
                            $dataImagen = getimagesize($imagen); //Sacamos la información.
                            $ancho = $dataImagen[0]; //Ancho.
                            $alto = $dataImagen[1]; //Alto.
                      ?>
                            <tr>
                              <td style="width:5%">
                                <span class="contenido2">
                                  <?php echo $num++; ?>
                                </span>
                              </td>
                              <td style="width:25%">
                                <span class="contenido2">
                                  <?php echo $data['cedula_profesor']; ?>
                                </span>
                              </td>
                              <td style="width:25%">
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
                                  <?php echo $data['nombre_profesor'] . " " . $data['apellido_profesor']; ?>
                                </span>
                              </td>
                              <td style="width:25%">
                                <span class="contenido2">
                                  <?php echo $data['telefono_profesor']; ?>
                                </span>
                              </td>

                              <?php if ($amProfesoresE == 1 || $amProfesoresB == 1) :
                              ?>
                                <td style="width:10%">
                                  <?php if ($amProfesoresE == 1) : ?>
                                    <button class="btn modificarBtn" style="border:0;background:none;color:#04a7c9" value="<?php echo $data['cedula_profesor'] ?>">
                                      <span class="fa fa-pencil"></span>
                                    </button>


                                    <!-- Modificar -->
                                    <button type="button" id="modificarButton<?= $data['cedula_profesor'] ?>" class="btn enviar2 btn-next btn-fill btn btn-primary btn-wd btn-sm" data-toggle="modal" data-target="#modalModificarProf<?= $data['cedula_profesor'] ?>" style="display: none">Modificar</button>
                                    <div id="modalModificarProf<?= $data['cedula_profesor'] ?>" class="modalModificarProf modal fade modalModificarProf<?= $data['cedula_profesor'] ?>" role="dialog">

                                      <div class="modal-dialog tamModals" style="text-align:left;">
                                        <div class="modal-content">

                                          <div class="modal-header" style="background:#3c8dbc; color:white">
                                            <button type="button" class="close" data-dismiss="modal" style="top:25px;">&times;</button>
                                            <h4 class="modal-title" style="text-align: left;">Modificar Profesor</h4>
                                          </div>


                                          <div class="modal-body" style="max-height:70vh;overflow:auto;">

                                            <div class="box-body">

                                              <div class="row">

                                                <!-- ENTRADA PARA EL USUARIO -->
                                                <div class="form-group col-xs-12 col-sm-12">
                                                  <label for="cedula<?= $data['cedula_profesor'] ?>">Cedula</label>
                                                  <div class="input-group" style="width:100%;">
                                                    <span class="input-group-addon" style="width:5%;"><i class="fa fa-address-card"></i></span>
                                                    <input type="text" class="form-control input-lg cedulaModificar" maxlength="8" value="<?= $data['cedula_profesor'] ?>" name="<?= $data['cedula_profesor'] ?>" placeholder="Ingresar cedula" id="cedula<?= $data['cedula_profesor'] ?>" required>
                                                  </div>
                                                  <div style="width:100%;text-align:right;">
                                                    <span id="cedulaS<?= $data['cedula_profesor'] ?>" class="mensajeError"></span>
                                                  </div>
                                                </div>


                                                <!-- ENTRADA PARA EL NOMBRE -->
                                                <div class="form-group col-xs-12 col-sm-12" style="margin-top:2%;">
                                                  <label for="nombre<?= $data['cedula_profesor'] ?>">Nombre</label>
                                                  <div class="input-group" style="width:100%;">
                                                    <span class="input-group-addon" style="width:5%;"><i class="fa fa-user"></i></span>
                                                    <input type="text" class="form-control input-lg nombreModificar" maxlength="25" value="<?= $data['nombre_profesor'] ?>" name="<?= $data['cedula_profesor'] ?>" id="nombre<?= $data['cedula_profesor'] ?>" placeholder="Ingresar nombre" required>
                                                  </div>
                                                  <div style="width:100%;text-align:right;">
                                                    <span id="nombreS<?= $data['cedula_profesor'] ?>" class="mensajeError"></span>
                                                  </div>
                                                </div>


                                                <!-- ENTRADA PARA EL APELLIDO -->
                                                <div class="form-group col-xs-12 col-sm-12" style="margin-top:2%;">
                                                  <label for="apellido<?= $data['cedula_profesor'] ?>">Apellido</label>
                                                  <div class="input-group" style="width:100%;">
                                                    <span class="input-group-addon" style="width:5%;"><i class="fa fa-user"></i></span>
                                                    <input type="text" class="form-control input-lg apellidoModificar apellidoModificar<?= $data['cedula_profesor'] ?>" maxlength="25" value="<?= $data['apellido_profesor'] ?>" name="<?= $data['cedula_profesor'] ?>" id="apellido<?= $data['cedula_profesor'] ?>" placeholder="Ingresar apellido" required>
                                                  </div>
                                                  <div style="width:100%;text-align:right;">
                                                    <span id="apellidoS<?= $data['cedula_profesor'] ?>" class="mensajeError"></span>
                                                  </div>
                                                </div>

                                                <!--ENTRADA TELÉFONO -->
                                                <div class="form-group col-xs-12 col-sm-12" style="margin-top:2%;">
                                                  <label for="telefono<?= $data['cedula_profesor'] ?>">Telefono</label>
                                                  <div class="input-group" style="width:100%;">
                                                    <span class="input-group-addon" style="width:5%;"><i class="fa fa-user"></i></span>
                                                    <input type="text" class="form-control input-lg telefonoModificar telefonoModificar<?= $data['cedula_profesor'] ?>" maxlength="11" value="<?= $data['telefono_profesor'] ?>" name="<?= $data['cedula_profesor'] ?>" id="telefono<?= $data['cedula_profesor'] ?>" placeholder="Ingresar Nro Telefonico" required>
                                                  </div>
                                                  <div style="width:100%;text-align:right;">
                                                    <span id="telefonoS<?= $data['cedula_profesor'] ?>" class="mensajeError"></span>
                                                  </div>
                                                </div>
                                              </div>
                                            </div>
                                          </div>


                                          <div class="modal-footer">
                                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>
                                            <button type="submit" class="btn btn-primary modificarButtonModal" value="<?= $data['cedula_profesor'] ?>" id="modificar">Modificar</button>
                                          </div>


                                        </div>

                                      </div>
                                    </div>
                                    <!-- Modificar -->

                                  <?php endif; ?>
                                  <?php if ($amProfesoresB == 1) : ?>
                                    <button class="btn eliminarBtn" style="border:0;background:none;color:red" value="<?php echo $data['cedula_profesor'] ?>">
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
                        <th>Teléfono</th>
                        <?php if ($amProfesoresE == 1 || $amProfesoresB == 1) : ?>
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
  <script src="<?= _THEME_ ?>/js/profesores.js"></script>
</body>

</html>