package objetoscrm;

public class query {
	
	private int id;
	private int id2;
	private int id3;
	private String string1;
	private String string2;
	private String string3;
	private String string4;

	public query(String id, String id2, String id3, String string1, String string2, String string3) {
		this.id = Integer.parseInt(id);
		this.id2 = Integer.parseInt(id2);
		this.id3 = Integer.parseInt(id3);
		this.string1 = string1;
		this.string2 = string2;
		this.string3 = string3;
		
	}
	
	
	public query(String string1, String string2) {
		this.string1 = string1;
		this.string2 = string2;
		
	}
	
	public query(String string1, String string2, String string3) {
		this.string1 = string1;
		this.string2 = string2;
		this.string3 = string3;
	}
	
	public query(String string1, String string2, String string3, String string4) {
		this.string1 = string1;
		this.string2 = string2;
		this.string3 = string3;
		this.string4 = string4;
	}


	public int getId() {
		return id;
	}
	
	public int getId2() {
		return id2;
	}
	
	public int getId3() {
		return id3;
	}
	
	public String getString1() {
		return string1;
	}
	
	public String getString2() {
		return string2;
	}
	
	public String getString3() {
		return string3;
	}
	
	public String getString4() {
		return string4;
	}
	
}