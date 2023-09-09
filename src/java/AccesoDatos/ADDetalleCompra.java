package AccesoDatos;

//Anthony Rodriguez Valverde 08/09/2023

import static AccesoDatos.ClaseConexion.getcConnection;
import Entidades.DetalleFacturaCompra;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Types;

public class ADDetalleCompra {
    //Atributos
    private String _mensaje;
    
    //Propiedades
    public String getMensaje(){
        return _mensaje;
    }
    //constructor
    public ADDetalleCompra(){
        _mensaje="";
    }
    
     //listar 
    public List<DetalleFacturaCompra> Listar(String condicion) throws Exception{
        ResultSet rs=null;
        DetalleFacturaCompra cliente;
        List<DetalleFacturaCompra> lista = new ArrayList();
        Connection _conexion=null;
        try {
            //abrir la coneccion
            _conexion= ClaseConexion.getcConnection();
            Statement stm = _conexion.createStatement();
            String sentencia = "SELECT ID_DETALLE_FACTURA_COMPRA,ID_FACTURA,ID_PRODUCTO,CANTIDAD_PRODUCTO,FECHA_VENTA,HORA FROM DETALLE_FACTURA_COMPRA";
            if(!condicion.equals("")){
                sentencia = String.format("%s where %s" , sentencia, condicion);
            }
            rs=stm.executeQuery(sentencia);
            while(rs.next()){
                cliente = new DetalleFacturaCompra(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getDate(5),rs.getTime(6));
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
    public int Ingresar(DetalleFacturaCompra cliente) throws Exception{
        int resultado = -1;
        CallableStatement cs = null;
        Connection _conexion =null;
        
        try {
            _conexion = getcConnection();
            cs = _conexion.prepareCall("{call InsertarDetalleFacturaCompra(?,?,?)}");
            //Parametros de entrada
            cs.setInt(1, cliente.getId_factura());
            cs.setInt(2, cliente.getId_producto());
            cs.setInt(3, cliente.getCantidad());
            //Preparar variables de salida
            //csp.registerOutParameter(1, Types.INTEGER);
            //cs.registerOutParameter(5, Types.VARCHAR);
            resultado = cs.executeUpdate();
            
            //Recuperar parametros de salida
            //_mensaje = cs.getString(5);
        } catch (Exception e) {
            throw e;
        }
        finally{if(!_conexion.equals(null)){
                ClaseConexion.close(_conexion);
            };}
        return resultado;
    }//Metodo para ingresar
    
    //Eliminar
    public int Eliminar(DetalleFacturaCompra cliente) throws Exception {
        CallableStatement CS = null;
        int resultado = 0;
        Connection _conexion = null;
        try{
            _conexion = getcConnection();
            //registrar parametros
            CS = _conexion.prepareCall("{call EliminarDetalleFacturaCompra(?)}");
            CS.setInt(1, cliente.getId_Detalle());
            //Parametros de salida 
            //CS.registerOutParameter(2, Types.VARCHAR);
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
    
}//Fin de la clase ADDetalleCompra
