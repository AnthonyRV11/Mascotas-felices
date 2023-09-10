package Logica;

//Anthony Rodriguez Valverde 08/09/2023

import AccesoDatos.ADFacturaVenta;
import Entidades.FacturaVenta;
import java.util.ArrayList;
import java.util.List;
public class LNFacturaVenta {
    //Atributos
    private String _mensaje;
    
    public String getMensaje() {
        return _mensaje;
    }
    
    //llamar insertar de acceso a datos
    public int Insertar(FacturaVenta cliente) throws Exception{
        int id=-1;
        ADFacturaVenta adcliente;
        try {
            adcliente= new ADFacturaVenta();
            id=adcliente.Ingresar(cliente);
            _mensaje=adcliente.getMensaje();
        } catch (Exception ex) {
            throw ex;
        }
        return id;
    }//Fin Insertar 
    
    public List<FacturaVenta> Listar(String condicion) throws Exception{
        List<FacturaVenta> resultado = new ArrayList();
        ADFacturaVenta adcliente;
        try {
            adcliente=new ADFacturaVenta();
           resultado = adcliente.Listar(condicion);
        } catch (Exception e) {
            throw e;
        }
        return resultado;
   }//Listar 
    
}//Fin de la clase LNFacturaVenta
