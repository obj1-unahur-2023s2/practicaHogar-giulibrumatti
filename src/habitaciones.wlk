import unidadesBase.*
import personas.*

class Habitacion{
	var ocupantes = []
	
	method nivelDeConfort() = 10
	
	method puedeEntrar(unOcupante) = true
	
	method entrar(unaPersona){
		if(self.puedeEntrar(unaPersona)){
			ocupantes.add(unaPersona)
			unaPersona.entrarHabitacion(self)
		}
	}
	method estaOcupada() = ! ocupantes.isEmpty()
	
	method personaMayor() = ocupantes.max({o => o.edad()})
}


class HabitacionGeneral inherits Habitacion{
	
	
}

class Dormitorio inherits Habitacion{
	var duermen = []
	
	override method nivelDeConfort() {
		
		if(ocupantes.isEmpty()){
			return super()
		}else{
			return super() + (10 / self.cantidadPersonas())
		}
	}
	
	override method puedeEntrar(unOcupante) = ocupantes.all({o => self.ocupantesDuermen(o)})
	
	method cantidadPersonas() = ocupantes.size()
	
	method ocupantesDuermen(unOcupante) = duermen.contains(unOcupante)

}

class Banio inherits Habitacion{
	
	override method nivelDeConfort(){
		if(!ocupantes.isEmpty()){
			if(ocupantes.first().edad() < 5){
				return super() + 2
			}else{
				return super() + 4
			}
		}else{
			return super()
		}
	}
	
	override method puedeEntrar(unOcupante) = ocupantes.isEmpty() || ocupantes.first().edad() <= 4
	
}

class Cocina inherits Habitacion{
	const metros
	
	override method nivelDeConfort(){
		if(ocupantes.first().tieneHabilidades()){
			return metros % porcentaje.valor() + super()
		}else{
			return super()
	    }
	}
	
	override method puedeEntrar(unOcupante) = 
	!unOcupante.tieneHabilidad() || !self.hayCocinero()
	
	method hayCocinero() = ocupantes.any({o => o.tieneHabilidades()})
}

object porcentaje{
	var property valor = 10
}

object nullHabitacion{
	
}

