package objetoscrm;

public class personajes {
	
	private int id_personaje;
	private String nombre;

	public personajes(int id_personaje, String nombre) {
		this.id_personaje= id_personaje;
		this.nombre = nombre;
		
	}
	
	public personajes(String id_personaje, String nombre) {
		this.id_personaje = Integer.parseInt(id_personaje);
		this.nombre = nombre;
	}


	public int getIdPersonaje() {
		return id_personaje;
	}



	public String getNombre() {
		return nombre;
	}


	
}

