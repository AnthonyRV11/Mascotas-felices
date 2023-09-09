package Logica;

//Anthony Rodriguez Valverde 09/09/2023

import AccesoDatos.ADDetalleCompra;
import Entidades.DetalleFacturaCompra;
import java.util.ArrayList;
import java.util.List;

public class LNDetalleFactura {
    //Atributos
    private String _mensaje;
    
    public String getMensaje() {
        return _mensaje;
    }
    
     //llamar insertar de acceso a datos
    public int InsertarCliente(DetalleFacturaCompra cliente) throws Exception{
        int id=-1;
        ADDetalleCompra adcliente;
        try {
            adcliente= new ADDetalleCompra();
            id=adcliente.Ingresar(cliente);
            _mensaje=adcliente.getMensaje();
        } catch (Exception ex) {
            throw ex;
        }
        return id;
    }//Fin Insertar 
    
    public List<DetalleFacturaCompra> Listar(String condicion) throws Exception{
        List<DetalleFacturaCompra> resultado = new ArrayList();
        ADDetalleCompra adcliente;
        try {
            adcliente=new ADDetalleCompra();
           resultado = adcliente.Listar(condicion);
        } catch (Exception e) {
            throw e;
        }
        return resultado;
   }//Listar
    
    //ELIMINAR 
    public int Eliminar(DetalleFacturaCompra cliente) throws Exception{
        ADDetalleCompra adcliente;
        int resultado =-1;
        try {
            adcliente=new ADDetalleCompra();
            resultado=adcliente.Eliminar(cliente);
            _mensaje=adcliente.getMensaje();
        } catch (Exception e) {
            throw e;
        }
        return resultado;
    }//Eliminar 
    
}//Fin de la clase LNDetalleFactura
