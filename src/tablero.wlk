import wollok.game.*
import contador.*
import flechas.*
//init del tablero
/*
  la idea sería usar una grilla 3 o 4 (o más de ser necesario) veces más densa que los sprite de las flechas,
  es decir, si el sprite es de 64px por 64px, cada celda de la grilla tendría que ser de 16px de lado.
  De esta forma podríamos tener un movimiento un poco mas fluido para las flechas, y permitirnos obtener diferentes
  puntajes en base a la precisión del jugador.
  después para los Menús ya si se podría usar una grilla menos densa y usar el tipo de objeto con el movimiento ya
  implementado 
*/
object tablero{
	var property puntaje = 0

  method inicializar(){
    game.width(16)
    game.height(24)
    game.cellSize(16)
    game.title("Tablero")
    const bgm = game.sound("bgm.mp3")
 	  bgm.shouldLoop(true)
	  bgm.volume(0.25)
    keyboard.q().onPressDo({
		  bgm.play()
		})
	  keyboard.r().onPressDo({
      bgm.stop()
    })
  }

  method puntaje() = puntaje

  //de esto se van a encargar el DetectorPuntuacion, despeus hay que ver cuantos puntos daría cada uno, y/o cuantos se restan con cada error
  method incrementarPuntaje() {
		puntaje =+ 1
	}

  method reiniciarPuntaje() {
		puntaje = 0
	}

}

//estos serian los objectos que se encargan del puntaje en base a cuando apretaste
class DetectorPuntuacion{
  const property tipo //Perfecto, Excelente, Bien, Fallo
  const puntaje
  var property position

  method registrarPuntaje(){
    puntaje.valor(puntaje.valor()+puntaje)
  }
}