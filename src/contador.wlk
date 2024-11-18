import tablero.*

object puntaje {
	var property puntos = 0
	var property color = "color a decidir"
	//var property dificultad = perfecto

	method position() = game.at(23, 4)
	
	method text() = puntos.toString()
	method textColor() = color

	method sumarPuntos(puntaje) {
	  puntos += puntaje
	//valor += dificultad.puntos()
	}

	method resetear(){
		puntos = 0
	}

}

//a lo mejor pueden ser una clase general de "sumarPuntuación" o algo asi?, con los puntos y posición como parámetro

class TipoDePuntaje {
  const puntos
  method image()
  method position() = game.at(16, 8)
  method aparecer() {
    game.addVisual(self)
    game.schedule(500, {game.removeVisual(self)})
  }
  method sumarPuntos(){
    self.aparecer()
    puntaje.sumarPuntos(puntos)
  }
}
object perfecto inherits TipoDePuntaje(puntos = 100) {
  override method image() = "cartel-perfecto.png"
}

object excelente inherits TipoDePuntaje(puntos = 80) {
  override method image() = "cartel-excelente.png"
}

object bien inherits TipoDePuntaje(puntos = 60) {
  override method image() = "cartel-bien.png"
}

object ok inherits TipoDePuntaje(puntos = 40) {
  override method image() = "cartel-ok.png"
}