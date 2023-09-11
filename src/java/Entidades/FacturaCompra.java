package Entidades;

//Anthony Rodriguez Valverde 23/08/2023

import java.sql.Date;


public class FacturaCompra {

    //Atributos
    int id_factura;
    int id_provedor;
    double total_pagar;
    Date fecha;
    String nombre;
    
    //Constructores
    public FacturaCompra(int id_factura, int id_provedor, double total_pagar) {
        this.id_factura = id_factura;
        this.id_provedor = id_provedor;
        this.total_pagar = total_pagar;
    }
    
    public FacturaCompra(int id_factura, int id_provedor, double total_pagar,Date fecha) {
        this.id_factura = id_factura;
        this.id_provedor = id_provedor;
        this.total_pagar = total_pagar;
        this.fecha = fecha;
    }
    
    public FacturaCompra(int id_factura, int id_provedor,String nombre ,double total_pagar,Date fecha) {
        this.id_factura = id_factura;
        this.id_provedor = id_provedor;
        this.total_pagar = total_pagar;
        this.fecha = fecha;
        this.nombre = nombre;
    }
    
    public FacturaCompra() {
        this.id_factura = 0;
        this.id_provedor = 0;
        this.total_pagar = 0.0;
    }
    
    //Metodos de acceso
    //GETTER
    public int getId_factura() {
        return id_factura;
    }

    public int getId_provedor() {
        return id_provedor;
    }

    public double getTotal_pagar() {
        return total_pagar;
    }
    
    //SETTER
    public void setId_factura(int id_factura) {
        this.id_factura = id_factura;
    }

    public void setId_provedor(int id_provedor) {
        this.id_provedor = id_provedor;
    }

    public void setTotal_pagar(double total_pagar) {
        this.total_pagar = total_pagar;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}//Fin clase factura compra
