package Logica;

//Anthony Rodriguez Valverde 07/09/2023
import AccesoDatos.ADProductos;
import Entidades.Productos;
import java.util.ArrayList;
import java.util.List;
public class LNProductos {
    //Atributos
    private String _mensaje;
    
    public String getMensaje() {
        return _mensaje;
    }
    
     public List<Productos> Listar(String condicion) throws Exception{
        List<Productos> resultado = new ArrayList();
        ADProductos adcliente;
        try {
            adcliente=new ADProductos();
           resultado = adcliente.Listar(condicion);
        } catch (Exception e) {
            throw e;
        }
        return resultado;
   }//Listar
    
    
}//LNProductos
