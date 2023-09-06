
package AccesoDatos;

import static AccesoDatos.ClaseConexion.getcConnection;
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
    public List<Clientes> ListarClientes(String condicion) throws Exception{
        ResultSet rs=null;
        Clientes cliente;
        List<Clientes> lista = new ArrayList();
        Connection _conexion=null;
        try {
            //abrir la coneccion
            _conexion= ClaseConexion.getcConnection();
            Statement stm = _conexion.createStatement();
            String sentencia = "SELECT ID_CLIENTE,NOMBRE,APELLIDO1,APELLIDO2,CEDULA,TELEFONO,CORREO FROM CLIENTES";
            if(!condicion.equals("")){
                sentencia = String.format("%s where %s" , sentencia, condicion);
            }
            rs=stm.executeQuery(sentencia);
            while(rs.next()){
                cliente = new Clientes(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
                lista.add(cliente);
            }
        } catch (Exception ex) {throw ex;}
        finally{
            if(!_conexion.equals(null)){
                ClaseConexion.close(_conexion);
            }
        }
        return lista;
    }//ListarClientes

    //Metodo para ingresar un cliente nuevo
    public int ingresarCliente_SP(Clientes cliente) throws Exception{
        int resultado = -1;
        CallableStatement cs = null;
        Connection _conexion =null;
        
        try {
            _conexion = getcConnection();
            cs = _conexion.prepareCall("{call InsertarActualizarCliente(?,?,?,?,?,?,?,?)}");
            //Parametros de entrada
            cs.setInt(1, cliente.getId());
            cs.setString(2, cliente.getNombre());
            cs.setString(3, cliente.getApellido1());
            cs.setString(4, cliente.getApellido2());
            cs.setString(5, cliente.getCedula());
            cs.setString(6, cliente.getTelefono());
            cs.setString(7, cliente.getCorreo());
            cs.setString(8, "");
            
            //Preparar variables de salida
            //csp.registerOutParameter(1, Types.INTEGER);
            cs.registerOutParameter(8, Types.VARCHAR);
            resultado = cs.executeUpdate();
            
            //Recuperar parametros de salida
            _mensaje = cs.getString(8);
        } catch (Exception e) {
            throw e;
        }
        finally{if(!_conexion.equals(null)){
                ClaseConexion.close(_conexion);
            };}
        return resultado;
    }//Metodo para ingresar cliente
    
    //Obtener un Cliente
    public Clientes ObtenerCliente(String condicion) throws SQLException, Exception {
    ResultSet rs = null;
    Clientes cliente = null;
    List<Clientes> lista = new ArrayList<>();
    Connection _conexion = null;
    try {
        //abrir la coneccion
        _conexion = ClaseConexion.getcConnection();
        Statement stm = _conexion.createStatement();
        String sentencia = "SELECT ID_CLIENTE,NOMBRE,APELLIDO1,APELLIDO2,CEDULA,TELEFONO,CORREO FROM CLIENTES";
        if (!condicion.equals("")) {
            sentencia = String.format("%s where %s", sentencia, condicion);
        }
        rs = stm.executeQuery(sentencia);
        while (rs.next()) {
            cliente = new Clientes(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
            lista.add(cliente);
        }
    } catch (Exception ex) {
        throw ex;
    } finally {
        if (_conexion != null) {
            ClaseConexion.close(_conexion);
        }
    }
    return cliente;
    }
    
    //Metodo para actualizar un cliente nuevo
    public int actualizarCliente_SP(Clientes cliente) throws Exception{
       int resultado = -1;
       Connection _conexion = null;
        try {
            _conexion = getcConnection();
            CallableStatement csp = _conexion.prepareCall("{call ActualizarCliente(?,?,?,?,?,?,?,?)}");
            //Parametros de entrada
            csp.setInt(1, cliente.getId());
            csp.setString(2, cliente.getNombre());
            csp.setString(3, cliente.getApellido1());
            csp.setString(4, cliente.getApellido2());
            csp.setString(5, cliente.getCedula());
            csp.setString(6, cliente.getTelefono());
            csp.setString(7, cliente.getCorreo());
            csp.setString(8, "");
            
            //Preparar variables de salida
            //csp.registerOutParameter(1, Types.INTEGER);
            csp.registerOutParameter(8, Types.VARCHAR);
            resultado = csp.executeUpdate();
            
            //Recuperar parametros de salida
            _mensaje = csp.getString(8);
        } catch (Exception e) {
            throw e;
        }
        finally{
        if (_conexion != null) {
            ClaseConexion.close(_conexion);
        }}
        return resultado;
    }//Metodo para actualizar cliente
    
    //EliminarCliente Cliente
    public int EliminarCliente(Clientes cliente) throws Exception {
        CallableStatement CS = null;
        int resultado = 0;
        Connection _conexion = null;
        try{
            _conexion = getcConnection();
            //registrar parametros
            CS = _conexion.prepareCall("{call EliminarCliente(?,?)}");
            CS.setInt(1, cliente.getId());
            CS.setString(2, _mensaje);
            //Parametros de salida 
            CS.registerOutParameter(2, Types.VARCHAR);
            resultado = CS.executeUpdate();
            //Leer parametro de salida
            _mensaje = CS.getString(2);
            
        }catch(Exception x){
        }   
        finally{
            if(_conexion !=null){
                ClaseConexion.close(_conexion);
            }
        }
        return resultado;
    }
    
    
}//Fin de la clase ADClientes

