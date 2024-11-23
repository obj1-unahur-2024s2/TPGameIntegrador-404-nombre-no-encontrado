import canciones.*
import contador.*
import flechas.*
import listasDeFlechas.*
import personaje.*
import tablero.*

class Pantalla{
	var property image 
	const property position = game.origin()
}

const pantallaInicio = new Pantalla(image = "portadaInicio.jpg")
const modalidadesPantalla = new Pantalla(image = "modalidadJuego.jpg")
const derrotaPantalla = new Pantalla(image = "pantallaPerdiste.png")
const victoriaPantalla = new Pantalla(image = "pantallaGanaste.png")


class Modalidades {
	const cancion

	method configurar() {
		musicaMenu.stop()
		self.agregarVisuales()
		tablero.inicializarFlechas(cancion)
	}

  	method pantallaVictoria(){
		game.addVisual(victoriaPantalla)
		musicaVictoria.play()

		keyboard.r().onPressDo({botonMenu.play() tablero.inicializarFlechas(cancion) game.removeVisual(victoriaPantalla)})
		keyboard.m().onPressDo({botonMenu.play() tablero.menuReset() game.removeVisual(victoriaPantalla)})
    }

	method pantallaDerrota(){
		  game.addVisual(derrotaPantalla)
		  musicaDerrota.play()

		  keyboard.r().onPressDo{botonMenu.play() tablero.inicializarFlechas(cancion) game.removeVisual(derrotaPantalla)}
		  keyboard.m().onPressDo{botonMenu.play() tablero.menuReset() game.removeVisual(derrotaPantalla)}
    }

	method agregarVisuales()

}

object tutorial inherits Modalidades(cancion = hipShop){

	override method agregarVisuales() {
		game.addVisual(tutorialPantalla)
	}
}

object facil inherits Modalidades(cancion = myBestFriend){

	override method agregarVisuales() {
		game.addVisual(barraDeVida)
	}
}

object normal inherits Modalidades(cancion = theSoundOfSilence){

	override method agregarVisuales() {
		game.addVisual(barraDeVida)
	}
}

object botonMenu {
	
	method play (){
		game.sound("botonSonido.mp3").play()
	}
}

object musicaMenu{
var musica = game.sound("menuMusica.mp3")

	method play (){
		musica = game.sound("menuMusica.mp3")
		musica.shouldLoop(true)
		musica.volume(0.3)
		musica.play()
	}
	
	method stop(){
		musica.stop()
	}
}

object musicaVictoria {
	method play (){
		game.sound("ganasteMusica.mp3").play()
	}
}

object musicaDerrota {
	method play (){
		game.sound("perdisteMusica.mp3").play()
	}
}