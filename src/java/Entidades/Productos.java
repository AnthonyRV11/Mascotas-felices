package Entidades;

//Anthony Rodriguez Valverde 18/08/2023
public class Productos {

    //Atributos
    int id;
    private String nombre;
    private double precio_Compra;
    private double precio_Venta;
    private int cantidad;
    
    //Constructores
    public Productos(int id, String nombre, double precio_Compra, double precio_Venta, int cantidad) {
        this.id = id;
        this.nombre = nombre;
        this.precio_Compra = precio_Compra;
        this.precio_Venta = precio_Venta;
        this.cantidad = cantidad;
    }
     
    public Productos() {
        this.id = 0;
        this.nombre = "";
        this.precio_Compra = 0.0;
        this.precio_Venta = 0.0;
        this.cantidad = 0;
    }
    
    //Metodos de acceso
    //GETTER
     public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public double getPrecio_Compra() {
        return precio_Compra;
    }

    public double getPrecio_Venta() {
        return precio_Venta;
    }

    public int getCantidad() {
        return cantidad;
    }
    
    //SETTER
    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setPrecio_Compra(double precio_Compra) {
        this.precio_Compra = precio_Compra;
    }

    public void setPrecio_Venta(double precio_Venta) {
        this.precio_Venta = precio_Venta;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
}//Fin de la clase productos
