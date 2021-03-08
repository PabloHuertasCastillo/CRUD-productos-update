<%-- 
    Document   : listar
    Created on : 5 mar. 2021, 20:53:44
    Author     : Pablo
--%>

<%@page import="Modelos.Productos"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>
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
            <h1>Listado de productos</h1>
            <%
                List<Productos> misProductos = (List<Productos>) request.getAttribute("misProductos");
            %>

            <table class="table">
                <tr class="thead-dark">
                    <th>Nombre</th>
                    <th>Imagen</th>
                    <th>Categoria</th>
                    <th>Precio</th>
                    <th>borrar</th>
                    <th>Actualizar</th>
                </tr>

                <%
                    for (Productos p : misProductos) {
                        String cadenaBorrar = "<a onclick='confirmation()'  href='ServletProductos?op=borrar&id=" + p.getId() + "'><i class='fas fa-trash-alt'></i></a>";
                        String cadenaActualizar = "<a href='ServletProductos?op=update1&id=" + p.getId() + "'><i class='far fa-edit'></i></a>";
                %>

                <tr>
                    <td><%= p.getNombre()%></td>
                    <td><%= p.getImagen()%></td>
                    <td><%= p.getCategoria()%></td>
                    <td><%= p.getPrecio()%></td>
                    <td class="table-danger"><%= cadenaBorrar%>  </td>
                    <td class="table-info"><%= cadenaActualizar%></td>
                </tr>
                <%
                    }
                %>


            </table>
        </div>


    </body>
    <script>
        function confirmation() {
            if (confirm("Estas seguro?") == true) {
                alert('procedo a borrar');
                return true;
            } else {
                alert("Operacion cancelada");
                return false;
            }
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>
