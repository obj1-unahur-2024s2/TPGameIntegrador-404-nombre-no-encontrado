// src/canciones.wlk
class Cancion{
    method initialize()
    const delay = 0
    method tirarFlecha(pausa, flecha){
        game.schedule(pausa,{flecha.desplazarFlecha()})
    }
}
object flyMeToTheMoon inherits Cancion{
    method initialize(izquierda,arriba,abajo,derecha){
        const fsFlyMeToTheMoon = game.sound("Fly Me To The Moon.mp3")
        const listaDeFlechas = new Dictionary()
        listaDeFlechas.put(7800 + delay,arriba)
        listaDeFlechas.put(7800 + delay,arriba)          //fly
        listaDeFlechas.put(8400 + delay,derecha)         //me
        listaDeFlechas.put(8900 + delay,izquierda)       //to
        listaDeFlechas.put(9300 + delay,izquierda)       //the
        listaDeFlechas.put(9700 + delay,abajo)           //moon

        listaDeFlechas.put(10800 + delay,arriba)         //let
        listaDeFlechas.put(11100 + delay,arriba)         //me
        listaDeFlechas.put(11700 + delay,izquierda)      //play
        listaDeFlechas.put(13000 + delay,abajo)          //among the
        listaDeFlechas.put(13700 + delay,derecha)        //stars

        listaDeFlechas.put(15700 + delay,arriba)         //let
        listaDeFlechas.put(16300 + delay,derecha)        //me
        listaDeFlechas.put(16800 + delay,izquierda)      //see
        listaDeFlechas.put(17300 + delay,abajo)          //what
        listaDeFlechas.put(17700 + delay,abajo)          //spring
        listaDeFlechas.put(18300 + delay,izquierda)      //is
        listaDeFlechas.put(18700 + delay,derecha)        //like
        listaDeFlechas.put(19200 + delay,arriba)         //on
        listaDeFlechas.put(20600 + delay,arriba)         //a ju-
        listaDeFlechas.put(21100 + delay,derecha)        //-piter 
        listaDeFlechas.put(21600 + delay,abajo)          //and mars

        listaDeFlechas.put(23600 + delay,izquierda)      //in other
        listaDeFlechas.put(24100 + delay,derecha)        //words

        listaDeFlechas.put(26600 + delay,arriba)        //hold
        listaDeFlechas.put(27600 + delay,izquierda)     //my
        listaDeFlechas.put(28100 + delay,derecha)       //hand

        listaDeFlechas.put(31100 + delay,abajo)          //in other
        listaDeFlechas.put(32100 + delay,izquierda)      //words

        listaDeFlechas.put(34700 + delay,arriba)         //ba-
        listaDeFlechas.put(35200 + delay,derecha)       //-by
        listaDeFlechas.put(35700 + delay,izquierda)       //kiss
        listaDeFlechas.put(36100 + delay,izquierda)       //me

        listaDeFlechas.put(39800 + delay,arriba)       //fill
        listaDeFlechas.put(40300 + delay,derecha)       //my
        listaDeFlechas.put(40900 + delay,derecha)       //heart with
        listaDeFlechas.put(41500 + delay,abajo)       //song
        listaDeFlechas.put(42300 + delay,izquierda)       //and
        listaDeFlechas.put(42800 + delay,arriba)       //let me
        listaDeFlechas.put(43600 + delay,derecha)       //sing
        listaDeFlechas.put(44400 + delay,izquierda)       //forever
        listaDeFlechas.put(45500 + delay,abajo)       //more

        listaDeFlechas.put(47600 + delay,izquierda)       //you
        listaDeFlechas.put(48700 + delay,derecha)       //are
        listaDeFlechas.put(49100 + delay,derecha)       //all i
        listaDeFlechas.put(49700 + delay,abajo)       //long
        listaDeFlechas.put(50100 + delay,derecha)       //for
        listaDeFlechas.put(50800 + delay,izquierda)       //all
        listaDeFlechas.put(51400 + delay,arriba)       //i wor-
        listaDeFlechas.put(52200 + delay,derecha)       //-ship
        listaDeFlechas.put(53000 + delay,izquierda)       //and a-
        listaDeFlechas.put(53600 + delay,abajo)       //-dore
        
        fsFlyMeToTheMoon.volume(0.25)
        fsFlyMeToTheMoon.play()
        listaDeFlechas.forEach({k,v => self.tirarFlecha(k, v)})
  }
}

object billieJean inherits Cancion{
  //posible implementacion de canciones, va a ser una banda --Maty
  method initialize(izq,arr,abj,der){ 
    const mjBillieJean = game.sound("mj-billie-jean.mp3")
    mjBillieJean.volume(0.25) 
    mjBillieJean.play()
    game.schedule(1200,{ 
      game.schedule(4150,{arr.desplazarFlecha()})
      game.schedule(4340,{abj.desplazarFlecha()})
      game.schedule(4680,{der.desplazarFlecha()})
      game.schedule(4940,{arr.desplazarFlecha()})
      game.schedule(5180,{izq.desplazarFlecha()})
      game.schedule(5460,{der.desplazarFlecha()})
      game.schedule(5700,{abj.desplazarFlecha()})
      game.schedule(5960,{der.desplazarFlecha()})
    })
  }
}

object hipShop inherits Cancion{
  //Siento que esta es un buen tutorial o Facil
  //Intente separarlo por tiempos
  method initialize(izquierda,arriba,abajo,derecha) {
      const fsHipShop = game.sound("Hip Shop.mp3")
      const listaDeFlechas = new Dictionary()
      listaDeFlechas.put(2500 + delay,abajo)
      listaDeFlechas.put(3400 + delay,derecha)
      listaDeFlechas.put(3700 + delay,arriba)
      listaDeFlechas.put(4200 + delay,derecha)
      listaDeFlechas.put(4600 + delay,abajo)

      listaDeFlechas.put(7100 + delay,izquierda)
      listaDeFlechas.put(7300 + delay,abajo)
      listaDeFlechas.put(7400 + delay,derecha)

      listaDeFlechas.put(8300 + delay,izquierda)
      listaDeFlechas.put(8700 + delay,abajo)
      listaDeFlechas.put(9200 + delay,derecha)
      listaDeFlechas.put(9600 + delay,abajo)

      listaDeFlechas.put(12400 + delay,arriba)

      listaDeFlechas.put(14500 + delay,izquierda)
      listaDeFlechas.put(14700 + delay,arriba)
      listaDeFlechas.put(14800 + delay,arriba)
      listaDeFlechas.put(15300 + delay,derecha)
      listaDeFlechas.put(15800 + delay,abajo)

      listaDeFlechas.put(17300 + delay,izquierda)
      listaDeFlechas.put(17800 + delay,izquierda)
      listaDeFlechas.put(18200 + delay,abajo)
      listaDeFlechas.put(18500 + delay,derecha)
      listaDeFlechas.put(19000 + delay,derecha)
      listaDeFlechas.put(19500 + delay,arriba)

      listaDeFlechas.put(24400 + delay,arriba)
      listaDeFlechas.put(24600 + delay,derecha)
      listaDeFlechas.put(24700 + delay,arriba)
      listaDeFlechas.put(25200 + delay,abajo)
      listaDeFlechas.put(25700 + delay,abajo)

      listaDeFlechas.put(27200 + delay,izquierda)
      listaDeFlechas.put(27700 + delay,abajo)
      listaDeFlechas.put(28100 + delay,izquierda)
      listaDeFlechas.put(28400 + delay,derecha)
      listaDeFlechas.put(28900 + delay,abajo)
      listaDeFlechas.put(29400 + delay,arriba)

      listaDeFlechas.put(34300 + delay,derecha)
      listaDeFlechas.put(34500 + delay,arriba)
      listaDeFlechas.put(34600 + delay,izquierda)

      listaDeFlechas.put(35600 + delay,derecha)
      listaDeFlechas.put(35900 + delay,izquierda)
      listaDeFlechas.put(36300 + delay,arriba)
      listaDeFlechas.put(36800 + delay,arriba)

      listaDeFlechas.put(38000 + delay,izquierda)
      listaDeFlechas.put(38200 + delay,derecha)
      listaDeFlechas.put(38300 + delay,abajo)
      listaDeFlechas.put(38800 + delay,abajo)

      listaDeFlechas.put(39300 + delay,arriba)
      
      fsHipShop.volume(0.25)
      fsHipShop.play()
      listaDeFlechas.forEach({k,v => self.tirarFlecha(k, v)})

    }
}