import wollok.game.*
//Clase general de los objetos tipo flecha
class Flecha{
  const velocidad = 250
  var property position
  var property tipo
  var presionada = false
  method image(){
    if (presionada){
        return("flecha-"+tipo+"-presionada.png")
    }
    else return("flecha-"+tipo+".png")
  }
  
  //método recursivo
  method desplazarse(){
    console.println("ejecuta el método") //debug
    game.onTick(velocidad, "moverFlecha",{
      position = position.down(1)
      console.println("HAY MOVIMIENTO!!!") //debug
      if(position.y() <= -4){
        game.removeTickEvent("moverFlecha")
        console.println("flecha detenida") //debug
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
class BotonFlecha inherits Flecha{
  var tecla
  method presionar(){ 
    keyboard.letter(tecla).onPressDo({
        presionada = true
        console.println("tecla " + tipo + " presionada!") //debug
        game.schedule(1000,{presionada = false
            console.println("tecla " + tipo + " vuelve a su estado original!") //debug
        })
    })
  }

  override method desplazarse(){} //No hacer nada
}

/*object flecha{
  var property position = game.at(0,24)
  method image()="flecha-abajo.png"
  method desplazarse(){
    if (position.y() > -4){
      game.schedule(250,{position = position.down(1) self.desplazarse()})
    }
  }
}*/