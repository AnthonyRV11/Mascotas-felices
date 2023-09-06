package Entidades;

//Anthony Rodriguez Valverde 18/08/2023
public class Persona {

    //Atributos
    int id;
    private String nombre;
    private String apellido1;
    private String apellido2;
    private String cedula;
    private String telefono;
    private String correo;
    
    
    //Constructores
     public Persona(int id, String nombre, String apellido1, String apellido2, String cedula, String telefono, String correo) {
        this.id = id;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.cedula = cedula;
        this.telefono = telefono;
        this.correo = correo;
    }
     
    public Persona() {
        this.id = 0;
        this.nombre = "";
        this.apellido1 = "";
        this.apellido2 = "";
        this.cedula = "";
        this.telefono = "";
        this.correo = "";
    } 
    
    //Metodos de acceso
    
    //Getter
    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido1() {
        return apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public String getCedula() {
        return cedula;
    }

    public String getTelefono() {
        return telefono;
    }

   
    public String getCorreo() {
        return correo;
    }
    
    
    //Setter
        public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
    
}
