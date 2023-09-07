package Logica;

//Anthony Rodriguez Valverde 06/09/2023
import AccesoDatos.ADProvedores;
import Entidades.Provedores;
import java.util.ArrayList;
import java.util.List;
public class LNProvedores {
    //Atributos
    private String _mensaje;
    
    public String getMensaje() {
        return _mensaje;
    }
    
     //llamar insertar de acceso a datos
    public int Insertar(Provedores cliente) throws Exception{
        int id=-1;
        ADProvedores adcliente;
        try {
            adcliente= new ADProvedores();
            id=adcliente.Ingresar(cliente);
            _mensaje=adcliente.getMensaje();
        } catch (Exception ex) {
            throw ex;
        }
        return id;
    }//Fin Insertar
    
    public List<Provedores> Listar(String condicion) throws Exception{
        List<Provedores> resultado = new ArrayList();
        ADProvedores adcliente;
        try {
            adcliente=new ADProvedores();
           resultado = adcliente.Listar(condicion);
        } catch (Exception e) {
            throw e;
        }
        return resultado;
   }//Listar
    
   //obtener 
    public Provedores Obtener(String condicion) throws Exception{
        Provedores cliente;
        ADProvedores adcliente;
        try {
            adcliente=new ADProvedores();
            cliente=adcliente.Obtener(condicion);
            if(cliente.isExiste()){
                _mensaje="Provedor Recuperado";
            }else{
                _mensaje="Provedor no existe en la BD";
            }
        } catch (Exception e) {
            throw e;
        }
        return cliente;
    }//Obtener  
    
      //Modificar
    public int Modificar(Provedores cliente) throws Exception{
       int id=-1;
        ADProvedores adcliente;
        try {
            adcliente= new ADProvedores();
            id=adcliente.Ingresar(cliente);
            _mensaje=adcliente.getMensaje();
        } catch (Exception ex) {
            throw ex;
        }
        return id;
    }//Modificar
    
    //ELIMINAR
    public int Eliminar(Provedores cliente) throws Exception{
        ADProvedores adcliente;
        int resultado =-1;
        try {
            adcliente=new ADProvedores();
            resultado=adcliente.Eliminar(cliente);
            _mensaje=adcliente.getMensaje();
        } catch (Exception e) {
            throw e;
        }
        return resultado;
    }//Eliminar
    
}//Fin de la clase LNProvedores
