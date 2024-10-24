import tablero.*

object puntaje {
	var property valor = 0
	method position() = game.at(1, 1)
	
	method text() = "Puntaje: "+valor
	
	method textColor() = "#FFFFFF"

}