import habitaciones.*

class Casa {
	const habitaciones = []
	
	method habitacionesOcupadas() = 
	habitaciones.filter({h => h.estaOcupada()})
	
	method personasResponsables() = 
	habitaciones.map({h => h.personaMayor()}).asSet()
	
	method nivelConfortTotal() = habitaciones.sum({h => h.nivelConfort()})
}
