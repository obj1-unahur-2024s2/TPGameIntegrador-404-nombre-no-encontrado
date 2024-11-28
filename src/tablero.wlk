import wollok.game.*
import tableroManager.*
import canciones.*
import flechas.*
import listasDeFlechas.*
import contador.*


object tablero{
  var modalidad = ''

  method inicializar(){
    //game.clear()
    game.width(38)
    game.height(40)
    game.cellSize(16)
    game.title("Melody Hero")
    game.boardGround("fondo-arcade.png")
    game.schedule (20,{musicaMenu.play()}) //musica del menu
    game.addVisual(pantallaInicio)    // Añadir la pantalla de inicio al juego
  }

  method getModalidad(){
    return modalidad
  }

  method nose(){
    if (self.getModalidad() == 'facil'){
      return facil.getCancion()
    } else if (self.getModalidad() == 'normal'){
      return normal.getCancion()
    } else { return tutorial.getCancion()}
  }

  method menuReset() {		
		game.schedule (20,{musicaMenu.play()}) //musica del menu
    game.addVisual(pantallaInicio)    // Añadir la pantalla de inicio al juego
  }

  method menuModalidades(){

      keyboard.z().onPressDo{
        tutorial.configurar()
        botonMenu.play()
        game.removeVisual(modalidadesPantalla)
        
		  }
      keyboard.x().onPressDo{
        facil.configurar()
        botonMenu.play()
        game.removeVisual(modalidadesPantalla)
        
		  }
      keyboard.c().onPressDo{
        normal.configurar()
        botonMenu.play()
        game.removeVisual(modalidadesPantalla)
        
		  }
    }

  method inicializarFlechas(cancion){

    //configurar las flechas
    izquierda.position(game.at(0,40))
    const flechasIzquierda = new FlechasIzquierda()
    const flechasArriba = new FlechasArriba()
    const flechasAbajo = new FlechasAbajo()
    const flechasDerecha = new FlechasDerecha()
    //añadir las flechas
    flechasIzquierda.lista().forEach({flecha => game.addVisual(flecha)})
    flechasArriba.lista().forEach({flecha => game.addVisual(flecha)})
    flechasAbajo.lista().forEach({flecha => game.addVisual(flecha)})
    flechasDerecha.lista().forEach({flecha => game.addVisual(flecha)})

    // Crear botones y asignar posición
    izquierda.position(game.origin())
    const botonIzquierda = new BotonFlecha(tipo = izquierda, flechas = flechasIzquierda.lista())
    const botonArriba = new BotonFlecha(tipo = arriba, flechas = flechasArriba.lista())
    const botonAbajo = new BotonFlecha(tipo = abajo, flechas = flechasAbajo.lista())
    const botonDerecha = new BotonFlecha(tipo = derecha ,flechas = flechasDerecha.lista())

    // Añadir los botones al juego
    game.addVisual(botonArriba)
    game.addVisual(botonAbajo)
    game.addVisual(botonIzquierda)
    game.addVisual(botonDerecha)

    game.addVisual(puntaje)

    // Configurar teclas
    keyboard.w().onPressDo({botonArriba.presionarTecla()})
    keyboard.s().onPressDo({botonAbajo.presionarTecla()})
    keyboard.a().onPressDo({botonIzquierda.presionarTecla()})
    keyboard.d().onPressDo({botonDerecha.presionarTecla()})

    cancion.initialize(flechasIzquierda,flechasArriba,flechasAbajo,flechasDerecha)
    console.println("inicializé cancion")
    const cancionActual = new Cancion (cancion = cancion)
    cancionActual.reproducir()
  }
    
}
