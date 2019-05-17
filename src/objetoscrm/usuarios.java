package objetoscrm;

public class usuarios {
	
	private int id_usuario;
	private String nick;
	private String email;

	public usuarios(int id_usuario, String nick, String email) {
		super();
		this.id_usuario = id_usuario;
		this.nick = nick;
		this.email = email;
	}
	
	public usuarios(String id_usuario, String nick, String email) {
		super();
		this.id_usuario = Integer.parseInt(id_usuario);
		this.nick = nick;
		this.email = email;
	}


	public int getIdUsuario() {
		return id_usuario;
	}

	public void setIdUsuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}

	public String getNick() {
		return nick;
	}

	public void setIdTutor(String nick) {
		this.nick = nick;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}

