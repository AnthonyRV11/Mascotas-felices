package Servlets;

import Entidades.DetalleFacturaCompra;
import Logica.LNDetalleFactura;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Anthony Rodriguez Valverde 08/09/2023

@WebServlet("/AgregarDetallesCompra")
public class AgregarDetallesCompra extends HttpServlet {

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
        String mensaje;
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try{
                LNDetalleFactura logica = new LNDetalleFactura();
                DetalleFacturaCompra cliente = new DetalleFacturaCompra();
                int resultado;
                cliente.setId_factura(Integer.parseInt(request.getParameter("txtNumFactura")));
                cliente.setId_producto(Integer.parseInt(request.getParameter("txtIdProducto")));
                cliente.setCantidad(Integer.parseInt(request.getParameter("txtCantidadCompra")));
                    resultado = logica.Insertar(cliente);
                    mensaje=logica.getMensaje();
                response.sendRedirect("frmFacturaCompra.jsp?mensaje="+mensaje+"resultado="+resultado);
            }catch(Exception ex){
                out.print(ex.getMessage());
            }
            
        }
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
