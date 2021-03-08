<%-- 
    Document   : update
    Created on : 8 mar. 2021, 19:46:31
    Author     : Pablo
--%>

<%@page import="Modelos.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="index.jsp">Restaurante Bosco</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="ServletProductos?op=listar">Listar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ServletProductos?op=insert1">Nuevo producto</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container" >
             
             <h1>Actualizar producto</h1>
        <%
            Productos miProducto = (Productos) request.getAttribute("miProducto");
            String mensaje = (String) request.getAttribute("mensaje");
            String cadena = "";
            if(mensaje!=null){
                cadena = "<h2 class='alert alert-success'>"+mensaje+"</h2>";
            }

        %>
        <%= cadena %>
        <form action="ServletProductos" method="get">
            <p><label>Nombre: <input class="form-control" type="text" name="nombre" value="<%= miProducto.getNombre()%>" required > </label></p>
            <p><label>Imagen: <input class="form-control" value="<%= miProducto.getImagen()%>" type="text" name="imagen" required > </label></p>
            <p><label>Categoría: <input class="form-control" value="<%= miProducto.getCategoria()%>" type="text" name="categoria" required > </label></p>
            <p><label>Precio: <input class="form-control" value="<%= miProducto.getPrecio()%>" type="text" name="precio" required > </label></p>
            <input type="hidden" name="op" required value="update2"> 
            <input type="submit" class="btn btn-primary" value="Actualizar" >       
        </form>
            
        </div>
        
    </body>
</html>
