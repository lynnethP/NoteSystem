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
  $("#year").change(function(){
    var url = $("#url").val();
    var val = $(this).val();
    $("#nombrePr").val(val);
    var valmax = parseInt(val)+1;
    if(val==""){
      $("#fechaA").removeAttr("min");
      $("#fechaA").removeAttr("max");
      $("#fechaC").removeAttr("min");
      $("#fechaC").removeAttr("max");
      $("#yearP").html("Debe ingresar el año del periodo");
    }else{
      $("#fechaA").attr("min",val+"-01-01");
      $("#fechaA").attr("max",val+"-12-31");
      $("#fechaC").attr("min",val+"-01-01");
      $("#fechaC").attr("max",valmax+"-12-31");
      $("#yearP").html("");
    }
    $("#fechaA").removeAttr("disabled");
    $("#fechaC").removeAttr("disabled");
    $(".numeroPr0").attr("selected", "selected");
    $(".numeroPrI").removeAttr("disabled");
    $(".numeroPrII").removeAttr("disabled");
    $(".box-cargando").show();
    $.ajax({
      url: url+'/Buscar',
      type: 'POST',  
      data: {
        Buscar: true,
        periodos: true,
        year: val,
      },
      success: function(respuesta){
        $(".box-cargando").hide();
        // // alert(respuesta);
        var resp = JSON.parse(respuesta);   
        // // // alert(resp.msj);
        if (resp.msj == "Good") {  
          var data = resp.data;
          console.log("DATA: ");
          console.log(data);
          if(data.length>0){
            if(data.length==2){
              $("#fechaA").attr("disabled", "disabled");
              $("#fechaC").attr("disabled", "disabled");
            }
            for (var i = 0; i < data.length; i++) {
              $(".numeroPr"+data[i]['nombre_periodo']).attr("disabled", "disabled");
              $(".numeroPr"+data[i]['nombre_periodo']).attr("style", "color:#CCC;");
              if(data.length==1){
                if(data[i]['nombre_periodo']=="I"){
                  $("#fechaA").attr("min", data[i]['fecha_cierre']);
                  $("#fechaC").attr("min", data[i]['fecha_cierre']);
                }
                if(data[i]['nombre_periodo']=="II"){
                  $("#fechaA").attr("max", data[i]['fecha_apertura']);
                  $("#fechaC").attr("max", data[i]['fecha_apertura']);
                }
              }
            }
          }else{
            $("#fechaA").removeAttr("disabled");
            $("#fechaC").removeAttr("disabled");

            $(".numeroPrI").removeAttr("disabled");
            $(".numeroPrI").removeAttr("style");
            $(".numeroPrII").removeAttr("disabled");
            $(".numeroPrII").removeAttr("style");
          }
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
    $("#fechaA").val("");
    $("#fechaC").val("");
  });
  $("#cerrarM").click(function(){
    $(".btnReset").click();
    $("#fechaA").removeAttr("disabled");
    $("#fechaC").removeAttr("disabled");
    $(".numeroPr0").attr("selected", "selected");
    $(".numeroPrI").removeAttr("disabled");
    $(".numeroPrII").removeAttr("disabled");
  });

  $(".cerrarVarios").click(function(){
    var id = $(this).attr("name");
    document.getElementById("btnReset"+id).click();
    // $("#btnReset"+id).click();
    $("#fechaA"+id).removeAttr("disabled");
    $("#fechaC"+id).removeAttr("disabled");
    // $(".numeroPr0"+id).attr("selected", "selected");
    $(".numeroPrI"+id).removeAttr("disabled");
    $(".numeroPrII"+id).removeAttr("disabled");
  });

  $(".yearModificar").change(function(){
    var url = $("#url").val();
    var id = $(this).attr("name");
    var val = $(this).val();
    var json = $(".json_periodo"+id).html();
    var dataJson = JSON.parse(json);

    // var apMin = $("#fechaA"+id).attr("min");
    // var apMax = $("#fechaA"+id).attr("max");
    // if(apMin!=undefined){
    //   // alert("apertura: MIN: "+apMin);
    // }
    // if(apMax!=undefined){
    //   // alert("apertura: MAX: "+apMax);
    // }

    // var ciMin = $("#fechaC"+id).attr("min");
    // var ciMax = $("#fechaC"+id).attr("max");
    // if(ciMin!=undefined){
    //   // alert("cierre: MIN: "+ciMin);
    // }
    // if(ciMax!=undefined){
    //   // alert("cierre: MAX: "+ciMax);
    // }
    // // // alert(val);
    // // // alert(id);
    $("#nombrePr"+id).val(val);
    if(val==""){
      // $("#fechaA"+id).removeAttr("min");
      // $("#fechaA"+id).removeAttr("max");
      // $("#fechaC"+id).removeAttr("min");
      // $("#fechaC"+id).removeAttr("max");
      $("#yearP"+id).html("Debe ingresar el año del periodo");
    }else{
      // $("#fechaA"+id).attr("min",val+"-01-01");
      // $("#fechaA"+id).attr("max",val+"-12-31");
      // $("#fechaC"+id).attr("min",val+"-01-01");
      // $("#fechaC"+id).attr("max",val+"-12-31");
      $("#yearP"+id).html("");
    }
    // $("#fechaA"+id).removeAttr("disabled");
    // $("#fechaC"+id).removeAttr("disabled");
    $(".numeroPr0"+id).attr("selected", "selected");
    $(".numeroPr0"+id).removeAttr("selected");
    $(".numeroPrI"+id).removeAttr("disabled");
    $(".numeroPrII"+id).removeAttr("disabled");
    $(".box-cargando"+id).show();
    $.ajax({
      url: url+'/Buscar',    
      type: 'POST',  
      data: {
        Buscar: true,
        periodos: true,
        year: val,
      },
      success: function(respuesta){
        $(".box-cargando").hide();
        // // alert(respuesta);
        var resp = JSON.parse(respuesta);   
        if (resp.msj == "Good") {
          var data = resp.data;
          // // alert(data.length);
          if(data.length>0){
            $(".numeroPrI"+id).removeAttr("disabled");
            $(".numeroPrI"+id).removeAttr("style");
            $(".numeroPrII"+id).removeAttr("disabled");
            $(".numeroPrII"+id).removeAttr("style");
            for (var i = 0; i < data.length; i++) {
              $(".numeroPr"+data[i]['nombre_periodo']+id).attr("disabled", "disabled");
              $(".numeroPr"+data[i]['nombre_periodo']+id).attr("style", "color:#CCC;");
              if(data[i]['id_periodo']==dataJson['id_periodo']){
                if(data[i]['nombre_periodo'].toUpperCase()==dataJson['nombre_periodo'].toUpperCase()){
                  $(".numeroPr"+data[i]['nombre_periodo']+id).removeAttr("selected");
                  $(".numeroPr"+data[i]['nombre_periodo']+id).removeAttr("disabled");
                  $(".numeroPr"+data[i]['nombre_periodo']+id).removeAttr("style");
                  
                  $(".numeroPr"+data[i]['nombre_periodo']+id).attr("selected", "selected");
                  $("#fechaA"+id).val(dataJson['fecha_apertura']);
                  $("#fechaC"+id).val(dataJson['fecha_cierre']);
                }
              }
            }
          }else{
            $("#fechaA"+id).removeAttr("disabled");
            $("#fechaC"+id).removeAttr("disabled");

            $(".numeroPrI"+id).removeAttr("disabled");
            $(".numeroPrI"+id).removeAttr("style");
            $(".numeroPrII"+id).removeAttr("disabled");
            $(".numeroPrII"+id).removeAttr("style");
          }
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
    $("#fechaA"+id).val("");
    $("#fechaC"+id).val("");
  });

  // $('#year').on('input', function () {      
    // this.value = this.value.replace(/[^0-9+ ]/g,''); });

  // $('yearModificar').on('input', function () {      
    // this.value = this.value.replace(/[^0-9+ ]/g,''); });

  $("#fechaA").change(function(){
    var fechaA = $(this).val();
    var fechaC = $("#fechaC").val();
    // var year = $("#year").val();
    if((fechaA!="") && (fechaC!="")){
      if(fechaA > fechaC){ $(this).val(fechaC); }
    }
    if(fechaA == ""){
      $("#fechaAP").html("Seleccione un fecha de apertura");
      $("#fechaC").removeAttr("min");
    }else{
      $("#fechaAP").html("");
      $("#fechaC").attr("min",fechaA);
    }
  });

  $(".fechaAModificar").change(function(){
    var id = $(this).attr("name");
    var fechaA = $(this).val();
    var fechaC = $("#fechaC"+id).val();
    if((fechaA!="") && (fechaC!="")){
      if(fechaA > fechaC){ $(this).val(fechaC); }
    }
    if(fechaA == ""){
      $("#fechaAP"+id).html("Seleccione un fecha de apertura");
      $("#fechaC"+id).removeAttr("min");
    }else{
      $("#fechaAP"+id).html("");
      $("#fechaC"+id).attr("min",fechaA);
    }
  });

  $("#fechaC").change(function(){
    var fechaC = $(this).val();
    var fechaA = $("#fechaA").val();
    // var year = $("year").val();
    if((fechaA!="") && (fechaC!="")){
      if(fechaC < fechaA){ $(this).val(fechaA); }
    }
    if(fechaC == ""){
      $("#fechaCP").html("Seleccione un fecha de cierre");
      $("#fechaA").removeAttr("max");
    }else{
      $("#fechaCP").html("");
      $("#fechaA").attr("max",fechaC);
    }
  });

  $(".fechaCModificar").change(function(){
    var id = $(this).attr("name");
    var fechaC = $(this).val();
    var fechaA = $("#fechaA"+id).val();
    if((fechaA!="") && (fechaC!="")){
      if(fechaC < fechaA){ $(this).val(fechaA); }
    }
    if(fechaC == ""){
      $("#fechaCP"+id).html("Seleccione un fecha de cierre");
      $("#fechaA"+id).removeAttr("max");
    }else{
      $("#fechaCP"+id).html("");
      $("#fechaA"+id).attr("max",fechaC);
    }
  });

  $("#numeroPr").change(function(){
    var numero = $(this).val();
    if(numero==""){
      $("#nombreP").html("Debe ingresar el número de periodo");
    }else{
      $("#nombreP").html("");
    }
    
  });

  $(".numeroPrModificar").change(function(){
    var id = $(this).attr("name");
    var numero = $(this).val();
      if(numero==""){
      $("#nombreP"+id).html("Debe ingresar el número de periodo");
    }else{
      $("#nombreP"+id).html("");
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

            let numeroPr = $("#numeroPr").val();
            let yearPeriodo = $("#year").val();
            let fechaAP = $("#fechaA").val();
            let fechaAC = $("#fechaC").val();


         // // // alert(numeroPr + ' ' + yearPeriodo + ' ' + fechaAP + ' ' + fechaAC);
              $(".box-cargando").show();
              $.ajax({
                url: url+'/Agregar',    
                type: 'POST',   
                data: {

                  Agregar: true,   
                  numeroPr: numeroPr,       
                  yearPeriodo: yearPeriodo,       
                  fechaAP: fechaAP,
                  fechaAC: fechaAC,
            
                },

                success: function(resp){
                  $(".box-cargando").hide();
                  // // // alert(resp);
                  // window.// // alert("Hola mundo");
                  // // console.log(resp); 
                  // window.// // alert(resp);
                  var datos = JSON.parse(resp);     
                  if (datos.msj === "Good") {   
                    Swal.fire({
                      type: 'success',
                      title: '¡Registro Exitoso!',
                      text: 'Se ha agregado el periodo ' + yearPeriodo + '-' + numeroPr,
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
                      text: 'El periodo ' + yearPeriodo + '-' + numeroPr + ' ya esta agregado al sistema',
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
                userNofifId: userMofif,       
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


  $(".modificarButtonModal").click(function(e){
    e.preventDefault();
    var url = $("#url").val();
    var id = $(this).val();
    // // // alert(id);
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

              // let nombrePr = $("#nombrePr" + id).val();
              let numeroPr = $("#numeroPr" + id).val();
              let yearPeriodo = $("#year" + id).val();
              let fechaAP = $("#fechaA" + id).val();
              let fechaAC = $("#fechaC" + id).val();
                // // // alert(id + ' '+ nombrePr + ' ' + yearPeriodo + ' ' + fechaAP + ' ' + fechaAC);
              $(".box-cargando").show();
              $.ajax({
                url: url+'/Modificar',    
                type: 'POST',   
                data: {
                  
                    Editar: true, 
                    id_periodo: id,   
                    numeroPr: numeroPr,       
                    yearPeriodo: yearPeriodo,       
                    fechaAP: fechaAP,
                    fechaAC: fechaAC,      
                
                },
                success: function(resp){
                  $(".box-cargando").hide();
                    // // // alert(resp);
                  var datos = JSON.parse(resp);   
                  if (datos.msj === "Good") {   
                      Swal.fire({
                        type: 'success',
                        title: '¡Modificacion Exitosa!', 
                        text: 'Se ha modificado al periodo ' + yearPeriodo + '-'+ numeroPr + ' en el sistema', 
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
                        text: 'El periodo ' + yearPeriodo + '-'+ numeroPr + ' ya esta agregado al sistema',
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
                          // //// alert(respuesta);
                          var datos = JSON.parse(respuesta);
                          if (datos.msj === "Good"){   
                              
                              Swal.fire({
                              type: 'success',
                              title: 'Eliminación Exitosa',
                              text: 'Se ha eliminado el periodo',
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
                          if (datos.msj === "Error") {   
                            Swal.fire({
                              type: 'error',
                              title: '¡Error al guardar los cambio!',
                              text: 'Intente de nuevo, si el error persiste por favor contacte con el soporte',
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
                        
                        });
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
}); 

const cerrarmodal = () => {
  $("#modalAgregarPeriodo").modal('hide')
  $("#formAgregar").trigger('reset');
  $("#formAgregar #yearP").html("");
  $("#formAgregar #nombreP").html("");
  $("#formAgregar #fechaAP").html("");
  $("#formAgregar #fechaCP").html("");
  $("#formAgregar #fechaV").html("");

}  
$('#cerrarM').click(cerrarmodal);
$('#salirM').click(cerrarmodal);

function validar(modificar = false, id=""){
    var form = "";
    if(!modificar){
      form = "#modalAgregarPeriodo";
    }else{
      form = "#modalModificarPeriodo"+id;
    }
    var year = $(form+" #year"+id).val();
    var ryear = false;
    if(year.length == 4){
      ryear = true;
      $(form+" #yearP"+id).html("");
    }else{
      $(form+" #yearP"+id).html("Debe ingresar el año del periodo");
    }


    var nombre = $(form+" #numeroPr"+id).val();
    var rnombre = false;
    if(nombre == ""){ 
      $(form+" #nombreP"+id).html("Debe ingresar el número de periodo");
    }else{
      rnombre = true;
      $(form+" #nombreP"+id).html("");
    }

    var fechaA = $(form+" #fechaA"+id).val();
    // // // alert(fechaA);
    var rfechaA = false;
    if(fechaA == ""){
      $(form+" #fechaAP"+id).html("Seleccione un fecha de apertura");
    }else{
      rfechaA = true;
      $(form+" #fechaAP"+id).html("");
    }

    var fechaC = $(form+" #fechaC"+id).val();
    // // // alert(fechaC);
    var rfechaC = false;
    if(fechaC == ""){
      $(form+" #fechaCP"+id).html("Seleccione un fecha de cierre");
    }else{
      rfechaC = true;
      $(form+" #fechaCP"+id).html("");
    }


    // // // alert(fechaA);
    // // // alert(fechaC);
    var rfechaV = false;
    if(fechaC < fechaA){
      $(form+" #fechaV"+id).html("La fecha final debe ser mayor a la fecha inicial");
    }else{
      rfechaV = true;
      $(form+" #fechaV"+id).html("");
    }

    var validado = false;
    if(rnombre==true  && ryear==true && rfechaA==true && rfechaC==true && rfechaV==true){
      validado=true;
    }else{
      validado=false;
    }
    return validado;
}