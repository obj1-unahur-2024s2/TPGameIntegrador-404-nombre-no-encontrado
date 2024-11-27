// src/canciones.wlk
import tableroManager.*
class Cancion{
  const cancion
  const delay = 0 //constante para sincronizar las canciones con las flechas. Esto se logra aplicando un delay a la canción al momento de reproducirla
  method tirarFlecha(pausa, flecha){
    game.schedule(pausa,{flecha.desplazarFlecha()})
  }

  method reproducir(lista, posicion){
    console.println(lista.size())
    if(posicion < lista.size()){
      const elementoActual = lista.get(posicion)
      console.println(posicion)
      const tiempo = elementoActual.get(0)
      const flecha = elementoActual.get(1)
      game.schedule(tiempo,{
        flecha.desplazarFlecha()
        console.println("intenté tirar flecha")
        self.reproducir(lista, posicion+1)
      })
    }
    else{ //caso borde
      const ultimaFlecha = lista.last()
      const tiempo = ultimaFlecha.get(0)
      const flecha = ultimaFlecha.get(1)
      game.schedule(tiempo,{
        flecha.desplazarFlecha()
        game.schedule(delay + 1000,{if(not game.hasVisual(derrotaPantalla)){pantallaVictoria.config()}})
      })
    }
  }

  method reproducir(){
    cancion.sound().volume(0.25)
    game.schedule(delay,{cancion.sound().play()})
    console.println("intenté reproducir cancion")
    self.reproducir(cancion.listaDeFlechas(),0)
  }
}
object flyMeToTheMoon{
  const property sound = game.sound("Fly Me To The Moon.mp3")
  const property listaDeFlechas = []
    method initialize(izquierda,arriba,abajo,derecha){
        listaDeFlechas.addAll([
        [7800,arriba],          /*fly*/
        [600,derecha],         //me
        [500,izquierda],       //to
        [400,izquierda],       //the
        [400,abajo],           //moon

        [1100,arriba],         //let
        [300,arriba],         //me
        [600,izquierda],      //play
        [1300,abajo],          //among the
        [700,derecha],        //stars

        [2000,arriba],         //let
        [600,derecha],        //me
        [500,izquierda],      //see
        [500,abajo],          //what
        [400,abajo],          //spring
        [600,izquierda],      //is
        [4000,derecha],        //like
        [500,arriba],         //on
        [1400,arriba],         //a ju-
        [500,derecha],        //-piter 
        [500,abajo],          //and mars

        [2000,izquierda],      //in other
        [500,derecha],        //words

        [2500,arriba],        //hold
        [1000,izquierda],     //my
        [500,derecha],       //hand

        [3000,abajo],          //in other
        [1000,izquierda],      //words

        [2600,arriba],         //ba-
        [500,derecha],       //-by
        [500,izquierda],       //kiss
        [400,izquierda],       //me

        [3700,arriba],       //fill
        [500,derecha],       //my
        [600,derecha],       //heart with
        [600,abajo],       //song
        [800,izquierda],       //and
        [500,arriba],       //let me
        [800,derecha],       //sing
        [800,izquierda],       //forever
        [1100,abajo],       //more

        [2100,izquierda],       //you
        [1100,derecha],       //are
        [400,derecha],       //all i
        [600,abajo],       //long
        [400,derecha],       //for
        [700,izquierda],       //all
        [600,arriba],       //i wor-
        [800,derecha],       //-ship
        [800,izquierda], /*and a- dore*/
        [600,abajo] 
        ])
  }
}

object hipShop {
  //Siento que esta es un buen tutorial o Facil
  //Intente separarlo por tiempos
  const property sound = game.sound("Hip Shop.mp3")
  const property listaDeFlechas = []
  method initialize(izquierda,arriba,abajo,derecha) {
      listaDeFlechas.addAll([
        [2500, abajo],
        [900, derecha],
        [300, arriba],
        [500, derecha],
        [400, abajo],

        [2500, izquierda],
        [200, abajo],
        [100, derecha],

        [900, izquierda],
        [400, abajo],
        [500, derecha],
        [400, abajo],

        [2800, arriba],

        [2100, izquierda],
        [200, arriba],
        [100, abajo],
        [500, derecha],
        [500, arriba],

        [1500, izquierda],
        [500, izquierda],
        [400, abajo],
        [300, derecha],
        [500, derecha],
        [500, arriba],

        [4900, arriba],
        [200, derecha],
        [100, arriba],
        [500, abajo],
        [500, abajo],

        [1500, izquierda],
        [500, abajo],
        [400, derecha],
        [300, izquierda],
        [500, abajo],
        [500, arriba],

        [4900, derecha],
        [200, arriba],
        [100, izquierda],

        [1000, derecha],
        [300, izquierda],
        [400, arriba],
        [500, arriba],
        
        [1200, izquierda],
        [200, derecha],
        [100, abajo],
        [500, abajo],

        [500, arriba]
      ])
    }
}

object theSoundOfSilence{
  const property sound = game.sound("The Sound of Silence.mp3")
  const property listaDeFlechas = []
  method initialize(izquierda,arriba,abajo,derecha) {
    listaDeFlechas.addAll([
      [10600, arriba],
      [800, abajo],
      [700, arriba],
      [1200, derecha],

      [2800, abajo],
      [400, izquierda],
      [600, abajo],
      [700,derecha],
      [1400,abajo],

      [2800, arriba], //because
      [800, derecha],//of
      [300, izquierda], //visions
      [700, derecha], //softly
      [1500, derecha], //creeping

      [2700, izquierda],//left
      [500, abajo],//it's seeds
      [800, abajo],//while
      [400, arriba],//I
      [500, derecha],//was
      [1300, arriba],//sleeping
      
      [2900, abajo],//and
      [500, izquierda],//the vision
      [2500, derecha],//that was
      [700, abajo],//planted
      [1600,arriba],//in my
      [1000,abajo],//brain

      [2100, izquierda], //still
      [1600, arriba], //remains
      [3000, abajo], //whitin
      [700, derecha], //the sound
      [2800, abajo], //of silence

      [3600, derecha], //in restless
      [1100, izquierda], //dreams i
      [800, derecha], //walked alone
      [4000, arriba], //narrow
      [900, abajo], //streets
      [500, arriba], //of cobellstone

      [6600, abajo], //'Neath 
      [500, izquierda], //the halo
      [1300, izquierda], //of a
      [1200, abajo], //street
      [500, arriba],//lamp

      [2000, abajo],  //i
      [400, derecha], //turned 
      [300, arriba], //my collar
      [1000, abajo], //to the
      [800, izquierda], //cold 
      [800, arriba], //and damped

      [2800, derecha], //when
      [400, abajo], //my eyes
      [1100, derecha], //were stabbed
      [1400, izquierda], //by
      [600, abajo], //the flash
      [1200, arriba], //of a
      [400, abajo], //neon
      [1000, derecha],//light

      [2300, izquierda], //that split
      [1300, abajo], //the night
      [2900, arriba], //and touched
      [800, arriba],//the sound
      [2800, abajo], //of silence

      [3500, derecha], // and in
      [700, abajo], //the naked
      [1000, izquierda], //light I
      [1000, arriba],//Saw

      [2900, abajo], //10 thousand
      [1100, arriba], //people
      [900, abajo],//maybe more

      [4100, derecha], //people 
      [800, izquierda], //talking
      [200, arriba],//without
      [1000, izquierda], //speakin

      [3700, izquierda], //people
      [800, derecha], //hearing
      [600, abajo], //whitout
      [1300, derecha], //listening

      [1600, abajo], //people
      [900, abajo], //writing 
      [100, arriba], //SONGS
      [3000, derecha], // that 
      [800, izquierda], // voices
      [1400, abajo],//never
      [1000, derecha], //shared

      [2500, abajo],//  no one
      [1200, izquierda],  // dared

      [2800, arriba],// disturb
      [500, derecha], // the 
      [500, derecha], //sound
      [2400, abajo], //of
      [400, izquierda],  //SILENCE

      [3400, arriba], // "FOOLS"
      [400, izquierda], //SAYED 
      [500, abajo], //I "YOU 
      [700, arriba], //DO NOT
      [900, derecha], //KOOOOOOW

      [3100, abajo], // silence
      [1000, arriba], //like a 
      [500, izquierda], //cancer
      [1200, derecha], //GROOOOOWS

      [3000, izquierda], //hear my
      [800, derecha],  //words
      [400, arriba], //that i
      [600, abajo],//might 
      [1000, derecha], //teach
      [500, izquierda], //you 

      [2100, derecha], //take 
      [500, abajo], //my 
      [500, izquierda], //arm
      [400, abajo], //that i
      [500, arriba], //might
      [900, izquierda], //reach
      [600, derecha], //youuu

      [2500, abajo], //but 
      [300, derecha], // my 
      [500, abajo],  //words
      [1000, arriba], //like
      [500, izquierda],  //silent
      [1600, derecha], //raindrops
      [1100, abajo],  //fell

      [2100, derecha],// oh oh oh

      [2100, arriba], // echoed
      [1000, derecha], //in the wellS
      [2800, arriba], // of silence

      [3900, abajo], //and the
      [900, izquierda], // people
      [600, arriba], // bowed
      [500, abajo], // and prayed
      [3500, derecha], //to the
      [600, arriba], // neon
      [900, abajo], // god
      [1100, derecha], //they
      [700, izquierda], //made

      [2300, arriba], //andthe
      [600, derecha], // sign
      [400, izquierda], //flahsed out
      [900, abajo], //it's 
      [900, izquierda], //warning

      [2900, derecha], // In the
      [700, abajo], //word that
      [700, izquierda], // it was
      [1400, abajo], // forming

      [2700, arriba],  //and the
      [700, izquierda], // sign
      [800, arriba], //sayed:
      [400, abajo], // "the words
      [1000, derecha], // on the
      [700, izquierda], // prophets
      [700, derecha], //are
      [700, abajo], //writteen on
      [1200, arriba], //  the subway
      [400, derecha], //walls
      [2100, izquierda], //and tenement
      [1300, derecha], //halls"

      [2100, arriba], //and whispered
      [2900, derecha], // in the
      [400, abajo], //SOUUUUUUUUND
      [5900, izquierda], //OFFF
      [1200, abajo]// SIIIIIIILEEEEEEEEENNNNNCEEEEEE
    ])
  }
}

object myBestFriend{
  const property sound = game.sound("My Best Friend.mp3")
  const property listaDeFlechas = []
  method initialize(izquierda,arriba,abajo,derecha) {
    listaDeFlechas.addAll([
      [1800, abajo], 
      [700, derecha],
      [600, arriba],
      [700, abajo],
      [700, izquierda],
      [600, abajo],
      [600, arriba],
      [600, derecha],
      [700, derecha],
      [600, abajo],
      [700, arriba],
      [600, izquierda],
      [700, arriba],
      [800, derecha], 
      [700, izquierda],
      [600, derecha],
      [600, abajo],
      [700, arriba],
      [600, arriba],
      [700, abajo],
      [600, derecha],
      [700, izquierda],
      [600, arriba],
      [700, abajo],
      [600, izquierda],
      [700, abajo],
      [600, derecha],
      [600, derecha],
      [700, arriba],
      [600, derecha],
      [700, izquierda],
      [1300, abajo],
      [600, arriba],
      [700, izquierda],
      [600, derecha],
      [700, izquierda],
      [600, arriba],
      [700, abajo],
      [600, derecha],
      [700, izquierda],
      [600, abajo],
      [600, derecha],
      [700, abajo],
      [600, arriba],
      [1200, arriba],
      [100, abajo],
      [0, derecha]
    ])   
  }
}  