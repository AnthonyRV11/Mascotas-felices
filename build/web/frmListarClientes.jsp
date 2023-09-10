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
        
    </body>
</html>
