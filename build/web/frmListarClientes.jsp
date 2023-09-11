<%-- 
    Document   : frmListarClientes
    Created on : 06-sep-2023, 11:06:54
    Author     : Anthony Rodriguez Valverde
--%>

<%@page import="Entidades.Clientes" %>
<%@page import="Logica.*" %>
<%@page import="java.util.List" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de clientes</title>
         <!--Bootstrap-->
        <link href="lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!--FontAwesome-->
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
        
        <div class="container">
            <div class="card-header">
                <h1>Listado de Clientes</h1>
            </div>
        </div>
        
        <!--El formulario se carga a si mismo-->
        <form action="frmListarClientes.jsp" method="post">
            <div class="form-group">
                <div class="input-group">
                    <input type="text" id="txtNombre" name="txtNombre" placeholder="Buscar por Nombre">
                    <input type="submit" id="btnBuscar" name="btnBuscar" value="Buscar" class="btn btn-warning">
                    <br>
                </div>
            </div>
            
            <!--Encabezado de la tabla-->
            <table class="table">
                <thead>
                    <tr id="titulos">
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Apellido 1</th>
                        <th>Apellido 2</th>
                        <th>Cedula</th>
                        <th>Telefono</th>
                        <th>Correo</th>
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
                        
                        LNClientes logica = new LNClientes();
                        List<Clientes> datos;
                        datos=logica.ListarClientes_List(condicion);
                        
                        for (Clientes registro : datos) {
                    %>
                            <tr>
                                <!--Termina con ; porque es un bloque de codigo-->
                                <%int codigo = registro.getId();%>
                                <!--No termina con ; porque es una expresion-->
                                <td><%=codigo%></td>
                                <td><%=registro.getNombre()%></td>
                                <td><%=registro.getApellido1()%></td>
                                <td><%=registro.getApellido2()%></td>
                                <td><%=registro.getCedula()%></td>
                                <td><%=registro.getTelefono()%></td>
                                <td><%=registro.getCorreo()%></td>
                                <td>
                                    <a href="frmClientes.jsp?idCrearModificar=<%=codigo%>"><i class="fas fa-user-edit"></i></a>
                                    <a href="EliminarCliente?idCliente=<%=codigo%>"><i class="fas fa-trash-alt"></i></a>
                                    
                                </td>

                            </tr>
                        <%}%>
                </tbody>
            </table>
            <br>
           <%
            // Si la variable mensaje tiene algo
            if (request.getParameter("mensajeEliminarCliente") != null) {
           %>
            <p class='text-danger'><%= new String(request.getParameter("mensajeEliminarCliente").getBytes("ISO-8859-1"), "UTF-8") %></p>
           <%
            }
           %>
            <a href="frmClientes.jsp?idCrearModificar=-1" class="btn btn-warning">Agregar Cliente</a>
            <a href="frmListarClientes.jsp" class="btn btn-secondary">Actualizar</a>
            <a href="index.html" class="btn btn-secondary">Regresar</a>
        </form>
        
        <!--SCRIPT Bootstrap-->
        <script src="lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <footer class="border-top">
        <div class="container">
            &copy; Proyecto Mascotas felices
        </div>
        </footer>
    </body>
</html>
