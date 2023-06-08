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


  <style type="text/css">
    .zmdi-upload {
      padding: 0px 10px 0px 0px;
    }

    .zmdi-upload:hover {
      color: black;
      transition: color 0.2s linear 0.2s;
    }

    .file-input__input {
      width: 0.1px;
      height: 0.1px;
      opacity: 0;
      overflow: hidden;
      position: absolute;
      z-index: -1;
    }

    .file-input__label {
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      border-radius: 4px;
      font-size: 14px;
      font-weight: 600;
      color: #fff;
      font-size: 14px;
      padding: 10px 12px;
      background-color: #4245a8;
      box-shadow: 0px 0px 2px rgba(0, 0, 0, 0.25);
    }

    .clics:hover {
      cursor: pointer;
    }
  </style>
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
          <li><a href="<?= _ROUTE_ . $this->encriptar('Mantenimiento'); ?>"><?php echo $url; ?></a></li>
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
            <br><br><br><br><br>
              <div class="box-header">
                <br><br><br><br>
                <div class="col-md-12">


                  <div class="row">
                    <!-- <div class="col-lg-3 col-xs-6"></div> -->
                    <a href="" id="descargarBackup" download=""></a>
                    <div class="col-xs-12 col-sm-6 col-lg-3 col-lg-offset-3">
      
                      <div class="small-box bg-green">
                        <div class="inner">
                          <h3 style="font-size: 26px;">Respaldar<sup style="font-size: 20px"></sup></h3>

                          <p>Respaldo de la <br> Base de Datos</p>
                        </div>
                        <div class="icon">
                          <i class="fa fa-cloud-download" style="margin-top: 20px;"></i>
                        </div>
                        <a id="" class="small-box-footer clics ">
                          <button value="respaldar" class="verify" style="background: transparent; border:none; outline: none;">
                            <i class="fa fa-arrow-circle-right" style="font-size:1.7em;margin-top:10px;margin-bottom:10px;"></i>
                          </button>
                        </a>

                        <button type="button" id="verificarButton" class="btn enviar2 btn-next btn-fill btn btn-primary btn-wd btn-sm" data-toggle="modal" data-target="#modalVerificarDatos" style="display:none;">Verificar</button>
                        <div id="modalVerificarDatos" class="modalVerificarDatos modal fade modalVerificarDatos" role="dialog">
                          <div class="modal-dialog tamModals" style="text-align:left;">
                            <div class="modal-content">
                              <form role="form" method="post" enctype="multipart/form-data">
                              <div class="modal-header" style="background:#3c8dbc; color:white">
                                <button type="button" class="close verificarCerrar" data-dismiss="modal" style="top:25px;">&times;</button>
                                <h4 class="modal-title" style="text-align: left;">Verificar cuenta de usuario</h4>
                              </div>
                              <div class="modal-body" style="max-height:70vh;overflow:auto;">
                                <div class="box-body">
                                  <div class="row">
                                    <div class="form-group col-xs-12 col-sm-12">
                                      <p style="font-size:1.2em; color:black;">Saludos, <b><?= $_SESSION['cuenta_persona']['nombre'] . " " . $_SESSION['cuenta_persona']['apellido']; ?></b> Por favor, ingresa la contraseña de su cuenta de usuario.</p>
                                    </div>
                                    <div class="form-group col-xs-12 col-sm-12">
                                      <label for="passwordVerificar" style="color: black;">Contraseña</label>
                                      <div class="input-group" style="width:100%;">
                                        <span class="input-group-addon" style="width:5%;"><i class="fa fa-key"></i></span>
                                        <input type="password" class="form-control input-lg passwordVerificar" id="passwordVerificar" style="width:100%;" placeholder="Ingresar su contraseña" required>
                                      </div>
                                      <div style="width:100%;text-align:right;">
                                        <span id="passwordVerificarM" class="mensajeError"></span>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-default pull-left verificarCerrar" data-dismiss="modal">Salir</button>
                                <button type="submit" class="btn btn-primary passwordVerificarButtonModal" name="" id="verificar">Verificar</button>
                              </div>
                              </form>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-lg-3">
                      <div class="small-box bg-red">
                        <div class="inner">
                          <h3 style="font-size: 26px;">Restaurar</h3>

                          <p>Restauración de <br> la Base de Datos</p>
                        </div>
                        <div class="icon">
                          <i class="fa fa-cloud-upload" style="margin-top: 20px;"></i>
                        </div>
                        <a id="" class="small-box-footer clics">
                          <button value="restaurar" class="verify" style="background: transparent; border:none; outline: none;">
                            <i class="fa fa-arrow-circle-right" style="font-size:1.7em;margin-top:10px;margin-bottom:10px;"></i>
                          </button>
                        </a>
                        <button type="button" id="verificarButton" class="btn enviar2 btn-next btn-fill btn btn-primary btn-wd btn-sm" data-toggle="modal" data-target="#modalVerificarDatos" style="display:none;">Verificar</button>
                        <button type="button" id="archivo" class="btn enviar2 btn-next btn-fill btn btn-primary btn-wd btn-sm" data-toggle="modal" data-target="#modalAgregarArchivo" style="display:none;">Archivo</button>
                      </div>
                    </div>

                  </div>

                </div>

                <input type="hidden" id="url" value="<?= $this->encriptar($this->url); ?>">
                <input type="hidden" id="urlUser" value="<?= $this->encriptar("Usuarios"); ?>">
                


                <div id="modalAgregarArchivo" class="#modalAgregarArchivo modal fade" role="dialog">
                  <div class="modal-dialog">

                    <div class="modal-content">

                      <form role="form" method="post" enctype="multipart/form-data" id="form_data">


                        <div class="modal-header" style="background:#3c8dbc; color:white">

                          <button type="button" class="close" data-dismiss="modal" style="top:25px;">&times;</button>

                          <h4 class="modal-title" style="text-align: left;">Respaldar Base de Datos | Archivo SQL</h4>

                        </div>


                        <div class="modal-body">

                          <div class="box-body">

                            <br>
                            <div class="file-input text-center custom-input-file">
                              <input type="file" name="file[]" multiple id="file-input" class="file-input__input input-file" accept=".sql" />
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
              </div>

              <br><br><br><br><br>
              <br><br><br><br><br>
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
  <script src="<?= _THEME_ ?>/js/mantenimientos.js"></script>
</body>

</html>