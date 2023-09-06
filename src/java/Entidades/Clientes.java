package Entidades;

//Anthony Rodriguez Valverde 18/08/2023
public class Clientes extends Persona{

    //Hereda todos los atributos de la clase persona
    private boolean existe;
    
    //Constructores
    public Clientes(int id, String nombre, String apellido1, String apellido2, String cedula, String telefono, String correo,boolean existe) {
        super(id, nombre, apellido1, apellido2, cedula, telefono, correo);
        this.existe = existe;
    }
    
     public Clientes(int id, String nombre, String apellido1, String apellido2, String cedula, String telefono, String correo) {
        super(id, nombre, apellido1, apellido2, cedula, telefono, correo);
    }

    public Clientes(){
    }
    
    //Los metodos abstractos se implementan en la capa acceso a datos
     public boolean isExiste() {
        return existe;
    }
     
    public void setExiste(boolean existe) {
        this.existe = existe;
    }
     
}
