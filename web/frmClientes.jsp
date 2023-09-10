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
