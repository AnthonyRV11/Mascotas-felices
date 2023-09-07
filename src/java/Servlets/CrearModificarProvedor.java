package Servlets;

import Entidades.Provedores;
import Logica.LNProvedores;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CrearModificarProvedor")
public class CrearModificarProvedor extends HttpServlet {

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
                LNProvedores logica = new LNProvedores();
                Provedores cliente = new Provedores();
                int resultado;
                cliente.setId(Integer.parseInt(request.getParameter("txtCodigo")));
                cliente.setNombre(new String(request.getParameter("txtNombre").getBytes("ISO-8859-1"),"UTF-8"));
                cliente.setTelefono(request.getParameter("txtTelefono"));
                cliente.setCorreo(request.getParameter("txtCorreo"));
                if(cliente.getId()>0){
                    resultado = logica.Modificar(cliente);
                    mensaje   = "Provedor modificado";
                }else{
                    resultado = logica.Insertar(cliente);
                    mensaje=logica.getMensaje();
                }
                response.sendRedirect("frmListarProvedores.jsp?mensajeEliminarCliente="+mensaje+"&resultado"+resultado);
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
