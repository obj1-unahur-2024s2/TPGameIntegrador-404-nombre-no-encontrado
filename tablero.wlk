import wollok.game.*
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
  method inicializar(){
    game.width(16)
    game.height(24)
    game.cellSize(16)
    game.title("Tablero")
    game.addVisual(BotonFlecha)
  }
}

//botones sobre los cuales las flechas/marcadores tienen que estar
object BotonFlecha{
  var tipo = "U"//arriba, abajo, etc.
  //var tecla //aparentemente tanto "qwer" como "uiop" pueden estar todas presionadas a la vez, propongo usar esas y dar la opcion de redefinirlas por el jugador
  var property position = game.origin()
  var image = "flecha-"+ tipo +".png"
  method image() = image
  method presionar(){
    //Para Hacer: que cambie a la versión presionada pero que vuelva a la comun tras cierto tiempo
  }
}

//flechitas que bajan (o suben, o se desplazan) a travez de la pantalla
class Flecha{
  var tipo //ídem BotonFlecha
  var desplazamiento //hacia que direccion se mueve(?)
  var property position
}

//estos serian los objectos que se encargan del puntaje en base a cuando apretaste
class DetectorPuntuacion{
  var tipo //Perfecto, Excelente, Bien, Fallo
  var puntaje //podria ser un método o algo creo
  var property position

}