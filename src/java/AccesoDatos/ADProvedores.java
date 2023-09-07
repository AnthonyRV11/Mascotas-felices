package AccesoDatos;

//Anthony Rodriguez Valverde 06/09/2023
import static AccesoDatos.ClaseConexion.getcConnection;
import Entidades.Provedores;
import java.sql.*;
import java.util.*;
public class ADProvedores {
    //Atributos
    private String _mensaje;
    
    //Propiedades
    public String getMensaje(){
        return _mensaje;
    }
    //constructor
    public ADProvedores(){
        _mensaje="";
    }    
    
    //listar 
    public List<Provedores> Listar(String condicion) throws Exception{
        ResultSet rs=null;
        Provedores cliente;
        List<Provedores> lista = new ArrayList();
        Connection _conexion=null;
        try {
            //abrir la coneccion
            _conexion= ClaseConexion.getcConnection();
            Statement stm = _conexion.createStatement();
            String sentencia = "SELECT ID_PROVEEDOR,NOMBRE,TELEFONO,CORREO FROM PROVEEDORES";
            if(!condicion.equals("")){
                sentencia = String.format("%s where %s" , sentencia, condicion);
            }
            rs=stm.executeQuery(sentencia);
            while(rs.next()){
                cliente = new Provedores(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
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
    
    //Metodo para ingresar 
    public int Ingresar(Provedores cliente) throws Exception{
        int resultado = -1;
        CallableStatement cs = null;
        Connection _conexion =null;
        
        try {
            _conexion = getcConnection();
            cs = _conexion.prepareCall("{call InsertarActualizarProveedor(?,?,?,?,?)}");
            //Parametros de entrada
            cs.setInt(1, cliente.getId());
            cs.setString(2, cliente.getNombre());
            cs.setString(3, cliente.getTelefono());
            cs.setString(4, cliente.getCorreo());
            cs.setString(5, "");
            
            //Preparar variables de salida
            //csp.registerOutParameter(1, Types.INTEGER);
            cs.registerOutParameter(5, Types.VARCHAR);
            resultado = cs.executeUpdate();
            
            //Recuperar parametros de salida
            _mensaje = cs.getString(5);
        } catch (Exception e) {
            throw e;
        }
        finally{if(!_conexion.equals(null)){
                ClaseConexion.close(_conexion);
            };}
        return resultado;
    }//Metodo para ingresar
    
    //Eliminar
    public int Eliminar(Provedores cliente) throws Exception {
        CallableStatement CS = null;
        int resultado = 0;
        Connection _conexion = null;
        try{
            _conexion = getcConnection();
            //registrar parametros
            CS = _conexion.prepareCall("{call EliminarProveedor(?,?)}");
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
    
       //Obtener
    public Provedores Obtener(String condicion) throws SQLException, Exception {
    ResultSet rs = null;
    Provedores cliente = null;
    List<Provedores> lista = new ArrayList<>();
    Connection _conexion = null;
    try {
        //abrir la coneccion
        _conexion = ClaseConexion.getcConnection();
        Statement stm = _conexion.createStatement();
        String sentencia = "SELECT ID_PROVEEDOR,NOMBRE,TELEFONO,CORREO FROM PROVEEDORES";
        if (!condicion.equals("")) {
            sentencia = String.format("%s where %s", sentencia, condicion);
        }
        rs = stm.executeQuery(sentencia);
        while (rs.next()) {
            cliente = new Provedores(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
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
    
}//Fin de la clase DAProvedores
