import tablero.*

object puntaje {
	var valor = 0
	var property puntos = valor
	var property color = "color a decidir"
	var property dificultad = perfecto

	method position() = game.at(1, 1)
	
	method texto() = puntos.toString()
	method textoColor() = color

	method sumarPuntos() {
	  valor += dificultad.puntos()
	}

	method resetear(){
		valor = 0
	}

}

//a lo mejor pueden ser una clase general de "sumarPuntuación" o algo asi?, con los puntos y posición como parámetro

object perfecto {
  method puntos() = 100
}

object muyBien {
  method puntos() = 80
}

object bien {
  method puntos() = 60
}

object ok {
  method puntos() = 40
}