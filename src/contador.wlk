import tablero.*

object puntaje {
	//var valor = 0
	var property puntos = 0
	var property color = "color a decidir"
	var property dificultad = perfecto

	method position() = game.at(1, 1)
	
	method texto() = puntos.toString()
	method textoColor() = color

	method sumarPuntos(valor) {
	  puntos += valor
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
  method sumarPuntos(){
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