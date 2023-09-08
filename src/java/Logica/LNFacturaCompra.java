package Logica;

//Anthony Rodriguez Valverde 08/09/2023

import AccesoDatos.ADFacturaCompra;
import Entidades.FacturaCompra;
import java.util.ArrayList;
import java.util.List;

public class LNFacturaCompra {
     //Atributos
    private String _mensaje;
    
    public String getMensaje() {
        return _mensaje;
    }
    
    //llamar insertar de acceso a datos
    public int Insertar(FacturaCompra cliente) throws Exception{
        int id=-1;
        ADFacturaCompra adcliente;
        try {
            adcliente= new ADFacturaCompra();
            id=adcliente.Ingresar(cliente);
            _mensaje=adcliente.getMensaje();
        } catch (Exception ex) {
            throw ex;
        }
        return id;
    }//Fin Insertar 
    
    public List<FacturaCompra> Listar(String condicion) throws Exception{
        List<FacturaCompra> resultado = new ArrayList();
        ADFacturaCompra adcliente;
        try {
            adcliente=new ADFacturaCompra();
           resultado = adcliente.Listar(condicion);
        } catch (Exception e) {
            throw e;
        }
        return resultado;
   }//Listar 
    
}//Fin de la clase LNFacturaCompra
