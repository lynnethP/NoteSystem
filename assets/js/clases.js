$(document).ready(function () {
  if ($(window).width() < 768) { // XS
    $(".tamModals").attr("style", "width:95%;margin-left:auto;margin-right:auto;text-align:left !important;");
  }
  if ($(window).width() >= 768 && $(window).width() < 992) { // SM
    $(".tamModals").attr("style", "width:85%;margin-left:auto;margin-right:auto;text-align:left !important;");
  }
  if ($(window).width() >= 992 && $(window).width() < 1200) { // MD
    $(".tamModals").attr("style", "width:70%;margin-left:auto;margin-right:auto;text-align:left !important;");
  }
  if ($(window).width() >= 1200) { // MD
    $(".tamModals").attr("style", "width:60%;margin-left:auto;margin-right:auto;text-align:left !important;");
  }
  $(window).resize(function () {
    if ($(window).width() < 768) { // XS
      $(".tamModals").attr("style", "width:95%;margin-left:auto;margin-right:auto;text-align:left !important;");
    }
    if ($(window).width() >= 768 && $(window).width() < 992) { // SM
      $(".tamModals").attr("style", "width:85%;margin-left:auto;margin-right:auto;text-align:left !important;");
    }
    if ($(window).width() >= 992 && $(window).width() < 1200) { // MD
      $(".tamModals").attr("style", "width:70%;margin-left:auto;margin-right:auto;text-align:left !important;");
    }
    if ($(window).width() >= 1200) { // MD
      $(".tamModals").attr("style", "width:60%;margin-left:auto;margin-right:auto;text-align:left !important;");
    }
  });
  console.clear();

  $('#seccion').change(function () {
    var url = $("#url").val();
    var seccion = $(this).val();
    if(seccion==""){
      $("#seccionS").html("Seleccione una sección");
    }else{
      $("#seccionS").html("");
    }

    if (seccion == "") {
      var html = '';
      html += '<option value="">Seleccione un periodo</option>';
      $("#periodo").html(html);
    } else {
      $.ajax({
        url: url + '/Buscar',
        type: 'POST',
        data: {
          Buscar: true,
          periodos: true,
          cod_seccion: seccion,
        },
        success: function (respuesta) {
          // // alert(respuesta);
          var resp = JSON.parse(respuesta);
          // console.log(resp);
          if (resp.msj == "Good") {
            var data = resp.data;
            var dataPeriodos = "";

            if (resp.msjPeriodos == "Good") {
              dataPeriodos = resp.dataPeriodos;
            }
            // console.log("DATA: ");
            // console.log(data);
            // console.log("PERIODOS: ");
            // console.log(dataPeriodos);

            var html = '';
            html += '<option value="">Seleccione un periodo</option>';
            for (var i = 0; i < data.length; i++) {
              html += '<option value="' + data[i]['id_periodo'] + '" ';

              if (dataPeriodos.length > 0) {
                for (var j = 0; j < dataPeriodos.length; j++) {
                  if (dataPeriodos[j]['id_periodo'] == data[i]['id_periodo']) {
                    // html += 'disabled="disabled"'
                  }
                }
              }

              html += ' >' + data[i]['year_periodo']+'-'+data[i]['nombre_periodo'] + '</option>';
            }
            $("#periodo").html(html);
          }
          if (resp.msj == "Denegado") {
            Swal.fire({
                type: 'error',
                title: '¡Permiso Denegado!',
                text: 'No tiene permiso para realizar esta operación',
                footer: 'SCHSL',
                timer: 3000,
                showCloseButton: false,
                showConfirmButton: false,
            });
          }
          if (resp.msj == "Vacio") {
            var html = '';
            html += '<option value="">Seleccione un periodo</option>';
            $("#periodo").html(html);
          }
        },
        error: function (respuesta) {
          // // // alert(respuesta);
          var resp = JSON.parse(respuesta);
          // console.log(resp);
        }
      });
    }
  });
  
  $('.seccionModificar').change(function () {
    var url = $("#url").val();
    var seccion = $(this).val();
    var id = $(this).attr("name");
    if(seccion==""){
      $("#seccionS"+id).html("Seleccione una sección");
    }else{
      $("#seccionS"+id).html("");
    }

    if (seccion == "") {
      var html = '';
      html += '<option value="">Seleccione un periodo</option>';
      $("#periodo"+id).html(html);
      html = '';
      html += '<option value="">Saber Complementario</option>';
      $("#saber"+id).html(html);
    } else {
      $.ajax({
        url: url + '/Buscar',
        type: 'POST',
        data: {
          Buscar: true,
          periodos: true,
          cod_seccion: seccion,
        },
        success: function (respuesta) {
          // // alert(respuesta);
          var resp = JSON.parse(respuesta);
          // console.log(resp);
          if (resp.msj == "Good") {
            var data = resp.data;
            var dataPeriodos = "";

            if (resp.msjPeriodos == "Good") {
              dataPeriodos = resp.dataPeriodos;
            }
            // console.log("DATA: ");
            // console.log(data);
            // console.log("PERIODOS: ");
            // console.log(dataPeriodos);

            var html = '';
            html += '<option value="">Seleccione un periodo</option>';
            for (var i = 0; i < data.length; i++) {
              html += '<option value="' + data[i]['id_periodo'] + '" ';

              if (dataPeriodos.length > 0) {
                for (var j = 0; j < dataPeriodos.length; j++) {
                  if (dataPeriodos[j]['id_periodo'] == data[i]['id_periodo']) {
                    // html += 'disabled="disabled"'
                  }
                }
              }

              html += ' >' + data[i]['year_periodo']+'-'+data[i]['nombre_periodo'] + '</option>';
            }
            $("#periodo"+id).html(html);
          }
          if (resp.msj == "Denegado") {
            Swal.fire({
                type: 'error',
                title: '¡Permiso Denegado!',
                text: 'No tiene permiso para realizar esta operación',
                footer: 'SCHSL',
                timer: 3000,
                showCloseButton: false,
                showConfirmButton: false,
            });
          }
          if (resp.msj == "Vacio") {
            var html = '';
            html += '<option value="">Seleccione un periodo</option>';
            $("#periodo"+id).html(html);

            html = '';
            html += '<option value="">Saber Complementario</option>';
            $("#saber"+id).html(html);
          }
        },
        error: function (respuesta) {
          // // // alert(respuesta);
          var resp = JSON.parse(respuesta);
          // console.log(resp);
        }
      });
    }
  });
  

  $('#periodo').change(function () {
    var url = $("#url").val();
    var seccion = $("#seccion").val();
    var periodo = $(this).val();
    if(periodo==""){
      $("#periodoS").html("Seleccione el periodo para la clase");
    }else{
      $("#periodoS").html("");
    }

    if (seccion == "") {
      var html = '';
      html += '<option value="">Saber Complementario</option>';
      $("#saber").html(html);
    } else {
      $.ajax({
        url: url + '/Buscar',
        type: 'POST',
        data: {
          Buscar: true,
          saberes: true,
          cod_seccion: seccion,
          id_periodo: periodo,
        },
        success: function (respuesta) {
          // // alert(respuesta);
          var resp = JSON.parse(respuesta);
          // console.log(resp);
          if (resp.msj == "Good") {
            var data = resp.data;
            var dataSaberes = "";
            if (resp.msjSaberes == "Good") {
              dataSaberes = resp.dataSaberes;
            }
            // console.log("DATA: ");
            // console.log(data);
            // console.log("SABERES: ");
            // console.log(dataSaberes);
            var html = '';
            html += '<option value="">Saber Complementario</option>';
            for (var i = 0; i < data.length; i++) {
              html += '<option value="' + data[i]['id_SC'] + '" ';
              if (dataSaberes.length > 0) {
                for (var j = 0; j < dataSaberes.length; j++) {
                  if (dataSaberes[j]['id_SC'] == data[i]['id_SC']) {
                    html += 'disabled="disabled"'
                  }
                }
              }
              html += ' >' + data[i]['nombreSC'] + '</option>';
            }
            $("#saber").html(html);
          }
          if (resp.msj == "Denegado") {
            Swal.fire({
                type: 'error',
                title: '¡Permiso Denegado!',
                text: 'No tiene permiso para realizar esta operación',
                footer: 'SCHSL',
                timer: 3000,
                showCloseButton: false,
                showConfirmButton: false,
            });
          }
          if (resp.msj == "Vacio") {
            var html = '';
            html += '<option value="">Saber Complementario</option>';
            $("#saber").html(html);
          }
        },
        error: function (respuesta) {
          // // // alert(respuesta);
          var resp = JSON.parse(respuesta);
          // console.log(resp);
        }
      });
    }
  });

  $('.periodoModificar').change(function () {
    var url = $("#url").val();
    var periodo = $(this).val();
    var id = $(this).attr("name");
    var seccion = $("#seccion"+id).val();
    if(periodo==""){
      $("#periodoS"+id).html("Seleccione el periodo para la clase");
    }else{
      $("#periodoS"+id).html("");
    }
    if (seccion == "") {
      var html = '';
      html += '<option value="">Saber Complementario</option>';
      $("#saber"+id).html(html);
    } else {
      $.ajax({
        url: url + '/Buscar',
        type: 'POST',
        data: {
          Buscar: true,
          saberes: true,
          cod_seccion: seccion,
          id_periodo: periodo,
        },
        success: function (respuesta) {
          // // alert(respuesta);
          var resp = JSON.parse(respuesta);
          // console.log(resp);
          if (resp.msj == "Good") {
            var data = resp.data;
            var dataSaberes = "";
            if (resp.msjSaberes == "Good") {
              dataSaberes = resp.dataSaberes;
            }
            // console.log("DATA: ");
            // console.log(data);
            // console.log("SABERES: ");
            // console.log(dataSaberes);
            var html = '';
            html += '<option value="">Saber Complementario</option>';
            for (var i = 0; i < data.length; i++) {
              html += '<option value="' + data[i]['id_SC'] + '" ';
              if (dataSaberes.length > 0) {
                for (var j = 0; j < dataSaberes.length; j++) {
                  if (dataSaberes[j]['id_SC'] == data[i]['id_SC']) {
                    if(dataSaberes[j]['id_clase']==id){
                      html += 'selected="selected"';
                    }else{
                      html += 'disabled="disabled"';
                    }
                  }

                }
              }
              html += ' >' + data[i]['nombreSC'] + '</option>';
            }
            $("#saber"+id).html(html);
          }
          if (resp.msj == "Denegado") {
            Swal.fire({
                type: 'error',
                title: '¡Permiso Denegado!',
                text: 'No tiene permiso para realizar esta operación',
                footer: 'SCHSL',
                timer: 3000,
                showCloseButton: false,
                showConfirmButton: false,
            });
          }
          if (resp.msj == "Vacio") {
            var html = '';
            html += '<option value="">Saber Complementario</option>';
            $("#saber"+id).html(html);
          }
        },
        error: function (respuesta) {
          // // // alert(respuesta);
          var resp = JSON.parse(respuesta);
          // console.log(resp);
        }
      });
    }
  });

  $("#saber").change(function(){
    var saber = $(this).val();
    if(saber==""){
      $("#saberS").html("Seleccione una saber");
    }else{
      $("#saberS").html("");
    }
  });

  $(".saberModificar").change(function(){
    var id = $(this).attr("name");
    var saber = $(this).val();
    if(saber==""){
      $("#saberS"+id).html("Seleccione una saber");
    }else{
      $("#saberS"+id).html("");
    }
  });

  $("#profesor").change(function(){
    var profesor = $(this).val();
    if(profesor==""){
      $("#profesorS").html("Debe seleccionar un profesor para la clase");
    }else{
      $("#profesorS").html("");
    }
  });

  $(".profesorModificar").change(function(){
    var id = $(this).attr("name");
    var profesor = $(this).val();
    if(profesor==""){
      $("#profesorS"+id).html("Debe seleccionar un profesor para la clase");
    }else{
      $("#profesorS"+id).html("");
    }
  });


  $("#guardar").click(function (e) {
    e.preventDefault();
    var url = $("#url").val();
    var response = validar();
    if (response) {
      swal.fire({
        title: "¿Desea guardar los datos?",
        text: "Se guardaran los datos, ¿desea continuar?",
        type: "question",
        showCancelButton: true,
        confirmButtonText: "¡Guardar!",
        cancelButtonText: "No",
        closeOnConfirm: false,
        closeOnCancel: false
      }).then((isConfirm) => {
        if (isConfirm.value) {

          let id = $(this).val();

          let seccion = $("#seccion" + id).val();
          let periodo = $("#periodo"+id).val();
          let saber = $("#saber" + id).val();
          let profesor = $("#profesor").val();


          /*          // // alert( seccion + ' ' + saber + ' ' + profesor);*/
          // // // alert( saber);
          // // // alert( seccion );
          // // // alert( profesor);
          $(".box-cargando").show();
          $.ajax({
            url: url + '/Agregar',
            type: 'POST',
            data: {
              Agregar: true,
              seccion: seccion,
              saber: saber,
              profesor: profesor,
              periodo: periodo,
              /*seccion:seccion,       
              alumno: alumno,*/

            },
            success: function (resp) {
              $(".box-cargando").hide();
              // // alert(resp);
              var datos = JSON.parse(resp);
              if (datos.msj === "Good") {
                Swal.fire({
                  type: 'success',
                  title: '¡Registro Exitoso!',
                  text: 'Se ha creado la clase en el sistema',
                  footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                }).then((isConfirm) => {
                  location.reload();
                });
              }
              if (datos.msj == "Denegado") {
                Swal.fire({
                    type: 'error',
                    title: '¡Permiso Denegado!',
                    text: 'No tiene permiso para realizar esta operación',
                    footer: 'SCHSL',
                    timer: 3000,
                    showCloseButton: false,
                    showConfirmButton: false,
                });
              }
              if (datos.msj === "Invalido") {
                Swal.fire({
                  type: 'warning',
                  title: '¡Datos invalidos!',
                  text: 'Los datos ingresados son invalidos',
                  footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                });
              }
              if (datos.msj === "Repetido") {
                Swal.fire({
                  type: 'warning',
                  title: '¡Registro repetido!',
                  text: 'La clase ya esta creada en el sistema',
                  footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                });
              }
              if (datos.msj === "Error") {
                Swal.fire({
                  type: 'error',
                  title: '¡Error al guardar los cambio!',
                  text: 'Intente de nuevo, si el error persiste por favor contacte con el soporte',
                  footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                });
              }
              if (datos.msj === "Vacio") {
                Swal.fire({
                  type: 'warning',
                  title: '¡Debe rellenar todos los campos!',
                  footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                });
              }
            },
            error: function (respuesta) {
              $(".box-cargando").hide();
              var datos = JSON.parse(respuesta);
              // console.log(datos);

            }

          });
        } else {
          swal.fire({
            type: 'error',
            title: '¡Proceso cancelado!',
          });
        }
      });
    }
  });

  $(".modificarBtn").click(function () {
    swal.fire({
      title: "¿Desea modificar los datos?",
      text: "Se movera al formulario para modificar los datos, ¿desea continuar?",
      type: "question",
      showCancelButton: true,
      confirmButtonText: "¡Si!",
      cancelButtonText: "No",
      closeOnConfirm: false,
      closeOnCancel: false
    }).then((isConfirm) => {
      if (isConfirm.value) {
        /*window.// // alert($(this).val());*/
        let userMofif = $(this).val();
        // // // alert(userMofif);
        $("#modificarButton" + userMofif).click();

      } else {
        swal.fire({
          type: 'error',
          title: '¡Proceso cancelado!',
        });
      }
    });
  });

  $(".modificarButtonModal").click(function (e) {
    e.preventDefault();
    var url = $("#url").val();
    var id = $(this).val();

    var response = validar(true, id);
    if (response) {
      swal.fire({
        title: "¿Desea guardar los datos?",
        text: "Se guardaran los datos, ¿desea continuar?",
        type: "question",
        showCancelButton: true,
        confirmButtonText: "¡Guardar!",
        cancelButtonText: "No",
        closeOnConfirm: false,
        closeOnCancel: false
      }).then((isConfirm) => {
        if (isConfirm.value) {

          /* let id = $(this).val(); */

          let seccion = $("#seccion" + id).val();
          let saber = $("#saber" + id).val();
          let periodo = $("#periodo"+id).val();
          let profesor = $("#profesor" + id).val();

          // // // alert( seccion + ' ' + saber + ' ' + profesor);
          $(".box-cargando").show();
          $.ajax({
            url: url + '/Modificar',
            type: 'POST',
            data: {
              Editar: true,
              id_clase: id,
              seccion: seccion,
              saber: saber,
              profesor: profesor,
              periodo: periodo,
            },
            success: function (resp) {
              $(".box-cargando").hide();
              // // alert(resp);
              var datos = JSON.parse(resp);
              if (datos.msj === "Good") {
                Swal.fire({
                  type: 'success',
                  title: '¡¡Modificacion Exitosa!',
                  text: 'Se ha modificado la en el sistema',
                  footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                }).then((isConfirm) => {
                  location.reload();
                });
              }
              if (datos.msj == "Denegado") {
                Swal.fire({
                    type: 'error',
                    title: '¡Permiso Denegado!',
                    text: 'No tiene permiso para realizar esta operación',
                    footer: 'SCHSL',
                    timer: 3000,
                    showCloseButton: false,
                    showConfirmButton: false,
                });
              }
              if (datos.msj === "Invalido") {
                Swal.fire({
                  type: 'warning',
                  title: '¡Datos invalidos!',
                  text: 'Los datos ingresados son invalidos',
                  footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                });
              }
              if (datos.msj === "Repetido") {
                Swal.fire({
                  type: 'warning',
                  title: '¡Registro repetido!',
                  text: 'La clase ya esta agregada al sistema  ',
                  footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                });
              }
              if (datos.msj === "Error") {
                Swal.fire({
                  type: 'error',
                  title: '¡Error al guardar los cambios!',
                  text: 'Intente de nuevo, si el error persiste por favor contacte con el soporte',
                  footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                });
              }
              if (datos.msj === "Vacio") {
                Swal.fire({
                  type: 'warning',
                  title: '¡Debe rellenar todos los campos!',
                  footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                });
              }
            },
            error: function (respuesta) {
              $(".box-cargando").hide();
              var datos = JSON.parse(respuesta);
              // console.log(datos);

            }

          });
        } else {
          swal.fire({
            type: 'error',
            title: '¡Proceso cancelado!',
          });
        }
      });
    }
  });

  $(".eliminarBtn").click(function () {

    var url = $("#url").val();
    swal.fire({
      title: "¿Desea borrar los datos?",
      text: "Se borraran los datos escogidos, ¿desea continuar?",
      type: "error",
      showCancelButton: true,
      confirmButtonText: "¡Si!",
      cancelButtonText: "No",
      closeOnConfirm: false,
      closeOnCancel: false
    }).then((isConfirm) => {
      if (isConfirm.value) {

        swal.fire({
          title: "¿Esta seguro de borrar los datos?",
          text: "Se borraran los datos, esta opcion no se puede deshacer, ¿desea continuar?",
          type: "error",
          showCancelButton: true,
          confirmButtonText: "¡Si!",
          cancelButtonText: "No",
          closeOnConfirm: false,
          closeOnCancel: false
        }).then((isConfirm) => {
          if (isConfirm.value) {
            /*window.// // alert($(this).val());*/
            let claseDelete = $(this).val();

            /* // // alert(claseDelete);*/
            $(".box-cargando").show();
            $.ajax({
              url: url + '/Eliminar',
              type: 'POST',
              data: {
                Eliminar: true,
                claseDelete: claseDelete,
              },
              success: function (respuesta) {
                $(".box-cargando").hide();
                // // alert(respuesta);
                var datos = JSON.parse(respuesta);
                if (datos.msj === "Good") {
                  Swal.fire({
                    type: 'success',
                    title: 'Eliminación Exitosa',
                    text: 'Se ha eliminado la clase del sistema',
                    footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                  }).then((isConfirm) => {
                    location.reload();
                  });
                }
                if (datos.msj == "Denegado") {
                  Swal.fire({
                      type: 'error',
                      title: '¡Permiso Denegado!',
                      text: 'No tiene permiso para realizar esta operación',
                      footer: 'SCHSL',
                      timer: 3000,
                      showCloseButton: false,
                      showConfirmButton: false,
                  });
                }
                if (datos.msj === "Repetido") {
                  Swal.fire({
                    type: 'warning',
                    title: '¡Registro repetido!',
                    text: 'La clase ya esta agregada al sistema',
                    footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                  });
                }
                if (datos.msj === "Error") {
                  Swal.fire({
                    type: 'error',
                    title: '¡Error al guardar los cambio!',
                    text: 'Intente de nuevo, si el error persiste por favor contacte con el soporte',
                    footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                  });
                }
                if (datos.msj === "Vacio") {
                  Swal.fire({
                    type: 'warning',
                    title: '¡Debe rellenar todos los campos!',
                    footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                  });
                }
              },
              error: function (respuesta) {
                $(".box-cargando").hide();
                var data = JSON.parse(respuesta);
                // console.log(data);

              }

            });
          } else {
            swal.fire({
              type: 'error',
              title: '¡Proceso cancelado!',
            });
          }
        });

      } else {
        swal.fire({
          type: 'error',
          title: '¡Proceso cancelado!',
        });
      }
    });
  });

});

const cerrarmodal = () => {
  $("#modalAgregarClase #seccion").val('').trigger('change');
  $("#modalAgregarClase #saber").val('').trigger('change');
  $("#modalAgregarClase #profesor").val('').trigger('change');
  $("#modalAgregarClase").modal('hide');
  $("#formAgregar").trigger('reset');
  $("#formAgregar #seccionS").html("");
  $("#formAgregar #saberS").html("");
  $("#formAgregar #profesorS").html("");
}  
$('#cerrarM').click(cerrarmodal);
$('#salirM').click(cerrarmodal);


function validar(modificar = false, id = "") {
  var form = "";
  if (!modificar) {
    form = "#modalAgregarClase";
  } else {
    form = "#modalModificarClase" + id;
  }

  var seccion = $(form + " #seccion" + id).val();
  var rseccion = false;
  if (seccion == "") {
    $(form + " #seccionS" + id).html("Seleccione una sección");
  } else {
    rseccion = true;
    $(form + " #seccionS" + id).html("");
  }

  var periodo = $(form+" #periodo"+id).val();
  var rperiodo = false;
  if(periodo == ""){
    $(form+" #periodoS"+id).html("Seleccione el periodo para la clase");
  }else{
    rperiodo = true;
    $(form+" #periodoS"+id).html("");
  }

  var saber = $(form + " #saber" + id).val();
  var rsaber = false;
  if (saber == "") {
    $(form + " #saberS" + id).html("Seleccione un saber ");
  } else {
    rsaber = true;
    $(form + " #saberS" + id).html("");
  }

  var profesor = $(form + " #profesor" + id).val();
  var rprofesor = false;
  if (profesor == "") {
    $(form + " #profesorS" + id).html("Debe seleccionar un profesor para la clase");
  } else {
    rprofesor = true;
    $(form + " #profesorS" + id).html("");
  }



  var validado = false;
  if (rseccion == true && rsaber == true && rprofesor == true) {
    validado = true;
  } else {
    validado = false;
  }
  // // // alert(validado);
  return validado;
}