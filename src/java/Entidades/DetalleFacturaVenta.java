package Entidades;

//Anthony Rodriguez Valverde 23/08/2023

import java.sql.Date;
import java.sql.Time;

public class DetalleFacturaVenta {
    //Atributos
    private int id_Detalle;
    private int id_factura;
    private int id_producto;
    private int id_cita;
    private int cantidad;
    private Date fechaVenta;
    private Time Venta;
    
    //Constructores
    public DetalleFacturaVenta(int id_Detalle, int id_factura, int id_producto, int id_cita, int cantidad, Date fechaVenta, Time Venta) {
        this.id_Detalle = id_Detalle;
        this.id_factura = id_factura;
        this.id_producto = id_producto;
        this.id_cita = id_cita;
        this.cantidad = cantidad;
        this.fechaVenta = fechaVenta;
        this.Venta = Venta;
    }
    
    public DetalleFacturaVenta() {
        this.id_Detalle = 0;
        this.id_factura = 0;
        this.id_producto = 0;
        this.id_cita = 0;
        this.cantidad = 0;
        this.fechaVenta = null;
        this.Venta = null;
    }
    
    //Metodos de acceso
    public int getId_Detalle() {
        return id_Detalle;
    }

    public int getId_factura() {
        return id_factura;
    }

    public int getId_producto() {
        return id_producto;
    }

    public int getId_cita() {
        return id_cita;
    }

    public int getCantidad() {
        return cantidad;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public Time getVenta() {
        return Venta;
    }

     public void setId_Detalle(int id_Detalle) {
        this.id_Detalle = id_Detalle;
    }

    public void setId_factura(int id_factura) {
        this.id_factura = id_factura;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public void setId_cita(int id_cita) {
        this.id_cita = id_cita;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public void setVenta(Time Venta) {
        this.Venta = Venta;
    }
    
    
}//Fin del detalle factura compra
