<?php	

	namespace content\component;

	class headElement {

		static public function Heading(){
				// <link rel="stylesheet" href="'._ROUTE_.'view/vendor/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
			echo (
				'<meta charset="utf-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">

				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<meta name="author" content="Madelyn&Kppa">
				<meta name="description" content="Silkroad">

				<!--favicon-->
				<link rel="shortcut icon" type="image/k-icon" href="'._ROUTE_.'assets/img/ic.png" class="img-circle">

				<!--css-->
				<link rel="stylesheet" href="'._ROUTE_.'view/vendor/bower_components/bootstrap/dist/css/bootstrap.min.css">
				<link rel="stylesheet" href="'._ROUTE_.'view/vendor/bower_components/font-awesome/css/font-awesome.min.css">
				<link rel="stylesheet" href="'._ROUTE_.'view/vendor/bower_components/Ionicons/css/ionicons.min.css">
				<link rel="stylesheet" href="'._ROUTE_.'view/vendor/dist/css/AdminLTE.min.css">
				<link rel="stylesheet" href="'._ROUTE_.'view/vendor/dist/css/skins/_all-skins_style.css">
				<link rel="stylesheet" href="'._ROUTE_.'view/vendor/plugins/sweetalert/sweetalert.css">
				<link rel="stylesheet" href="'._ROUTE_.'view/vendor/plugins/select2/css/select2.css">
				<link rel="stylesheet" type="text/css" href="'._ROUTE_.'view/vendor/plugins/DataTables/DataTables/css/dataTables.bootstrap.css">
				<link rel="stylesheet" type="text/css" href="'._ROUTE_.'view/vendor/plugins/DataTables/DataTables/css/responsive.dataTables.min.css">

				<!--js-->
				<script src="'._ROUTE_.'view/vendor/bower_components/jquery/dist/jquery.min.js"></script>
				<script src="'._ROUTE_.'view/vendor/bower_components/bootstrap/dist/js/bootstrap.js"></script>
				<script src="'._ROUTE_.'view/vendor/dist/js/adminlte.js"></script>
				<script src="'._ROUTE_.'view/vendor/plugins/DataTables/datatables.js"></script>
				<script src="'._ROUTE_.'view/vendor/plugins/DataTables/DataTables/js/dataTables.bootstrap.js"></script>
				<script src="'._ROUTE_.'view/vendor/plugins/DataTables/DataTables/js/dataTables.responsive.min.js"></script>
				<script src="'._ROUTE_.'view/vendor/plugins/sweetalert/sweet-alert.js"></script>
        
        <script src="'._ROUTE_.'view/vendor/plugins/select2/js/select2.js"></script>
				<script src="'._ROUTE_.'view/assets/js/validacionCampos.js"></script>
        <script src="'._ROUTE_.'view/assets/js/volver.js"></script>



<script>
  $(document).ready(function(){
      var widthImage2 = $(".ReadlImage2").width();
      $(".imageImage2").attr("style","height:"+widthImage2+"px;width:"+widthImage2+"px");
      $(window).resize(function(){
        var widthImage2 = $(".ReadlImage2").width();
        $(".imageImage2").attr("style","height:"+widthImage2+"px;width:"+widthImage2+"px");
      }); 
  });
  $(function () {
    $(".datatable").DataTable({
      "language": {
        "sProcessing":     "Procesando...",
        "sLengthMenu":     "Mostrar _MENU_ registros",
        "sZeroRecords":    "No se encontraron resultados",
        "sEmptyTable":     "Ningún dato disponible en esta tabla",
        "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
        "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
        "sInfoPostFix":    "",
        "sSearch":         "Buscar:",
        "sUrl":            "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",
        "oPaginate": {
            "sFirst":    "Primero",
            "sLast":     "Último",
            "sNext":     "Siguiente",
            "sPrevious": "Anterior"
        },
        "oAria": {
            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        },
        "info": true,
      },
      responsive: true,
    });
    $(".datatable2").DataTable({
      "language": {
        "sProcessing":     "Procesando...",
        "sLengthMenu":     "Mostrar _MENU_ registros",
        "sZeroRecords":    "No se encontraron resultados",
        "sEmptyTable":     "Ningún dato disponible en esta tabla",
        "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
        "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
        "sInfoPostFix":    "",
        "sSearch":         "Buscar:",
        "sUrl":            "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",
        "oPaginate": {
            "sFirst":    "Primero",
            "sLast":     "Último",
            "sNext":     "Siguiente",
            "sPrevious": "Anterior"
        },
        "oAria": {
            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        },
      },
      "order": [[ 0, "desc" ]],
      responsive: true,
    });
    $("#datatable").DataTable({
      "language": {
        "sProcessing":     "Procesando...",
        "sLengthMenu":     "Mostrar _MENU_ registros",
        "sZeroRecords":    "No se encontraron resultados",
        "sEmptyTable":     "Ningún dato disponible en esta tabla",
        "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
        "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
        "sInfoPostFix":    "",
        "sSearch":         "Buscar:",
        "sUrl":            "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",
        "oPaginate": {
            "sFirst":    "Primero",
            "sLast":     "Último",
            "sNext":     "Siguiente",
            "sPrevious": "Anterior"
        },
        "oAria": {
            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        },
        "info": true,
      },
      responsive: true,
    });
    $("#datatable2").DataTable({
      "language": {
        "sProcessing":     "Procesando...",
        "sLengthMenu":     "Mostrar _MENU_ registros",
        "sZeroRecords":    "No se encontraron resultados",
        "sEmptyTable":     "Ningún dato disponible en esta tabla",
        "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
        "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
        "sInfoPostFix":    "",
        "sSearch":         "Buscar:",
        "sUrl":            "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",
        "oPaginate": {
            "sFirst":    "Primero",
            "sLast":     "Último",
            "sNext":     "Siguiente",
            "sPrevious": "Anterior"
        },
        "oAria": {
            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        },
      },
      "order": [[ 0, "desc" ]],
      responsive: true,
    });
    $("#mini-datatable").DataTable({
      "language": {
        "sProcessing":     "Procesando...",
        "sLengthMenu":     "Mostrar _MENU_ registros",
        "sZeroRecords":    "No se encontraron resultados",
        "sEmptyTable":     "Ningún dato disponible en esta tabla",
        "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
        "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
        "sInfoPostFix":    "",
        "sSearch":         "Buscar:",
        "sUrl":            "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",
        "oPaginate": {
            "sFirst":    "Primero",
            "sLast":     "Último",
            "sNext":     "Siguiente",
            "sPrevious": "Anterior"
        },
        "oAria": {
            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        },
        "info": true,
        "pageLength": 5,
      },
      responsive: true,
    });
    $("#datatableOrder").DataTable({
      "language": {
        "sProcessing":     "Procesando...",
        "sLengthMenu":     "Mostrar _MENU_ registros",
        "sZeroRecords":    "No se encontraron resultados",
        "sEmptyTable":     "Ningún dato disponible en esta tabla",
        "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
        "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
        "sInfoPostFix":    "",
        "sSearch":         "Buscar:",
        "sUrl":            "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",
        "oPaginate": {
            "sFirst":    "Primero",
            "sLast":     "Último",
            "sNext":     "Siguiente",
            "sPrevious": "Anterior"
        },
        "oAria": {
            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        },
      },
      "order": [[ 2, "desc" ],[ 3, "desc" ]],
      responsive: true,
    });
    $("#datatable3").DataTable({
      "paging"      : true,
      "lengthChange": false,
      "searching"   : false,
      "ordering"    : true,
      "info"        : true,
      "autoWidth"   : false
    });
    $.fn.select2.defaults.set("language", "es");

    $(".select2").select2();
    $(".select2GrupoProyecto").select2({
      maximumSelectionLength: 5,
    });
    $(".select2SeccionAlumnos").select2({
      maximumSelectionLength: 40,
    });

    $("input").attr("autocomplete","off");
    







  });
  
</script>
  <script src="'._ROUTE_.'view/vendor/plugins/select2/es.js"></script>
				'
			);
		}

	}


?>
