package Entidades;

//Anthony Rodriguez Valverde 20/08/2023
public class Provedores {

    //Atributos
    private int id;
    private String nombre;
    private String telefono;
    private String correo;
    private boolean existe;
    
    //Constructores
     public Provedores(int id, String nombre, String telefono, String correo, boolean existe) {
        this.id = id;
        this.nombre = nombre;
        this.telefono = telefono;
        this.correo = correo;
        this.existe = existe;
    }
     
    //Constructores
    public Provedores(int id, String nombre, String telefono, String correo) {
        this.id = id;
        this.nombre = nombre;
        this.telefono = telefono;
        this.correo = correo;
    }
     
    public Provedores() {
        this.id = 0;
        this.nombre = "";
        this.telefono = "";
        this.correo = "";
        this.existe = false;
    } 
    
    //Metodos de acceso
    //GETTER
    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public boolean isExiste() {
        return existe;
    }
    
    //SETTER
      public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setExiste(boolean existe) {
        this.existe = existe;
    }
    
}//Fin de la clase provedores
