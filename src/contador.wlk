import tablero.*

object puntaje {
	var valor = 0
	var property puntos = valor
	var property color = "color a decidir"
	//var property dificultad = perfecto

	method position() = game.at(1, 24)
	
	method text() = puntos.toString()
	method textColor() = color

	method sumarPuntos(puntaje) {
	  valor += puntaje
	//valor += dificultad.puntos()
	}

	method resetear(){
		puntos = 0
	}

}

//a lo mejor pueden ser una clase general de "sumarPuntuación" o algo asi?, con los puntos y posición como parámetro

object perfecto {
  //method puntos() = 100
  const puntos = 100
  method image() = "cartel-perfecto.png"
  method position() = game.at(16, 8)
  method aparecer() {
	game.addVisual(self)
	game.schedule(1000, {game.removeVisual(self)})
  }
  method sumarPuntos(){
	self.aparecer()
	puntaje.sumarPuntos(puntos)
  }
}

object excelente {
  //method puntos() = 80
  const puntos = 80
  method sumarPuntos(){
	
	puntaje.sumarPuntos(puntos)
  }
}

object bien {
  //method puntos() = 60
  const puntos = 60
  method sumarPuntos(){
	puntaje.sumarPuntos(puntos)
  }
}

object ok {
  //method puntos() = 40
  const puntos = 40
  method sumarPuntos(){
	puntaje.sumarPuntos(puntos)
  }
}