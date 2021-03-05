/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.CRUD;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelos.Productos;
import java.util.List;

/**
 *
 * @author Pablo
 */
public class ServletProductos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String op = request.getParameter("op");
        /* TODO output your page here. You may use following sample code. */
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet ServletProductos</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet ServletProductos at " + request.getContextPath() + "</h1>");

        if (op.endsWith("listar")) {
            List<Productos> misProductos = CRUD.getProductos();
            request.setAttribute("misproductos", misProductos);
            request.getRequestDispatcher("listar.jsp").forward(request, response);
//            for (Productos p : misProductos) {
//                out.println(p.getNombre());
//            }

        }

        if (op.equals("insert1")) { //cuando le indicamos que vaya a insertar
            request.getRequestDispatcher("insert.jsp").forward(request, response);

        }

        if (op.equals("insert2")) { //cuando recibe los datos de la inserción
            Productos miProducto = new Productos();
            miProducto.setNombre(request.getParameter("nombre"));
            miProducto.setImagen(request.getParameter("imagen"));
            miProducto.setCategoria(request.getParameter("categoria"));
            String precio = request.getParameter("precio");
            miProducto.setPrecio(Float.parseFloat(precio));
            CRUD.insertaProducto(miProducto);
            out.println("<h1> " + "<a href='index.jsp' >Mandar a index</a>" + "</h1>");
        }
        
        if (op.equals("borrar")) { 
            int id = Integer.parseInt(request.getParameter("id"));
            
            if ( CRUD.destroyProducto(id)>0 ) {
                out.println("<h1> registro borrado " + "<a href='index.jsp' >Volver</a>" + "</h1>");
            }
            
            request.getRequestDispatcher("insert.jsp").forward(request, response);

        }

        out.println("</body>");
        out.println("</html>");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
