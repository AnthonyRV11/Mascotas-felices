package Logica;

//Anthony Rodriguez Valverde 06/09/2023

import AccesoDatos.ADClientes;
import Entidades.Clientes;
import java.util.ArrayList;
import java.util.List;
public class LNClientes {
    //Atributos
    private String _mensaje;
    
    public String getMensaje() {
        return _mensaje;
    }
    
     //llamar insertar de acceso a datos
    public int InsertarCliente(Clientes cliente) throws Exception{
        int id=-1;
        ADClientes adcliente;
        try {
            adcliente= new ADClientes();
            id=adcliente.ingresarCliente_SP(cliente);
            _mensaje=adcliente.getMensaje();
        } catch (Exception ex) {
            throw ex;
        }
        return id;
    }//Fin Insertar Cliente
    
    public List<Clientes> ListarClientes_List(String condicion) throws Exception{
        List<Clientes> resultado = new ArrayList();
        ADClientes adcliente;
        try {
            adcliente=new ADClientes();
           resultado = adcliente.ListarClientes(condicion);
        } catch (Exception e) {
            throw e;
        }
        return resultado;
   }//ListarClientes_Rs
    
    //obtener un cliente
    public Clientes ObtenerCliente(String condicion) throws Exception{
        Clientes cliente;
        ADClientes adcliente;
        try {
            adcliente=new ADClientes();
            cliente=adcliente.ObtenerCliente(condicion);
            if(cliente.isExiste()){
                _mensaje="Cliente Recuperado";
            }else{
                _mensaje="Cliente no existe en la BD";
            }
        } catch (Exception e) {
            throw e;
        }
        return cliente;
    }//ObtenerCliente 
    
     //Modificar un cliente
    public int ModificarCliente(Clientes cliente) throws Exception{
       int id=-1;
        ADClientes adcliente;
        try {
            adcliente= new ADClientes();
            id=adcliente.ingresarCliente_SP(cliente);
            _mensaje=adcliente.getMensaje();
        } catch (Exception ex) {
            throw ex;
        }
        return id;
    }//ModificarCliente
    
    //ELIMINAR un cliente
    public int EliminarCliente(Clientes cliente) throws Exception{
        ADClientes adcliente;
        int resultado =-1;
        try {
            adcliente=new ADClientes();
            resultado=adcliente.EliminarCliente(cliente);
            _mensaje=adcliente.getMensaje();
        } catch (Exception e) {
            throw e;
        }
        return resultado;
    }//EliminarCliente
    
}//Fin de la clase LNClientes
