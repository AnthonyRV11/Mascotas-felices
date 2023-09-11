<%-- 
    Document   : frmClientes
    Created on : 06-sep-2023, 13:01:04
    Author     : Anthony Rodriguez Valverde
--%>

<%@page import="Logica.LNClientes"%>
<%@page import="Entidades.Clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar o modificar clientes</title>
        <link href="lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/estilos.css" rel="stylesheet" type="text/css"/>
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
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card-header">
                        <h1>Cliente</h1>
                    </div><br>
                    <%
                        String id = request.getParameter("idCrearModificar");
                        int codigo = Integer.parseInt(id);
                        Clientes cliente;
                        LNClientes logica = new LNClientes();
                        if(codigo>0){
                            cliente = logica.ObtenerCliente("ID_CLIENTE ="+id);
                        }else{
                            cliente = new Clientes();
                        }

                    %>
                    
                    <form action="CrearModificarCliente" method="post" id="form-AgregarModificar">
                        <div class="form-group">
                            
                                <%if(codigo>0){%>
                                <!-- Si existe muestro el codigo -->
                                <label for="txtCodigo" class="control-label">Codigo:</label>
                                <input type="hiden" id="txtCodigo" name="txtCodigo" value="<%=cliente.getId()%>" readonly class="form-control">
                                <%}else{%>
                                <input type="hidden" id="txtCodigo" name="txtCodigo" value="-1">
                                <%}%>
                            
                        </div>
                                
        <div class="form-group">
            <label for="txtNombre" class="control-label">Nombre</label>
            <input type="text" id="txtNombre" name="txtNombre"
                   value="<%=cliente.getNombre()%>" class="form-control">
        </div>
        
        <div class="form-group">
            <label for="txtApellido1" class="control-label">Apellido 1</label>
            <input type="text" id="txtApellido1" name="txtApellido1"
                   value="<%=cliente.getApellido1()%>" class="form-control">
        </div>
        
        <div class="form-group">
            <label for="txtApellido2" class="control-label">Apellido 2</label>
            <input type="text" id="txtApellido2" name="txtApellido2"
                   value="<%=cliente.getApellido2()%>" class="form-control">
        </div>
        
        <div class="form-group">
            <label for="txtCedula" class="control-label">Cedula</label>
            <input type="text" id="txtCedula" name="txtCedula"
                   value="<%=cliente.getCedula()%>" class="form-control">
        </div>
        
        <div class="form-group">
            <label for="txtTelefono" class="control-label">Telefono</label>
            <input type="text" id="txtTelefono" name="txtTelefono"
                   value="<%=cliente.getTelefono()%>" class="form-control">
        </div>
        
         <div class="form-group">
            <label for="txtCorreo" class="control-label">Correo</label>
            <input type="text" id="txtCorreo" name="txtCorreo"
                   value="<%=cliente.getCorreo()%>" class="form-control">
        </div>
        
        <div class="form-group">
            <div class="input-group">
                <input type="submit" id="btnGuardar" value="Guardar" class="btn btn-outline-warning m-2" onclick="location.href='frmListarClientes.jsp'"/>
                <input type="button" id="btnRegresar" value="Regresar" class="btn btn-outline-secondary m-2" onclick="location.href='frmListarClientes.jsp'"/>
            </div>
        </div>
                               
                    </form>
                </div>
            </div>
        </div><!--Contenedor -->
       
        <!<!-- Script de bootstrap -->
        <script src="lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="lib/jquery/dist/jquery.min.js" type="text/javascript"></script>
        <script src="lib/jquery-validation/dist/jquery.validate.js" type="text/javascript"></script>
        <script src="lib/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
        <script>
            //Cuando el doc este listo
            $(document).ready(function (){
                $("#form-AgregarModificar").validate({
                    rules:{
                      txtNombre:{required:true,maxlength:25},
                      txtTelefono:{required:true,minlength:8,maxlength:11},
                      txtApellido1:{required:true,maxlength:25},
                      txtApellido2:{required:true,maxlength:25},
                      txtCedula:{required:true,maxlength:25},
                      txtCorreo:{required:true,maxlength:25}
                    },
                    messages:{
                        txtNombre:"Campo obligatorio,25 letras maximo",
                        txtTelefono:"Campo obligatorio, maximo 11 y el minimo 8 letras",
                        txtApellido1:"Campo obligatorio, maximo 25 letras",
                        txtApellido2:"Campo obligatorio, maximo 25 letras",
                        txtCedula:"Campo obligatorio, maximo 25 letras",
                        txtCorreo:"Campo obligatorio, maximo 25 letras"
                    },
                    errorElement:'span'
                    
                });
                
            });
            
        </script>
        
    </body>
</html>
