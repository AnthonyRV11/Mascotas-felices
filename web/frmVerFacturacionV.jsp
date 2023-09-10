<%-- 
    Document   : frmVerFacturacionV
    Created on : 10-sep-2023, 13:51:52
    Author     : Anthony Rodriguez Valverde
--%>

<%@page import="Entidades.FacturaVenta"%>
<%@page import="java.util.List"%>
<%@page import="Logica.LNFacturaVenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Facturas de ventas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="lib/fontawesome-free-5.14.0-web/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/EstilosIndex.css" rel="stylesheet" type="text/css"/>
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
        
        <h1>Facturas de compras</h1>
        
        <!--El formulario se carga a si mismo-->
        <form action="frmVerFacturacionV.jsp" method="post">
            
            <!--Encabezado de la tabla-->
            <table class="table">
                <thead>
                    <tr id="titulos">
                        <th>Codigo</th>
                        <th>Codigo cliente</th>
                        <th>Total</th>
                        <th>Fecha</th>
                    </tr>
                </thead>
                
                <tbody>
                    <%
                        String nombre = "";
                        String condicion = "";
                        
                        if (request.getParameter("txtNombre") != null) {
                            nombre = request.getParameter("txtNombre");
                            condicion = "NOMBRE LIKE '%" + nombre +" %'";
                        }
                        
                        LNFacturaVenta logica = new LNFacturaVenta();
                        List<FacturaVenta> datos;
                        datos=logica.Listar("");
                        
                        for (FacturaVenta registro : datos) {
                    %>
                            <tr>
                                <!--Termina con ; porque es un bloque de codigo-->
                                <%int codigo = registro.getId_factura();%>
                                <!--No termina con ; porque es una expresion-->
                                <td><%=codigo%></td>
                                <td><%=registro.getId_Cliente()%></td>
                                <td><%=registro.getTotal_pagar()%></td>
                                <td><%=registro.getFecha()%></td>

                            </tr>
                        <%}%>
                </tbody>
            </table>
            <br>
            <div style="text-align: center;">
                <a href="index.html" class="btn btn-secondary">Regresar</a>
            </div>
        </form>
        
        
    </body>
</html>
