object springfield
{
	var property vientos = 10
	var property riqueza = 0.9
	var property centrales = #{burns,exBosque,elSuspiro}
	
	method centralesContaminantes(){
		return centrales.filter({central => central.esContaminante()})
	}
}

object burns{
	var property varillas = 10
	
	method produccionEnergetica(ciudad){
		return 0.1 * varillas
	}
	
	method esContaminante(){
		return varillas > 20
	}
}

object exBosque{
	var property capacidad = 20
	
	method produccionEnergetica(ciudad){
		return 0.5 + capacidad*ciudad.riqueza()
	}
	
	method esContaminante(){
		return true
	}
}

object elSuspiro{
	var turbinas = [turbinaCopada]
	var property produccionPorTurbina = 0.2
	
	method produccionEnergetica(ciudad){
		return turbinas.sum({turbina => turbina.produccionEnergetica()})
	}
	
	method esContaminante(){
		return false
	}
}

object turbinaCopada{
	method produccionEnergetica(){
		return 0.2
	}
}

