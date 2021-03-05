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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Listado de productos</h1>
        <% 
            List<Productos> misProductos = (List<Productos>) request.getAttribute("misProductos");
        %>
        
        <table>
            <tr>
                <th>Nombre</th>
                <th>Imagen</th>
                <th>Categoria</th>
                <th>Precio</th>
                <th>borrar</th>
            </tr>
            <tr>
                <%
                    for ( Productos p: misProductos) {
                        String cadenaBorrar = "<a onclick='confirmation()'  href='ServletProductos?op=borrar&id="+p.getId()+"'>Borrar</a>";
                %>
                
                
                <td><%= p.getNombre() %></td>
                <td><%= p.getImagen() %></td>
                <td><%= p.getCategoria() %></td>
                <td><%= p.getPrecio() %></td>
                <td ><%= cadenaBorrar %></td>
                
                <%
                    }
                %>
            </tr>
            
        </table>
        
    </body>
    <script>
        function confirmation(){
            if (confirm("Estas seguro?")==true) {
                alert('procedo a borrar');
                return true;
            } else {
                alert("Operacion cancelada");
                return false;
            }
        }
    </script>
</html>
