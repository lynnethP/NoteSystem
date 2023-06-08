var chart = null;

$(document).ready(function () {
  if ($(window).width() < 768) { // XS
    $(".tamModals").attr("style", "width:95%;margin-left:auto;margin-right:auto;text-align:left !important;");
  }
  if ($(window).width() >= 768 && $(window).width() < 992) { // SM
    $(".tamModals").attr("style", "width:85%;margin-left:auto;margin-right:auto;text-align:left !important;");
  }
  if ($(window).width() >= 992 && $(window).width() < 1200) { // MD
    $(".tamModals").attr("style", "width:85%;margin-left:auto;margin-right:auto;text-align:left !important;");
  }
  if ($(window).width() >= 1200) { // MD
    $(".tamModals").attr("style", "width:85%;margin-left:auto;margin-right:auto;text-align:left !important;");
  }
  $(window).resize(function () {
    if ($(window).width() < 768) { // XS
      $(".tamModals").attr("style", "width:95%;margin-left:auto;margin-right:auto;text-align:left !important;");
    }
    if ($(window).width() >= 768 && $(window).width() < 992) { // SM
      $(".tamModals").attr("style", "width:90%;margin-left:auto;margin-right:auto;text-align:left !important;");
    }
    if ($(window).width() >= 992 && $(window).width() < 1200) { // MD
      $(".tamModals").attr("style", "width:80%;margin-left:auto;margin-right:auto;text-align:left !important;");
    }
    if ($(window).width() >= 1200) { // MD
      $(".tamModals").attr("style", "width:80%;margin-left:auto;margin-right:auto;text-align:left !important;");
    }
  });
  console.clear();


  $('#seccion').change(function () {
    var url = $("#url").val();
    var seccion = $(this).val();
    if (seccion == "") {
      $("#error_seccion").html("Debe seleccionar una sección");
    } else {
      $("#error_seccion").html("");
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
        },
        success: function (respuesta) {
          // // // alert(respuesta);
          //console.log("Pablo & Silas");
          //console.log(respuesta);
          var resp = JSON.parse(respuesta);
          if (resp.msj == "Good") {
            var data = resp.data;
            var dataSaberes = "";
            if (resp.msjSaberes == "Good") {
              dataSaberes = resp.dataSaberes;
            }
            var html = '';
            html += '<option value="">Saber Complementario</option>';
            for (var i = 0; i < data.length; i++) {

              if(dataSaberes.length>0){
                for (var j = 0; j < dataSaberes.length; j++) {
                  if(dataSaberes[j]['id_SC']==data[i]['id_SC']){
                    html += '<option value="' + data[i]['id_SC'] + '" ';
                    // html += 'disabled="disabled"';
                    html += ' >' + data[i]['nombreSC'] + '</option>';
                  }
                }
              }


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
          //console.log(resp);
        }
      });
    }
  });

  $(".buttons").attr("disabled","disabled");
  $(".buttons").addClass("disabledd");
  $("#saber").change(function () {
    var saber = $(this).val();
    if (saber == "") {
      $("#error_saber").html("Debe seleccionar un saber");
      $(".buttons").attr("disabled","disabled");
      $(".buttons").addClass("disabledd");
    } else {
      $("#error_saber").html("");
      $(".buttons").removeAttr("disabled");
      $(".buttons").removeClass("disabledd");
    }
  });
  $(".buttonsApx").attr("disabled","disabled");
  $(".buttonsApx").addClass("disabledd");
  $(".seccionApx").change(function () {
    var seccion = $(this).val();
    if (seccion == "") {
      $("#error_seccionApx").html("Debe seleccionar una seccion");
      $(".buttonsApx").attr("disabled","disabled");
      $(".buttonsApx").addClass("disabledd");
    } else {
      $("#error_seccionApx").html("");
      $(".buttonsApx").removeAttr("disabled");
      $(".buttonsApx").removeClass("disabledd");
    }
  });


  $("#estadistico").click(function (e) {
    let seccion = $("#seccion").val();
    let saber = $("#saber").val();
    var url = $("#url").val();
    $(".box-cargando").show();
    $.ajax({
      url: url + '/Estadistico',
      type: 'POST',
      data: {
        Reportes: true,
        seccion: seccion,
        saber: saber,
      },
      success: function (resp) {
        $(".box-cargando").hide();
        // console.log(resp);

        if (resp == '[]') {
          Swal.fire({
            position: 'center',
            type: 'warning',
            title: 'No se puede generar la gráfica',
            text: 'No hay calificaciones asignadas en este saber complementario',
            footer: 'SCHSL', timer: 4000, showCloseButton: false, showConfirmButton: false,
          });
        } else {
          $(".pdf").slideUp(500);
          $(".estadistico").slideUp(500);
          $(".porcentaje").slideUp(500);
          $(".boxlist_alumnosnotas").slideDown(500);
          var datos = JSON.parse(resp);
          var nombre_saber = datos[0]['nombreSC'];
          var nombre_seccion = datos[0]['nombre_seccion'];

          const generateRandomColor = () => {
            const r = Math.floor(Math.random() * 256);
            const g = Math.floor(Math.random() * 256);
            const b = Math.floor(Math.random() * 256);
            const rgbColor = 'rgb(' + r + ', ' + g + ', ' + b + ')';
            return rgbColor;
          };
          arrData = [];
          arrColor = [];
          arrNotas = [];
          datos.forEach(function (valor, indice, datos) {
            let nombres = valor.nombre_alumno + ' ' + valor.apellido_alumno;
            let notas = valor.nota;
            const newColor = generateRandomColor();
            arrData.push(nombres);
            arrNotas.push(notas);
            arrColor.push(newColor);
          });
          // console.log(arrData)
          // console.log(arrColor)
          // console.log(arrNotas)

          $('#chartBox').css({ 'width': '0px', 'height': '0px' });
          $('#myChart').css({ 'width': '0px', 'height': '0px' });
          $('#chartBoxSuccess').css({ 'width': '0px', 'height': '0px' });
          $('#chartNotas').css({ 'width': '250px', 'height': '100px' });
          var cp = document.getElementById('chartNotas');
          chart = new Chart(cp, {
            type: 'bar',
            data: {
              labels: arrData,
              datasets: [{
                label: 'Calificaciones del Saber Complementario: ' + nombre_saber,
                data: arrNotas,
                backgroundColor: arrColor,
                borderColor: arrColor,
                borderWidth: 0
              }]
            },
            options: {
              scales: {
                yAxes: [{
                  ticks: {
                    fontColor: "black",
                    fontSize: 12,
                    // stepSize: 1,
                    beginAtZero: true
                  }
                }],
                xAxes: [{
                  ticks: {
                    fontColor: "black",
                    fontSize: 12,
                    stepSize: 1,
                    beginAtZero: true
                  }
                }]
              },
              legend: {
                labels: {
                  // This more specific font property overrides the global property
                  fontColor: 'black',
                  fontFamily: 'Arial',
                  fontSize: 12
                }
              },

            }

          });

          $('#downloadPdf').click(function (event) {
            console.log("Rodeado")
            // get size of report page
            var reportPageHeight = $('#reportPage').innerHeight();
            var reportPageWidth = $('#reportPage').innerWidth();

            // create a new canvas object that we will populate with all other canvas objects
            var pdfCanvas = $('<canvas />').attr({
              id: "canvaspdf",
              width: reportPageWidth,
              height: reportPageHeight
            });

            // keep track canvas position
            var pdfctx = $(pdfCanvas)[0].getContext('2d');
            var pdfctxX = 0;
            var pdfctxY = 0;
            var buffer = 100;

            // for each chart.js chart
            $("canvas").each(function (index) {
              // get the chart height/width
              var canvasHeight = $(this).innerHeight();
              var canvasWidth = $(this).innerWidth();

              // draw the chart into the new canvas
              pdfctx.drawImage($(this)[0], pdfctxX, pdfctxY, canvasWidth, canvasHeight);
              pdfctxX += canvasWidth + buffer;

              // our report page is in a grid pattern so replicate that in the new canvas
              if (index % 2 === 1) {
                pdfctxX = 0;
                pdfctxY += canvasHeight + buffer;
              }
            });

            // create new pdf and add our new canvas as an image
            var pdf = new jsPDF('l', 'pt', [reportPageWidth, reportPageHeight]);
            pdf.addImage($(pdfCanvas)[0], 'PNG', 0, 0);

            // download the pdf
            pdf.save('Notas_' + nombre_seccion + '_' + nombre_saber + '.pdf');
          });

          $('#save-png').click(function () {
            // console.log('Pablo')
            $('#chartNotas').get(0).toBlob(function (blob) {
              saveAs(blob, 'Notas_' + nombre_seccion + '_' + nombre_saber + '.png');
              // console.log('Silas')
            });
          });

          $('#save-jpg').click(function () {
            $('#chartNotas').get(0).toBlob(function (blob) {
              saveAs(blob, 'Notas_' + nombre_seccion + '_' + nombre_saber + '.jpg');
            })
          });
        }


      },
      error: function (respuesta) {
        var datos = JSON.parse(respuesta);
      }

    });
  });

  $("#porcentaje").click(function (e) {
    let seccion = $("#seccion").val();
    let saber = $("#saber").val();
    var url = $("#url").val();
    $(".box-cargando").show();
    $.ajax({
      url: url + '/Porcentaje',
      type: 'POST',
      data: {
        Reportes: true,
        seccion: seccion,
        saber: saber,
      },
      success: function (resp) {
        // // alert(resp);
        $(".box-cargando").hide();
        // console.log(resp);

        if (resp == '[]') {
          Swal.fire({
            position: 'center',
            type: 'warning',
            title: 'No se puede generar la gráfica',
            text: 'No hay calificaciones asignadas en este saber complementario',
            footer: 'SCHSL', timer: 4000, showCloseButton: false, showConfirmButton: false,
          });
        } else {
          $(".pdf").slideUp(500);
          $(".estadistico").slideUp(500);
          $(".porcentaje").slideUp(500);
          $(".boxlist_alumnosnotas").slideDown(500);
          var datos = JSON.parse(resp);
          var nombre_saber = datos[0]['nombreSC'];
          var nombre_seccion = datos[0]['nombre_seccion'];

          const generateRandomColor = () => {
            const r = Math.floor(Math.random() * 256);
            const g = Math.floor(Math.random() * 256);
            const b = Math.floor(Math.random() * 256);
            const rgbaColor = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.2)';
            const rgbColor = 'rgba(' + r + ', ' + g + ', ' + b + ', 1)';
            return rgbColor + '/' + rgbaColor;
          };
          arrData = [];
          arrColor = [];
          arrRGBA = [];
          arrNotas = [];
          arrNotas0 = [];
          arrNotas01 = [];
          arrNotas02 = [];
          arrNotas03 = [];
          arrNotas04 = [];
          arrNotas05 = [];
          arrNotas06 = [];
          arrNotas07 = [];
          arrNotas08 = [];
          arrNotas09 = [];
          arrNotas1 = [];
          datos.forEach(function (valor, indice, datos) {
            let nombres = valor.nombre_alumno + ' ' + valor.apellido_alumno;
            if (valor.nota == '0') {
              arrNotas0.push(valor.nota);
            }
            if (valor.nota == '0.1') {
              arrNotas01.push(valor.nota);
            }
            if (valor.nota == '0.2') {
              arrNotas02.push(valor.nota);
            }
            if (valor.nota == '0.3') {
              arrNotas03.push(valor.nota);
            }
            if (valor.nota == '0.4') {
              arrNotas04.push(valor.nota);
            }
            if (valor.nota == '0.5') {
              arrNotas05.push(valor.nota);
            }
            if (valor.nota == '0.6') {
              arrNotas06.push(valor.nota);
            }
            if (valor.nota == '0.7') {
              arrNotas07.push(valor.nota);
            }
            if (valor.nota == '0.8') {
              arrNotas08.push(valor.nota);
            }
            if (valor.nota == '0.9') {
              arrNotas09.push(valor.nota);
            }
            if (valor.nota == '1') {
              arrNotas1.push(valor.nota);
            }

            let notas = valor.nota;
            // const newColor = generateRandomColor();
            arrData.push(nombres);
            arrNotas.push(notas);
            // arrColor.push(newColor);
          });


          var i;
          for (i = 0; i <= 10; i++) {
            const newColor = generateRandomColor();
            let arr = newColor.split('/');
            // console.log(arr);
            arrColor.push(arr[0]);
            arrRGBA.push(arr[1]);
          }
          // console.log(arrColor)
          // console.log(arrRGBA)

          // console.log(arrNotas.length)
          var countNotas = arrNotas.length;
          // console.log(arrNotas08)
          // console.log(arrColor)
          // console.log(arrNotas)
          const datapoints = [arrNotas0.length, arrNotas01, arrNotas02, arrNotas03, arrNotas04, arrNotas05, arrNotas06, arrNotas07, arrNotas08, arrNotas09, arrNotas1]

          var count0 = (arrNotas0.length * 100) / countNotas;
          var count01 = (arrNotas01.length * 100) / countNotas;
          var count02 = (arrNotas02.length * 100) / countNotas;
          var count03 = (arrNotas03.length * 100) / countNotas;
          var count04 = (arrNotas04.length * 100) / countNotas;
          var count05 = (arrNotas05.length * 100) / countNotas;
          var count06 = (arrNotas06.length * 100) / countNotas;
          var count07 = (arrNotas07.length * 100) / countNotas;
          var count08 = (arrNotas08.length * 100) / countNotas;
          var count09 = (arrNotas09.length * 100) / countNotas;
          var count1 = (arrNotas1.length * 100) / countNotas;


          // setup 
          const data = {
            labels: ['0pt', '0.1pt', '0.2pt', '0.3pt', '0.4pt', '0.5pt', '0.6pt', '0.7pt', '0.8pt', '0.9pt', '1pt'],
            datasets: [{
              label: 'Porcentaje %',
              data: [count0, count01, count02, count03, count04, count05, count06, count07, count08, count09, count1],
              backgroundColor: arrRGBA,
              borderColor: arrColor,
              borderWidth: 1
            }]
          };

          // config 
          const config = {
            type: 'pie',
            data,
            options: {
              scales: {

              },
              plugins: {
                tooltip: {
                  enabled: true
                },
                datalabels: {
                  formatter: (value, context) => {
                    // console.log(context.chart.data.datasets[0].data)
                    // const display = [`${value}, ${}`]
                    return value + '%';
                  }
                }
              }
            },
            plugins: [ChartDataLabels]
          };

          // render init block
          $('#chartNotas').css({ 'width': '0px', 'height': '0px' });
          $('#chartBoxSuccess').css({ 'width': '0px', 'height': '0px' });
          $('#chartBox').css({ 'width': '500px', 'height': '500px' });
          chart = new Chart(
            document.getElementById('myChart'),
            config
          );




          $('#downloadPdf').click(function (event) {
            console.log("Rodeado")
            // get size of report page
            var reportPageHeight = $('#reportPage').innerHeight();
            var reportPageWidth = $('#reportPage').innerWidth();

            // create a new canvas object that we will populate with all other canvas objects
            var pdfCanvas = $('<canvas />').attr({
              id: "canvaspdf",
              width: reportPageWidth,
              height: reportPageHeight
            });

            // keep track canvas position
            var pdfctx = $(pdfCanvas)[0].getContext('2d');
            var pdfctxX = reportPageWidth / 3;
            var pdfctxY = 0;
            var buffer = 100;

            // for each chart.js chart
            $("canvas").each(function (index) {
              // get the chart height/width
              var canvasHeight = $(this).innerHeight();
              var canvasWidth = $(this).innerWidth();

              // draw the chart into the new canvas
              pdfctx.drawImage($(this)[0], pdfctxX, pdfctxY, canvasWidth, canvasHeight);
              pdfctxX += canvasWidth + buffer;

              // our report page is in a grid pattern so replicate that in the new canvas
              if (index % 2 === 1) {
                pdfctxX = 0;
                pdfctxY += canvasHeight + buffer;
              }
            });

            // create new pdf and add our new canvas as an image
            var pdf = new jsPDF('l', 'pt', [reportPageWidth, reportPageHeight]);
            pdf.addImage($(pdfCanvas)[0], 'PNG', 0, 0);

            // download the pdf
            pdf.save('Notas_' + nombre_seccion + '_' + nombre_saber + '.pdf');
          });

          $('#save-png').click(function () {
            console.log('Pablo')
            $('#myChart').get(0).toBlob(function (blob) {
              saveAs(blob, 'Notas_' + nombre_seccion + '_' + nombre_saber + '.png');
              console.log('Silas')
            });
          });

          $('#save-jpg').click(function () {
            $('#myChart').get(0).toBlob(function (blob) {
              saveAs(blob, 'Notas_' + nombre_seccion + '_' + nombre_saber + '.jpg');
            })
          });
        }


      },
      error: function (respuesta) {
        var datos = JSON.parse(respuesta);
      }

    });
  });

  $("#aprobado").click(function (e) {
    let seccion = $("#secc").val();
    var url = $("#url").val();
    $(".box-cargando").show();
    $.ajax({
      url: url + '/Aprobados',
      type: 'POST',
      data: {
        Reportes: true,
        seccion: seccion,
      },
      success: function (resp) {
        $(".box-cargando").hide();
        console.log(seccion);
        console.log(resp);

        if (resp == '[]') {
          Swal.fire({
            position: 'center',
            type: 'warning',
            title: 'No se puede generar la gráfica',
            text: 'No hay calificaciones asignadas en este saber complementario',
            footer: 'SCHSL', timer: 4000, showCloseButton: false, showConfirmButton: false,
          });
        } else {
          $(".aprobado").slideUp(500);
          $(".boxlist_alumnosnotas").slideDown(500);
          var datos = JSON.parse(resp);
          var nombre_seccion = datos[0]['nombre_seccion'];

          const generateRandomColor = () => {
            const r = Math.floor(Math.random() * 256);
            const g = Math.floor(Math.random() * 256);
            const b = Math.floor(Math.random() * 256);
            const rgbaColor = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.2)';
            const rgbColor = 'rgba(' + r + ', ' + g + ', ' + b + ', 1)';
            return rgbColor + '/' + rgbaColor;
          };
          arrColor = [];
          arrRGBA = [];
          arrNotas = [];
          arrNotas05 = [];
          arrNotas1 = [];
          datos.forEach(function (valor, indice, datos) {
            if (valor.nota >= '0' && valor.nota <= '0.5') {
              arrNotas05.push(valor.nota);
            } else if (valor.nota > '0.5' && valor.nota <= '1') {
              arrNotas1.push(valor.nota);
            }
            let notas = valor.nota;
            arrNotas.push(notas);

          });

          var countNotas = arrNotas.length;
          // console.log(countNotas)
          // console.log(arrNotas)
          // console.log(arrNotas05)
          // console.log(arrNotas1)


          var i;
          for (i = 0; i <= 1; i++) {
            const newColor = generateRandomColor();
            let arr = newColor.split('/');
            console.log(arr);
            arrColor.push(arr[0]);
            arrRGBA.push(arr[1]);
            var count05 = (arrNotas05.length * 100) / countNotas;
            var count1 = (arrNotas1.length * 100) / countNotas;
          }

          // setup 
          const data = {
            labels: ['Aprobados', 'Aplazados'],
            datasets: [{
              label: 'Porcentaje %',
              data: [count1, count05],
              backgroundColor: arrRGBA,
              borderColor: arrColor,
              borderWidth: 1
            }]
          };

          // config 
          const config = {
            type: 'pie',
            data,
            options: {
              scales: {

              },
              plugins: {
                tooltip: {
                  enabled: true
                },
                datalabels: {
                  formatter: (value, context) => {
                    return value + '%';
                  }
                }
              }
            },
            plugins: [ChartDataLabels]
          };

          // render init block
          $('#chartBoxSuccess').css({ 'width': '300px', 'height': '300px' });
          chart = new Chart(
            document.getElementById('sucess'),
            config
          );




          $('.downloadPdf').click(function (event) {
            console.log("Rodeado")
            // get size of report page
            var reportPageHeight = $('.reportPage').innerHeight();
            var reportPageWidth = $('.reportPage').innerWidth();

            // create a new canvas object that we will populate with all other canvas objects
            var pdfCanvas = $('<canvas />').attr({
              id: "canvaspdf",
              width: reportPageWidth,
              height: reportPageHeight
            });

            // keep track canvas position
            var pdfctx = $(pdfCanvas)[0].getContext('2d');
            var pdfctxX = 0;
            var pdfctxY = 0;
            var buffer = 10;

            // for each chart.js chart
            $("canvas").each(function (index) {
              // get the chart height/width
              var canvasHeight = $(this).innerHeight();
              var canvasWidth = $(this).innerWidth();

              // draw the chart into the new canvas
              pdfctx.drawImage($(this)[0], 200, 10, 300, 300);
              pdfctxX += canvasWidth + buffer;

              // our report page is in a grid pattern so replicate that in the new canvas
              if (index % 2 === 1) {
                pdfctxX = 0;
                pdfctxY += canvasHeight + buffer;
              }
            });

            // create new pdf and add our new canvas as an image
            var pdf = new jsPDF('l', 'pt', [500, 300]);
            pdf.addImage($(pdfCanvas)[0], 'PNG', 0, 0);

            // download the pdf
            pdf.save('Aprobados_Estadístico_' + nombre_seccion + '.pdf');
          });

          $('.save-png').click(function () {
            console.log('Pablo')
            $('#sucess').get(0).toBlob(function (blob) {
              saveAs(blob, 'Aprobados_Estadístico_' + nombre_seccion + '.png');
              console.log('Silas')
            });
          });

          $('.save-jpg').click(function () {
            $('#sucess').get(0).toBlob(function (blob) {
              saveAs(blob, 'Aprobados_Estadístico_' + nombre_seccion + '.jpg');
            })
          });


        }

      },
      error: function (respuesta) {
        var datos = JSON.parse(respuesta);
      }

    });
  });

});

const cerrarmodal = () => {
  $("#modalNota #seccion").val('').trigger('change');
  $("#modalAprobado #secc").val('').trigger('change');
  $("#modalNota #saber").val('').trigger('change');
  chart.destroy();
  $(".boxlist_alumnosnotas").slideUp(500);
  $(".pdf").slideDown(500);
  $(".estadistico").slideDown(500);
  $(".porcentaje").slideDown(500);
  $(".aprobado").slideDown(500);

}

$('.cerrarM').click(cerrarmodal);
$('.salirM').click(cerrarmodal);