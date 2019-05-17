package objetoscrm;

public class niveles {
	
	private int id_nivel;
	private String descripcion;
	private int velocidad;

	public niveles(int id_nivel, String descripcion, int velocidad) {
		this.id_nivel= id_nivel;
		this.descripcion = descripcion;
		this.velocidad = velocidad;
		
	}
	
	public niveles(String id_nivel, String descripcion, String velocidad) {
		this.id_nivel = Integer.parseInt(id_nivel);
		this.descripcion = descripcion;
		this.velocidad = Integer.parseInt(velocidad);
	}


	public int getIdNivel() {
		return id_nivel;
	}



	public String getDescripcion() {
		return descripcion;
	}
	
	public int getVelocidad() {
		return velocidad;
	}


	
}

