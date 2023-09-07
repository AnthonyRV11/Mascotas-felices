package Servlets;

//Anthony Rodriguez Valverde 
import Entidades.Provedores;
import Logica.LNProvedores;
import java.io.*; //Imprimnir variables en pantalla
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/EliminarProvedor")
public class EliminarProvedor extends HttpServlet {
    
    protected void doGet(HttpServletRequest resquest,HttpServletResponse response) throws ServletException, IOException{
        //Indica el tipo de salida en HTML
        response.setContentType("text/html;charset=UTF-8");
        //Para poder escribir en el HTML
        PrintWriter out = response.getWriter();
        try{
            LNProvedores logica = new LNProvedores();
            //Parametro de la Query String
            String id = resquest.getParameter("idProvedor");
            int codigo = Integer.parseInt(id);
            Provedores cliente = new Provedores();
            cliente.setId(codigo);
            int resultado = logica.Eliminar(cliente);
            String mensaje = logica.getMensaje();
            //Cdificacion de caracteres para mostrar en el HTML
            mensaje = URLEncoder.encode(mensaje, "UTF-8");
            //Redireccionamos la padina frmListarClientes
            //y enviamos por parametro mensaje
            response.sendRedirect("frmListarProvedores.jsp?mensajeEliminarCliente="+mensaje+"&resultado="+resultado);
                        
        }catch(Exception e){
            out.print(e.getMessage());
        }
    }//Fin de doGet
    
}//Fin de la clase eliminar
