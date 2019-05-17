function ejecutar(){
	
	//Recuperamos el valor del select
	var seleccion = document.getElementById('seleccion').value;
	//Recuperamos el destino
	var destino = document.getElementById('resultado');
	
	//Dependiendo de la opcion selecionada, ejecutaremos una query u otra
	switch(seleccion){
		
	case "usuarios": 
		destino.innerHTML = "Ha seleccionado la tabla usuarios";
	break;
	
	case "personajes": 
		destino.innerHTML = "Ha seleccionado la tabla personajes";
	break;
	
	default: 
		alert("NO HA SELECIONADO NINGUNA OPCION!!!");
	break;
	
	}
}