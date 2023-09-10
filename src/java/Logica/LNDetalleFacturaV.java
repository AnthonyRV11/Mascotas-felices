package Logica;

//Anthony Rodriguez Valverde 09/09/2023

import AccesoDatos.ADDetalleVenta;
import Entidades.DetalleFacturaVenta;
import java.util.ArrayList;
import java.util.List;

public class LNDetalleFacturaV {
    //Atributos
    private String _mensaje;
    
    public String getMensaje() {
        return _mensaje;
    }
    
     //llamar insertar de acceso a datos
    public int Insertar(DetalleFacturaVenta cliente) throws Exception{
        int id=-1;
        ADDetalleVenta adcliente;
        try {
            adcliente= new ADDetalleVenta();
            id=adcliente.Ingresar(cliente);
            _mensaje=adcliente.getMensaje();
        } catch (Exception ex) {
            throw ex;
        }
        return id;
    }//Fin Insertar 
    
    public List<DetalleFacturaVenta> Listar(String condicion) throws Exception{
        List<DetalleFacturaVenta> resultado = new ArrayList();
        ADDetalleVenta adcliente;
        try {
            adcliente=new ADDetalleVenta();
           resultado = adcliente.Listar(condicion);
        } catch (Exception e) {
            throw e;
        }
        return resultado;
   }//Listar
    
   //ELIMINAR 
    public int Eliminar(DetalleFacturaVenta cliente) throws Exception{
        ADDetalleVenta adcliente;
        int resultado =-1;
        try {
            adcliente=new ADDetalleVenta();
            resultado=adcliente.Eliminar(cliente);
            _mensaje=adcliente.getMensaje();
        } catch (Exception e) {
            throw e;
        }
        return resultado;
    }//Eliminar  
    
     //Precio
    public double Precio(String condicion) throws Exception{
        ADDetalleVenta adcliente;
        double resultado =-1;
        try {
            adcliente=new ADDetalleVenta();
            resultado=adcliente.Precio(condicion);
            _mensaje=adcliente.getMensaje();
        } catch (Exception e) {
            throw e;
        }
        return resultado;
    }//Precio 
    
}//Fin de la clase LNDetalleFacturaV
