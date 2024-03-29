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
        <style>
        body {
            background-color: #ffffff;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1600 900'%3E%3Cdefs%3E%3ClinearGradient id='a' x1='0' x2='0' y1='1' y2='0'%3E%3Cstop offset='0' stop-color='%230FF'/%3E%3Cstop offset='1' stop-color='%23CF6'/%3E%3C/linearGradient%3E%3ClinearGradient id='b' x1='0' x2='0' y1='0' y2='1'%3E%3Cstop offset='0' stop-color='%23F00'/%3E%3Cstop offset='1' stop-color='%23FC0'/%3E%3C/linearGradient%3E%3C/defs%3E%3Cg fill='%23FFF' fill-opacity='0' stroke-miterlimit='10'%3E%3Cg stroke='url(%23a)' stroke-width='2'%3E%3Cpath transform='translate(0 0)' d='M1409 581 1450.35 511 1490 581z'/%3E%3Ccircle stroke-width='4' transform='rotate(0 800 450)' cx='500' cy='100' r='40'/%3E%3Cpath transform='translate(0 0)' d='M400.86 735.5h-83.73c0-23.12 18.74-41.87 41.87-41.87S400.86 712.38 400.86 735.5z'/%3E%3C/g%3E%3Cg stroke='url(%23b)' stroke-width='4'%3E%3Cpath transform='translate(0 0)' d='M149.8 345.2 118.4 389.8 149.8 434.4 181.2 389.8z'/%3E%3Crect stroke-width='8' transform='rotate(0 1089 759)' x='1039' y='709' width='100' height='100'/%3E%3Cpath transform='rotate(0 1400 132)' d='M1426.8 132.4 1405.7 168.8 1363.7 168.8 1342.7 132.4 1363.7 96 1405.7 96z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
            background-attachment: fixed;
            background-size: cover;
        }
        </style>
        <link rel="icon" href="imagens/Favicon.png" type="image/x-icon">
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
                            <a class="nav-link text-dark" href="frmVerFacturacionC.jsp">Informes compra</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="frmVerFacturacionV.jsp">Informes ventas</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
        
        <h1>Facturas de ventas</h1>
        
        <!--El formulario se carga a si mismo-->
        <form action="frmVerFacturacionV.jsp" method="post">
            
            <!--Encabezado de la tabla-->
            <table class="table">
                <thead>
                    <tr id="titulos">
                        <th>Codigo</th>
                        <th>Codigo cliente</th>
                        <th>Nombre cliente</th>
                        <th>Total</th>
                        <th>Fecha</th>
                    </tr>
                </thead>
                
                <tbody>
                    <%
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
                                <td><%=registro.getNombre()%></td>
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
        <footer class="border-top">
        <div class="container">
            &copy; Proyecto Mascotas felices
        </div>
        </footer>
        
    </body>
</html>
