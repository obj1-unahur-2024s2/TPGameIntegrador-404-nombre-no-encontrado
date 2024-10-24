import tablero.*

object contador {
  
}

object pantallaPuntaje inherits PantallaConTexto {
	method position() = game.center()
	method text() = tablero.puntajes().toString()
}

class PantallaConTexto {
	method textColor() = "977e9b"
}