package AccesoDatos;

//Anthony Rodriguez Valverde 08/09/2023
import static AccesoDatos.ClaseConexion.getcConnection;
import Entidades.FacturaVenta;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class ADFacturaVenta {
      //Atributos
    private String _mensaje;
    
    //Propiedades
    public String getMensaje(){
        return _mensaje;
    }
    //constructor
    public ADFacturaVenta(){
        _mensaje="";
    }
    
    //Metodo para ingresar 
    public int Ingresar(FacturaVenta cliente) throws Exception{
        int resultado = -1;
        CallableStatement cs = null;
        Connection _conexion =null;
        
        try {
            _conexion = getcConnection();
            cs = _conexion.prepareCall("{call CrearFacturaVenta(?,?)}");
            //Parametros de entrada
            cs.setInt(1, cliente.getId_Cliente());
            cs.setInt(2, 0);
            
            //Preparar variables de salida
            //csp.registerOutParameter(1, Types.INTEGER);
            cs.registerOutParameter(2, Types.INTEGER);
            resultado = cs.executeUpdate();
            
            //Recuperar parametros de salida
            resultado = cs.getInt(2);
            
        } catch (Exception e) {
            throw e;
        }
        finally{if(!_conexion.equals(null)){
                ClaseConexion.close(_conexion);
            };}
        return resultado;
    }//Metodo para ingresar
    
    //listar 
    public List<FacturaVenta> Listar(String condicion) throws Exception{
        ResultSet rs=null;
        FacturaVenta cliente;
        List<FacturaVenta> lista = new ArrayList();
        Connection _conexion=null;
        try {
            //abrir la coneccion
            _conexion= ClaseConexion.getcConnection();
            Statement stm = _conexion.createStatement();
            String sentencia = "SELECT ID_FACTURA,ID_CLIENTE,TOTAL_PAGO,FECHA_VENTA FROM FACTURA_VENTA";
            if(!condicion.equals("")){
                sentencia = String.format("%s where %s" , sentencia, condicion);
            }
            rs=stm.executeQuery(sentencia);
            while(rs.next()){
                cliente = new FacturaVenta(rs.getInt(1),rs.getInt(2),rs.getDouble(3),rs.getDate(4));
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
    
    
}//Fin de la clase ADFacturaVenta
