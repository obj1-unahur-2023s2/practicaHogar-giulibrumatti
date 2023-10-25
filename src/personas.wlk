import habitaciones.*

class Persona {
	const edad
	var tieneHabilidades
	var habitacion = nullHabitacion
	
	method edad() = edad
	
	method tieneHabilidades() = tieneHabilidades
	
	method habitacion() = habitacion
	
	method entrarHabitacion(unaHabitacion){
		habitacion = unaHabitacion
	}
	
	method nivelConfortTotal(habitaciones) = 
	habitaciones.sum({h => h.nivelConfort()})
	
}
