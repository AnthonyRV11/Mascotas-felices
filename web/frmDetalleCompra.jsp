<%-- 
    Document   : frmDetalleCompra
    Created on : 10-sep-2023, 1:01:24
    Author     : Anthony Rodriguez Valverde 07/09/2023
--%>
<%@page import="java.util.List"%>
<%@page import="Entidades.DetalleFacturaCompra"%>
<%@page import="Logica.LNDetalleFactura"%>
<%@page import="Entidades.Productos"%>
<%@page import="Logica.LNProductos"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregando detalles</title>
        <link href="lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="lib/bootstrap-datepicker/css/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" type="text/css"/>
        <link href="lib/fontawesome-free-5.14.0-web/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="lib/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Agregue detalles a la compra</h1>
        <div id="oculto">
           <div class="container">
            <div class="row">
                <div class="col-10">
                </div>
                </div>
                <br>             
                <form action="AgregarDetallesCompra" method="post" id="Validando">

                    <%
        int resultadoFactura = (Integer) session.getAttribute("resultadoFactura");

        // Verifica si el resultado existe antes de usarlo para evitar errores
        if (resultadoFactura != 0) {
        // Utiliza el valor como desees
        // Por ejemplo, muestra el resultado en la página
        %>
            <input type="text" id="txtNumFactura" name="txtNumFactura" value="<%= resultadoFactura %>" readonly class="form-control" readonly/>
        <%
        }
        %>

    <!-- Otros campos del formulario -->
    <input type="text" id="txtIdProducto" name="txtIdProducto" value="" readonly class="form-control" placeholder="Id del producto"/>
    <input type="text" id="txtNombreProducto" name="txtNombreProducto" value="" readonly class="form-control" placeholder="Nombre del producto"/>
    <input type="text" id="txtPrecio" name="txtPrecio" value="" readonly class="form-control" placeholder="Precio del producto"/>
    <input type="text" id="txtCantidad" name="txtCantidad" value="" readonly class="form-control" placeholder="Cantidad del producto"/>
    <input type="text" id="txtCantidadCompra" name="txtCantidadCompra" value="" class="form-control" placeholder="Ingrese la cantidad que quiere"/>
    <a id="btnBuscar2" class="btn btn-outline-warning" data-toggle="modal" data-target="#buscarProductos">
        <i class="fas fa-search"></i>
    </a>

    <button type="submit" class="btn btn-warning">Agregar</button>
</form>
        </div>
        </div>
                    
        <!-- Modal buscar productos-->
        <div class="modal" id="buscarProductos" tabindex="1" role="dialog" aria-labelledby="tituloVentana">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 id="tituloVentana">Buscar producto</h5>
                        <button class="close" data-dismiss="modal" arial-label="Cerrar" arial-hidden="true" onclick="Limpiar()">
                            <span aria-hidden="true">&times;</span>
                            
                        </button>
                    </div>
                    <div class="modal-body">
                        <table id="tablaProductos">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre</th>
                                    <th>Precio</th>
                                    <th>Existencia</th>
                                    <th>Seleccionar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    LNProductos logica2 = new LNProductos();
                                    List<Productos> datos2;
                                    datos2 = logica2.Listar("");
                                    
                                    for(Productos registro:datos2){ 
                                %>
                                <tr>
                                    <%int codigoC = registro.getId();
                                    String nombreC = registro.getNombre();
                                    Double precio = registro.getPrecio_Venta();
                                    int existencia = registro.getCantidad();
                                    %>
                                    <td><%=codigoC%></td>
                                    <td><%=nombreC%></td>
                                    <td><%=precio%></td>
                                    <td><%=existencia%></td>
                                    <td>
                                        <a href="#" data-dismiss="modal" onclick="SeleccionarProducto('<%= codigoC %>', '<%= nombreC %> ','<%= precio %> ','<%= existencia %> ' )" >Seleccionar</a>
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
        
        <div id="TablaDetalle">
             <!--El formulario se carga a si mismo-->
        <form action="frmDetalleCompra.jsp" method="post">
            
            <!--Encabezado de la tabla-->
            <table class="table">
                <thead>
                    <tr id="titulos">
                        <th>Código detalle</th>
                        <th>Codigo factura</th>
                        <th>Codigo producto</th>
                        <th>Cantidad ingresada</th>
                        <th>Fecha compra</th>
                        <th>Hora compra</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                
                <tbody>
                    <%
                        Integer condicion2 = (Integer) session.getAttribute("resultadoFactura");
                        String condicion = "ID_FACTURA = " + condicion2;

                        LNDetalleFactura logica3 = new LNDetalleFactura();
                        List<DetalleFacturaCompra> datos3;
                        datos3=logica3.Listar(condicion);
                        
                        for (DetalleFacturaCompra registro : datos3) {
                    %>
                            <tr>
                                <!--Termina con ; porque es un bloque de codigo-->
                                <%int codigo = registro.getId_Detalle();%>
                                <!--No termina con ; porque es una expresion-->
                                <td><%=codigo%></td>
                                <td><%=registro.getId_factura()%></td>
                                <td><%=registro.getId_producto()%></td>
                                <td><%=registro.getCantidad()%></td>
                                <td><%=registro.getFechaVenta()%></td>
                                <td><%=registro.getVenta()%></td>
                                <td>
                                    <a href="EliminarDetalleCompra?idDetalle=<%=codigo%>"><i class="fas fa-trash-alt"></i></a>  
                                </td>

                            </tr>
                        <%}%>
                </tbody>
            </table>
                <%
                    Integer condicion3 = (Integer) session.getAttribute("resultadoFactura");
                    String condicionP = "ID_FACTURA = " + condicion3;

                    LNDetalleFactura logica4 = new LNDetalleFactura();
                    double precio = logica4.Precio(condicionP);
                %>

        <h3>Precio:</h3>
        <p><%= precio %></p>

                
            <br>
            <a href="frmFacturaCompra.jsp" class="btn btn-warning">Finalizar Compra</a>
        </form>
        </div>
                
        
        <script src="lib/jquery/dist/jquery.min.js" type="text/javascript"></script>
        <script src="lib/jquery-validation/dist/jquery.validate.js" type="text/javascript"></script>
        <script src="lib/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
        <script src="lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="lib/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
        <script src="lib/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script src="lib/DataTables/datatables.min.js" type="text/javascript"></script>
        <script src="lib/DataTables/DataTables-1.10.21/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
        
         <script>
            $(document).ready(function(){
                $('#tablaProductos').dataTable({
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
           function SeleccionarProducto(idProducto,nombre,precio,cantidad){
               $("#txtIdProducto").val(idProducto);
               $("#txtNombreProducto").val(nombre);
               $("#txtCantidad").val(cantidad);
               $("#txtPrecio").val(precio);
           }
           
           function Limpiar(){
               $("#txtIdProducto").val("");
               $("#txtNombreProducto").val("");
               $("#txtCantidad").val("");
               $("#txtPrecio").val("");
           }
           //Limpiar en seleccionar 
           
        </script>
        
        <script>
            //Cuando el doc este listo
            $(document).ready(function (){
                $("#Validando").validate({
                    rules:{
                      txtIdProducto:{required:true},
                      txtNombreProducto:{required:true},
                      txtPrecio:{required:true},
                      txtCantidad:{required:true},
                      txtCantidadCompra:{required:true,digits: true},
                    },
                    messages:{
                        txtIdProducto:"Campo obligatorio",
                        txtNombreProducto:"Campo obligatorio",
                        txtPrecio:"Campo obligatorio",
                        txtCantidad:"Campo obligatorio",
                        txtCantidadCompra:"Campo obligatorio, debe de ser un numero entero"
                    },
                    errorElement:'span'
                    
                });
                
            });
            
        </script>
        
    </body>
</html>
