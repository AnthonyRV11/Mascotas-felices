package AccesoDatos;

//Anthony Rodriguez Valverde 07/09/2023

import Entidades.Productos;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ADProductos {
      //Atributos
    private String _mensaje;
    
    //Propiedades
    public String getMensaje(){
        return _mensaje;
    }
    //constructor
    public ADProductos(){
        _mensaje="";
    }
    
    //listar 
    public List<Productos> Listar(String condicion) throws Exception{
        ResultSet rs=null;
        Productos cliente;
        List<Productos> lista = new ArrayList();
        Connection _conexion=null;
        try {
            //abrir la coneccion
            _conexion= ClaseConexion.getcConnection();
            Statement stm = _conexion.createStatement();
            String sentencia = "SELECT ID_PRODUCTO,NOMBRE,PRECIO_COMPRA,PRECIO_VENTA,CANTIDAD FROM PRODUCTOS";
            if(!condicion.equals("")){
                sentencia = String.format("%s where %s" , sentencia, condicion);
            }
            rs=stm.executeQuery(sentencia);
            while(rs.next()){
                cliente = new Productos(rs.getInt(1),rs.getString(2),rs.getDouble(3),rs.getDouble(4),rs.getInt(5));
                lista.add(cliente);
            }
        } catch (Exception ex) {throw ex;}
        finally{
            if(!_conexion.equals(null)){
                ClaseConexion.close(_conexion);
            }
        }
        return lista;
    }//Listar
    
}//Fin de la clase ADProductos
