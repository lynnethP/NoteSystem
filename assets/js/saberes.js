$(document).ready(function(){ 
  if($(window).width() < 768){ // XS
    $(".tamModals").attr("style","width:95%;margin-left:auto;margin-right:auto;text-align:left !important;");
  }
  if($(window).width() >= 768 && $(window).width() < 992){ // SM
    $(".tamModals").attr("style","width:85%;margin-left:auto;margin-right:auto;text-align:left !important;");
  }
  if($(window).width() >= 992 && $(window).width() < 1200){ // MD
    $(".tamModals").attr("style","width:70%;margin-left:auto;margin-right:auto;text-align:left !important;");
  }
  if($(window).width() >= 1200){ // MD
    $(".tamModals").attr("style","width:60%;margin-left:auto;margin-right:auto;text-align:left !important;");
  }
  $(window).resize(function(){
    if($(window).width() < 768){ // XS
      $(".tamModals").attr("style","width:95%;margin-left:auto;margin-right:auto;text-align:left !important;");
    }
    if($(window).width() >= 768 && $(window).width() < 992){ // SM
      $(".tamModals").attr("style","width:85%;margin-left:auto;margin-right:auto;text-align:left !important;");
    }
    if($(window).width() >= 992 && $(window).width() < 1200){ // MD
      $(".tamModals").attr("style","width:70%;margin-left:auto;margin-right:auto;text-align:left !important;");
    }
    if($(window).width() >= 1200){ // MD
      $(".tamModals").attr("style","width:60%;margin-left:auto;margin-right:auto;text-align:left !important;");
    }
  });
  console.clear();

  $("#nombreSC").keyup(function(){
    var valor = $(this).val();
    if(valor.length > 2 ){
      $("#nombreS").html("");
    }else{
      $("#nombreS").html("Debe ingresar el nombre del saber");
    }
  });

  $(".nombreSCModificar").keyup(function(){
    var id = $(this).attr("name");
    var valor = $(this).val();
    if(valor.length > 2 ){
      $("#nombreS"+id).html("");
    }else{
      $("#nombreS"+id).html("Debe ingresar el nombre del saber");
    }
  });

  $("#trayectoSC").change(function(){
    var valor = $(this).val();
    if(valor==""){
      $("#trayectoS").html("Seleccione un trayecto");
    }else{
      $("#trayectoS").html("");
    }
  });


  $(".trayectoSCModificar").change(function(){
    var id = $(this).attr("name");
    var valor = $(this).val();
    if(valor==""){
      $("#trayectoS"+id).html("Seleccione un trayecto");
    }else{
      $("#trayectoS"+id).html("");
    }
  });

  $("#faseSC").change(function(){
    var valor = $(this).val();
    if(valor==""){
      $("#faseS").html("Seleccione un fase");
    }else{
      $("#faseS").html("");
    }
  });


  $(".faseSCModificar").change(function(){
    var id = $(this).attr("name");
    var valor = $(this).val();
    if(valor==""){
      $("#faseS"+id).html("Seleccione un fase");
    }else{
      $("#faseS"+id).html("");
    }
  });

  

  $("#guardar").click(function(e){
    e.preventDefault();
    var url = $("#url").val();
    var response = validar();
    if(response){
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
          
      if (isConfirm.value){ 
        let nombreSC = $("#nombreSC").val();     
        let trayectoSC = $("#trayectoSC").val();     
        let faseSC = $("#faseSC").val();   
            
            // // // alert(nombreSC + ' ' + trayectoSC+ ' '+ faseSC);
              $(".box-cargando").show();
              $.ajax({
                url: url+'/Agregar',    
                type: 'POST',   
                data:{

                       Agregar: true,   
                       nombreSC: nombreSC,
                       trayectoSC: trayectoSC,       
                       faseSC: faseSC,       
                      },

                success: function(resp){
                  $(".box-cargando").hide();
                  //  // // alert(resp);
                /*window.// // alert("Hola mundo");   
                // console.log(resp); 
                  window.// // alert(resp);*/
                  var datos = JSON.parse(resp);     
                    if (datos.msj === "Good") {   
                      Swal.fire({
                        type: 'success',
                        title: '¡Registro Exitoso!',
                        text: 'Se ha agregado el saber ' + nombreSC + ' al sistema',
                        footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                      }).then((isConfirm) => {
                          location.reload();
                      } );
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
                        text: 'El saber ' + nombrSC + ' ya esta agregado al sistema',
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
                error: function(respuesta){
                  $(".box-cargando").hide();
                  var datos = JSON.parse(respuesta);
                  // console.log(datos);

                }

              });
          }else { 
                swal.fire({
                    type: 'error',
                    title: '¡Proceso cancelado!',
                });
          } 
      });
    }
  });
   
  $(".modificarButtonModal").click(function(e){
    e.preventDefault();
    var url = $("#url").val();
    var id = $(this).val();

    var response = validar(true, id);
    if(response){
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
          if (isConfirm.value){ 

            let nombreSC = $("#nombreSC" + id).val();
            let trayecto = $("#trayectoSC" + id).val();
            let fase = $("#faseSC" + id).val();
             // // // alert(id + ' '+ nombreSC + ' ' + trayecto + ' ' + fase);
            $(".box-cargando").show();
            $.ajax({
              url: url+'/Modificar',    
              type: 'POST',   
              data: {
                Editar: true,    

                codigo: id,
                nombreSC: nombreSC,   
                trayectoSC: trayecto,
                faseSC: fase,       
              
              },
              success: function(resp){
                $(".box-cargando").hide();
                 // // // alert(resp);
              /*window.// // alert("Hola mundo");   
              // console.log(resp); 
                window.// // alert(resp);*/
                var datos = JSON.parse(resp);   
                  if (datos.msj === "Good") {   
                    Swal.fire({
                      type: 'success',
                      title: '¡¡Modificacion Exitosa!', 
                      text: 'Se ha modificado al saber ' + nombreSC + ' en el sistema', 
                      footer: 'SCHSL', timer: 3000, showCloseButton: false, showConfirmButton: false,
                    }).then((isConfirm) => {
                        location.reload();
                    } );
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
                      text: 'El saber ' + nombreSC + ' ya esta agregado al sistema',
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
              error: function(respuesta){
                $(".box-cargando").hide();
                var datos = JSON.parse(respuesta);
                // console.log(datos);

              }

            });
          }else { 
              swal.fire({
                  type: 'error',
                  title: '¡Proceso cancelado!',
                   });
          } 
      });
    }
  });

  $(".modificarBtn").click(function(){
    var url = $("#url").val();
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
          if (isConfirm.value){            
            /*window.// // alert($(this).val());*/
            let userMofif = $(this).val();
            //// // alert(userMofif);
            $(".box-cargando").show();
            $.ajax({
              url: url+'/Buscar',    
              type: 'POST',  
              data: {
                Buscar: true,   
                userNofif: userMofif,       
              },
              success: function(respuesta){
                $(".box-cargando").hide();   
                // // // alert(respuesta); 
                var resp = JSON.parse(respuesta);   
                // // // alert(resp.msj);
                if (resp.msj == "Good") {  
                  $("#modificarButton"+userMofif).click(); 

                  /*
                  // // alert('Bienvenido');                    
                  // console.log('Aquí estoy yo'); 
                  // // console.log($(".cedula").val(Json['resp']));
                  Swal.fire({
                    type: 'success',
                    title: '¡Modificación Exitosa!',
                    text: 'Has modificado al usuario ' + user + ' al sistema',
                    footer: 'SCHSL',
                    timer: 3000,
                    showCloseButton: false,
                    showConfirmButton: false,
                    
                  });
                  */

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
              },
              error: function(respuesta){
                $(".box-cargando").hide();
                // // // alert(respuesta);
                var resp = JSON.parse(respuesta);
                // console.log(resp);

              }

            });

          }else { 
              swal.fire({
                  type: 'error',
                  title: '¡Proceso cancelado!',
              });
          } 
      });
  });

  $(".eliminarBtn").click(function(){
    var url = $("#url").val();
      swal.fire({ 
          title: "¿Desea borrar los datos?",
          text: "Se borraran los datos escogidos, ¿desea continuar?",
          type: "error",
          showCancelButton: true,
          confirmButtonText: "¡Si!",
          cancelButtonText: "No", 
          closeOnConfirm: false,
          closeOnCancel: false,
      }).then((isConfirm) => {
          if (isConfirm.value){            
      
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
                    
                    if (isConfirm.value){                      
                     
                      let userDelete = $(this).val();
                      $(".box-cargando").show();
                      $.ajax({
                        url: url+'/Eliminar',    
                        type: 'POST',   
                        data: {
                        Eliminar: true,   
                        userDelete: userDelete,
                        },
                        success: function(respuesta){
                          $(".box-cargando").hide();
                           // // // alert(respuesta);
                          var datos = JSON.parse(respuesta);
                          if (datos.msj === "Good"){   
                              
                              Swal.fire({
                              type: 'success',
                              title: 'Eliminación Exitosa',
                              text: 'Se ha eliminado el saber complementario ' + datos.data.nombreSC,
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
                              text: 'El profesor ' + datos.data.nombreSC + ' ya esta agregado al sistema',
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
                        error: function(respuesta){
                          $(".box-cargando").hide();
                          var data = JSON.parse(respuesta);
                          // console.log(data);

                        }

                      });
                    }else { 
                        swal.fire({
                            type: 'error',
                            title: '¡Proceso cancelado!',
                        //    confirmButtonColor: "#ED2A77",
                        });
                    } 
                });

          }else { 
              swal.fire({
                  type: 'error',
                  title: '¡Proceso cancelado!',
                  //confirmButtonColor: "#ED2A77",
              });
          } 
      });
  });

});

const cerrarmodal = () => {
  $("#modalAgregarSC #trayectoSC").val('').trigger('change');
  $("#modalAgregarSC #faseSC").val('').trigger('change');
  $("#modalAgregarSC").modal('hide');
  $("#formAgregar").trigger('reset');
  $("#formAgregar #nombreS").html("");
  $("#formAgregar #trayectoS").html("");
  $("#formAgregar #faseS").html("");
}  
$('#cerrarM').click(cerrarmodal);
$('#salirM').click(cerrarmodal);

function validar(modificar = false, id=""){
  var form = "";
  if(!modificar){
    form = "#modalAgregarSC";
  }else{
    form = "#modalmodificarButtonsc"+id;
  }

  var nombre = $(form+" #nombreSC"+id).val();
  var rnombre = false;
  if(nombre.length > 2){ 
    rnombre = true;
    $(form+" #nombreS"+id).html("");
  }else{
    $(form+" #nombreS"+id).html("Debe ingresar el nombre del saber");
  }

  

  var trayecto = $(form+" #trayectoSC"+id).val();
  // console.log(trayecto);
  var rtrayecto = false;
  if(trayecto == ""){
    $(form+" #trayectoS"+id).html("Seleccione un trayecto");
  }else{
    rtrayecto = true;
    $(form+" #trayectoS"+id).html("");
  }

  var fase = $(form+" #faseSC"+id).val();
  var rfase = false;
  if(fase == ""){
    $(form+" #faseS"+id).html("Seleccione una fase");
  }else{
    rfase = true;
    $(form+" #faseS"+id).html("");
  }



  var validado = false;
  if(rnombre==true && rtrayecto==true && rfase==true){
    validado=true;
  }else{
    validado=false;
  }
  /*  // // alert(validado);*/
  return validado;
}