package Entidades;

//Anthony Rodriguez Valverde 24/08/2023
public class FacturaVenta {
     //Atributos
    int id_factura;
    int id_cliente;
    double total_pagar;
    
    //Constructores
    public FacturaVenta(int id_factura, int id_cliente, double total_pagar) {
        this.id_factura = id_factura;
        this.id_cliente = id_cliente;
        this.total_pagar = total_pagar;
    }
    
    public FacturaVenta() {
        this.id_factura = 0;
        this.id_cliente = 0;
        this.total_pagar = 0.0;
    }
    
    //Metodos de acceso
    //GETTER
    public int getId_factura() {
        return id_factura;
    }

    public int getId_Cliente() {
        return id_cliente;
    }

    public double getTotal_pagar() {
        return total_pagar;
    }
    
    //SETTER
    public void setId_factura(int id_factura) {
        this.id_factura = id_factura;
    }

    public void setId_Cliente(int id_provedor) {
        this.id_cliente = id_provedor;
    }

    public void setTotal_pagar(double total_pagar) {
        this.total_pagar = total_pagar;
    }

    
    
}//Fin de la clase
