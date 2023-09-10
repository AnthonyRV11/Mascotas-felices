<%-- 
    Document   : frmFacturaCompra
    Created on : 07-sep-2023, 17:42:14
    Author     : Anthony Rodriguez Valverde 07/09/2023
--%>

<%@page import="Entidades.DetalleFacturaCompra"%>
<%@page import="Logica.LNDetalleFactura"%>
<%@page import="Entidades.Productos"%>
<%@page import="Logica.LNProductos"%>

<%@page import="java.util.List"%>
<%@page import="Entidades.Provedores"%>
<%@page import="Logica.LNProvedores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Realizar Compra</title>
        <link href="lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="lib/bootstrap-datepicker/css/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" type="text/css"/>
        <link href="lib/fontawesome-free-5.14.0-web/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="lib/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        
    <header>
        <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
            <div class="container">
                <a class="navbar-brand" href="index.html">Mascotas felices<i class="fas fa-tasks"></i></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-collapse" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse collapse d-sm-inline-flex flex-sm-row-reverse">
                    <ul class="navbar-nav flex-grow-1">
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="frmListarClientes.jsp">Clientes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="frmListarProvedores.jsp">Provedores</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="frmFacturaCompra.jsp">Compra</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="frmFacturaVenta.jsp">Venta</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href=#>Facturación</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
        
       <div class="container">
            <div class="row">
                <div class="col-10">
                    <h1>Facturacion compra</h1>
                </div>
                </div>
                <br>
                
                <form action="CrearFacturaCompra" method="post">
                    <div class="form-group">
                        <div class="input-group">
                            <input type="text" id="txtIdProvedor" name="txtIdProvedor" value="" readonly class="form-control" placeholder="Id del provedor"/>
                            <input type="text" id="txtNombre" name="txtNombre" value="" readonly class="form-control" placeholder="Seleccione un provedor"/>
                            <a id="btnBuscar" class="btn btn-outline-warning" data-toggle="modal" data-target="#buscarProvedor">
                                <i class="fas fa-search"></i>
                            </a>
                        </div>
                        <button type="submit" class="btn btn-warning">Empezar compra</button>
                </form>
        </div>
       
           <!-- Modal buscar provedor-->
        <div class="modal" id="buscarProvedor" tabindex="1" role="dialog" aria-labelledby="tituloVentana">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 id="tituloVentana">Buscar provedor</h5>
                        <button class="close" data-dismiss="modal" arial-label="Cerrar" arial-hidden="true" onclick="Limpiar()">
                            <span aria-hidden="true">&times;</span>
                            
                        </button>
                    </div>
                    <div class="modal-body">
                        <table id="tablaProvedores">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre</th>
                                    <th>Seleccionar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    LNProvedores logica = new LNProvedores();
                                    List<Provedores> datos;
                                    datos = logica.Listar("");
                                    
                                    for(Provedores registro:datos){ 
                                %>
                                <tr>
                                    <%int codigoC = registro.getId();
                                    String nombreC = registro.getNombre();
                                    %>
                                    <td><%=codigoC%></td>
                                    <td><%=nombreC%></td>
                                    <td>
                                        <a href="#" data-dismiss="modal" onclick="SeleccionarProvedor('<%= codigoC %>', '<%= nombreC %> ')" >Seleccionar</a>
                                    </td>
                                    
                                </tr>
                                <%}%>
                                
                            </tbody>
                        </table>
                    </div>
                        <div class="modal-footer">
                            <button class="btn btn-outline-warning" type="button" data-dismiss="modal" onclick="Limpiar()">
                                Cancelar
                            </button>
                        </div>
                </div>
            </div> <!-- Fin del modal dialog-->
        </div> <!-- Fin del modal -->
            
        <!-- Scripts requeridos-->
        <script src="lib/jquery/dist/jquery.min.js" type="text/javascript"></script>
        <script src="lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="lib/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
        <script src="lib/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script src="lib/DataTables/datatables.min.js" type="text/javascript"></script>
        <script src="lib/DataTables/DataTables-1.10.21/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                $('#tablaProvedores').dataTable({
                    "lengthMenu":[[5,15,15,-1],[5,10,15,"ALL"]],
                    "language":{
                        "info":"Pagina _PAGE_ de _PAGES_","infoEmpty": "No hay registros",
                        "zeroRecords": "No se encuentran registros",
                        "search": "Buscar",
                        "infoFiltered": "",
                        "lengthMenu": "Mostrar _MENU_Registros",
                        "paginate":{
                            "first":"Primero",
                            "last": "Ultimo",
                            "next": "Siguiente",
                            "previous":"Anterior"
                        }
                    }
                })
            });
           //Seleccionar
           function SeleccionarProvedor(idProvedor,nombre){
               $("#txtIdProvedor").val(idProvedor);
               $("#txtNombre").val(nombre);
           }
           
           function Limpiar(){
               $("#txtIdProvedor").val("");
               $("#txtNombre").val("");
           }
           
           //Limpiar en seleccionar 
           
        </script>

    </body>
</html>
