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
            String sentencia = "SELECT F.ID_FACTURA, F.ID_CLIENTE, CONCAT(C.NOMBRE, ' ', C.APELLIDO1, ' ', C.APELLIDO2) AS NOMBRE_CLIENTE, F.TOTAL_PAGO, F.                                             FECHA_VENTA\n" +
                               "FROM FACTURA_VENTA F\n" +
                               "INNER JOIN CLIENTES C ON F.ID_CLIENTE = C.ID_CLIENTE\n" +
                               "WHERE F.TOTAL_PAGO IS NOT NULL AND F.TOTAL_PAGO <> 0;";
            if(!condicion.equals("")){
                sentencia = String.format("%s where %s" , sentencia, condicion);
            }
            rs=stm.executeQuery(sentencia);
            while(rs.next()){
                cliente = new FacturaVenta(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getDouble(4),rs.getDate(5));
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
