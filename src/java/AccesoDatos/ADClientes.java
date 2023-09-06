
package AccesoDatos;

import Entidades.Clientes;
import java.sql.*;
import java.util.*;

//importar los metodos de la ClaseConesion
//import static AccesoDatos.ClaseConexion.getcConnection;

public class ADClientes {
    //Atributos
    private String _mensaje;
    
    //Propiedades
    public String getMensaje(){
        return _mensaje;
    }
    //constructor
    public ADClientes(){
        _mensaje="";
    }
    
   //listar Clientes
    public List<Clientes> ListarClientes_List(String condicion) throws Exception{
        ResultSet rs=null;
        Clientes cliente;
        List<Clientes> lista = new ArrayList();
        Connection _conexion=null;
        try {
            //abrir la coneccion
            _conexion=ClaseConexion.getcConnection();
            Statement stm = _conexion.createStatement();
            String sentencia = "SELECT ID_CLIENTE,NOMBRE,APELLIDO1,APELLIDO2,CEDULA,TELEFONO,CORREO FROM CLIENTES";
            if(!condicion.equals("")){
                sentencia = String.format("%s where %s" , sentencia, condicion);
            }
            rs=stm.executeQuery(sentencia);
            while(rs.next()){
                cliente = new Clientes(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getBoolean(8));
                lista.add(cliente);
            }
        } catch (Exception ex) {throw ex;}
        finally{
            if(!_conexion.equals(null)){
                ClaseConexion.close(_conexion);
            }
        }
        return lista;
    }//ListarClientes_List

    
    
    
    
    
}//Fin de la clase ADClientes

