package mipk;

public class querys {
	
	static public String getInsert(String nick, String password, String email) {
		
		return "INSERT INTO usuarios (nick, password, email) VALUES" +
				"('" + nick + "', " + "'" + password + "', " + "'" + email + "')";
		
		//return "DELETE FROM bbdd_project`.`usuarios` WHERE  `id_usuario'=104";
	}
	
	
	static public String getUpdate(String nuevaDesc, String nuevaVelocidad, String idNivel) {
			
			
			return "UPDATE niveles SET descripcion='" + nuevaDesc +"', velocidad=" + nuevaVelocidad + " WHERE id_nivel=" + idNivel +"";
			//return "UPDATE niveles SET descripcion = 'FUNCIONANDO', velocidad = 80 WHERE id_nivel=1";
					
			
		}
}
