import wollok.game.*
//Clase general de los objetos tipo flecha
class Flecha{
  const velocidad = 96 //mas alto = mas lento
  var property id
  var property position
  var property tipo

    method image() = "flecha-"+tipo+".png"


  method desplazarse(){
    //console.println("ejecuta el método") //debug
    game.onTick(velocidad, id,{
      position = position.down(1)
      //console.println("HAY MOVIMIENTO!!!") //debug
      if(position.y() <= -4){
        game.removeTickEvent(id)
        game.removeVisual(self)
        //console.println("flecha detenida") //debug
      }
    })
    /*
    if (position.y() > -4){
      game.schedule(250,{position = position.down(1) self.desplazarse()})
    }
    */
  }

  method resetearPosicion(){
    position = game.at(position.x(),25)
  }


}

//botones sobre los cuales las flechas/marcadores tienen que estar
class BotonFlecha {
    var property tipo // Puede ser "arriba", "abajo", "izquierda", "derecha"
    var property position // Posición del botón en el tablero
    var property imagenPresionada = ""
    //"flecha-" + tipo + ".png"

    // Método para obtener la imagen según el tipo
    method image() = "boton-flecha-" + tipo + imagenPresionada + ".png"

    // Método para manejar la acción de cambiar a la imagen en rojo cuando se presiona la tecla
    method presionarTecla() {
        //var imagenOriginal = self.image() // Guardar la imagen original

        // Cambiar la imagen a la versión en azul
        imagenPresionada = "-presionada"
        //console.println("presionaste la tecla")

        // Volver a la imagen original después de un corto tiempo
        game.schedule(300, { imagenPresionada = "" })
    }
}

/*
keyboard.yecla.onPressDo(){
si limite 1 <flecha.y < limite 2 { sumar vida}
else if flecha < limite inferior { restar vida}
}

*/