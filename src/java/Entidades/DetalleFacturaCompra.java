package Entidades;

//Anthony Rodriguez Valverde 23/08/2023

import java.sql.Date;
import java.sql.Time;

public class DetalleFacturaCompra {
    
    //Atributos
    private int id_Detalle;
    private int id_factura;
    private int id_producto;
    private int cantidad;
    private Date fechaVenta;
    private Time Venta;
    
    //Constructores
    public DetalleFacturaCompra(int id_Detalle, int id_factura, int id_producto, int cantidad, Date fechaVenta, Time Venta) {
        this.id_Detalle = id_Detalle;
        this.id_factura = id_factura;
        this.id_producto = id_producto;
        this.cantidad = cantidad;
        this.fechaVenta = fechaVenta;
        this.Venta = Venta;
    }

    public DetalleFacturaCompra() {
        this.id_Detalle = 0;
        this.id_factura = 0;
        this.id_producto = 0;
        this.cantidad = 0;
        this.fechaVenta = null;
        this.Venta = null;
    }
    
    //Metodos de acceso
public int getId_Detalle() {
        return id_Detalle;
    }

    public void setId_Detalle(int id_Detalle) {
        this.id_Detalle = id_Detalle;
    }

    public int getId_factura() {
        return id_factura;
    }

    public void setId_factura(int id_factura) {
        this.id_factura = id_factura;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public Time getVenta() {
        return Venta;
    }

    public void setVenta(Time Venta) {
        this.Venta = Venta;
    }

    
}//Fin de la clase DetalleFacturaCompra
