<%-- 
    Document   : frmFacturaVenta
    Created on : 10-sep-2023, 10:37:29
    Author     : Anthony Rodriguez Valverde
--%>
<%@page import="Entidades.DetalleFacturaVenta"%>
<%@page import="Logica.LNDetalleFacturaV"%>
<%@page import="Entidades.Productos"%>
<%@page import="Logica.LNProductos"%>

<%@page import="java.util.List"%>
<%@page import="Entidades.Clientes"%>
<%@page import="Logica.LNClientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Realizar Venta</title>
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
                            <a class="nav-link text-dark" href="frmVerFacturacionC.jsp">Facturas compra</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="frmVerFacturacionV.jsp">Facturacion ventas</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
        
        <div class="container">
            <div class="row">
                <div class="col-10">
                    <h1>Facturacion venta</h1>
                </div>
                </div>
                <br>
                
                <form action="CrearFacturaVenta" method="post" id="Validando">
                    <div class="form-group">
                        <div class="input-group">
                            <input type="text" id="txtIdCliente" name="txtIdCliente" value="" readonly class="form-control" placeholder="Id del cliente"/>
                            <input type="text" id="txtNombre" name="txtNombre" value="" readonly class="form-control" placeholder="Seleccione un cliente"/>
                            <a id="btnBuscar" class="btn btn-outline-warning" data-toggle="modal" data-target="#buscarCliente">
                                <i class="fas fa-search"></i>
                            </a>
                        </div>
                        <button type="submit" class="btn btn-warning">Empezar compra</button>
                </form>
        </div>
                    
           <!-- Modal buscar provedor-->
        <div class="modal" id="buscarCliente" tabindex="1" role="dialog" aria-labelledby="tituloVentana">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 id="tituloVentana">Buscar cliente</h5>
                        <button class="close" data-dismiss="modal" arial-label="Cerrar" arial-hidden="true" onclick="Limpiar()">
                            <span aria-hidden="true">&times;</span>
                            
                        </button>
                    </div>
                    <div class="modal-body">
                        <table id="tablaClientes">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre</th>
                                    <th>Seleccionar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    LNClientes logica = new LNClientes();
                                    List<Clientes> datos;
                                    datos = logica.ListarClientes_List("");
                                    
                                    for(Clientes registro:datos){ 
                                %>
                                <tr>
                                    <%int codigoC = registro.getId();
                                    String nombreC = registro.getNombre();
                                    %>
                                    <td><%=codigoC%></td>
                                    <td><%=nombreC%></td>
                                    <td>
                                        <a href="#" data-dismiss="modal" onclick="SeleccionarCliente('<%= codigoC %>', '<%= nombreC %> ')" >Seleccionar</a>
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
        <script src="lib/jquery-validation/dist/jquery.validate.js" type="text/javascript"></script>
        <script src="lib/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
        <script src="lib/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
        <script src="lib/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script src="lib/DataTables/datatables.min.js" type="text/javascript"></script>
        <script src="lib/DataTables/DataTables-1.10.21/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                $('#tablaClientes').dataTable({
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
           function SeleccionarCliente(idProvedor,nombre){
               $("#txtIdCliente").val(idProvedor);
               $("#txtNombre").val(nombre);
           }
           
           function Limpiar(){
               $("#txtIdCliente").val("");
               $("#txtNombre").val("");
           }
           
           //Limpiar en seleccionar 
           
        </script>
        
    <script>
        // Cuando el documento esté listo
        $(document).ready(function () {
            $("#Validando").validate({
                rules: {
                    txtNombre: { required: true },
                    txtIdCliente: { required: true },
                },
                messages: {
                    txtNombre: "Campo obligatorio!",
                    txtIdCliente: "Campo obligatorio!",
                },
                errorElement: 'span'
            });
        });
    </script>

        
    </body>
</html>
