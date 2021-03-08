<%-- 
    Document   : insert
    Created on : 5 mar. 2021, 20:36:14
    Author     : Pablo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <div class="container">
            <h1>Nuevo producto</h1>
        <form action="ServletProductos?op=insert2" method="get">
            <p><label>Nombre: <input class="form-control" type="text" name="nombre" required > </label></p>
            <p><label>Imagen: <input class="form-control" type="text" name="imagen" required > </label></p>
            <p><label>Categoría: <input class="form-control" type="text" name="categoria" required > </label></p>
            <p><label>Precio: <input class="form-control" type="text" name="precio" required > </label></p>
            <input type="hidden" name="op" required value="insert2"> 
            <input type="submit" value="insertar" >       
        </form>
        </div>
        
    </body>
</html>

