import flechas.*

//estos podrían ser una sola clase, pero hgghhhhhh,,,,,,,, --Maty

class FlechasIzquierda {
    const flecha1 = new Flecha(tipo = izquierda,id=1, position = game.at(0, 36))
    const flecha2 = new Flecha(tipo = izquierda,id=2, position = game.at(0, 36))
    const flecha3 = new Flecha(tipo = izquierda,id=3, position = game.at(0, 36))
    const flecha4 = new Flecha(tipo = izquierda,id=4, position = game.at(0, 36))
    const flecha5 = new Flecha(tipo = izquierda,id=5, position = game.at(0, 36))

    const property lista = [flecha1,flecha2,flecha3,flecha4,flecha5]

    method desplazarFlecha(){
        lista.first().desplazarse()
        lista.add(lista.first())
        lista.remove(lista.first())
    }
}

class FlechasArriba {
    const flecha1 = new Flecha(tipo = arriba,id=6, position = game.at(4, 36))
    const flecha2 = new Flecha(tipo = arriba,id=7, position = game.at(4, 36))
    const flecha3 = new Flecha(tipo = arriba,id=8, position = game.at(4, 36))
    const flecha4 = new Flecha(tipo = arriba,id=9, position = game.at(4, 36))
    const flecha5 = new Flecha(tipo = arriba,id=10, position = game.at(4, 36))

    const property lista = [flecha1,flecha2,flecha3,flecha4,flecha5]

    method desplazarFlecha(){
        lista.first().desplazarse()
        lista.add(lista.first())
        lista.remove(lista.first())
    }
}

class FlechasAbajo {
    const flecha1 = new Flecha(tipo = abajo,id=11, position = game.at(8, 36))
    const flecha2 = new Flecha(tipo = abajo,id=12, position = game.at(8, 36))
    const flecha3 = new Flecha(tipo = abajo,id=13, position = game.at(8, 36))
    const flecha4 = new Flecha(tipo = abajo,id=14, position = game.at(8, 36))
    const flecha5 = new Flecha(tipo = abajo,id=15, position = game.at(8, 36))

    const property lista = [flecha1,flecha2,flecha3,flecha4,flecha5]

    method desplazarFlecha(){
        lista.first().desplazarse()
        lista.add(lista.first())
        lista.remove(lista.first())
    }
}

class FlechasDerecha {
    const flecha1 = new Flecha(tipo = derecha,id=16, position = game.at(12, 36))
    const flecha2 = new Flecha(tipo = derecha,id=17, position = game.at(12, 36))
    const flecha3 = new Flecha(tipo = derecha,id=18, position = game.at(12, 36))
    const flecha4 = new Flecha(tipo = derecha,id=19, position = game.at(12, 36))
    const flecha5 = new Flecha(tipo = derecha,id=20, position = game.at(12, 36))

    const property lista = [flecha1,flecha2,flecha3,flecha4,flecha5]

    method desplazarFlecha(){
        lista.first().desplazarse()
        lista.add(lista.first())
        lista.remove(lista.first())
    }
}
