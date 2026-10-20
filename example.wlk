class Guerrero {
    const poderOfensivo
    const energiaInicial = energia
    var experiencia
    var energia
    var property traje

       method experiencia() {
        return experiencia
    }

    method energia() {
        return energia
    }

    method disminuirEnergia(energiaASustraer) {
        energia = (energia - traje.danioRecibido(energiaASustraer)).max(0)
        
    }

    method aumentarExperiencia(experienciaGanada) {
        experiencia += traje.experienciaGanada(experienciaGanada)
    }
    
    method atacaA(otroGuerrero) {
        otroGuerrero.disminuirEnergia(0.1 * poderOfensivo)
        otroGuerrero.aumentarExperiencia(1)
        otroGuerrero.traje().usar()
    }

    method comeSemillaDelErmitanio() {
        energia = energiaInicial
    }

}

class Traje {
    var desgaste = 0

    method desgaste() {
    return desgaste
}

    method usar() {
        desgaste += 5
    }

    method estaGastado() {
        return desgaste >= 100
    }

    method danioRecibido(danioBase) {
        return danioBase
    }

    method experienciaGanada(experienciaBase) {
        return experienciaBase
    }
}

class TrajeComun inherits Traje {
    const porcentajeProteccion

    override method danioRecibido(danioBase) {
        if (self.estaGastado()) {
            return danioBase
        }

        return danioBase * (1 - porcentajeProteccion / 100)
    }
}

class TrajeDeEntrenamiento inherits Traje {
    var property multiplicador = 2

    override method experienciaGanada(experienciaBase) {
        if (self.estaGastado()) {
            return experienciaBase
        }
        return experienciaBase * multiplicador
    }
}

class Pieza {
    const property resistencia
    var property desgaste = 0

    method estaGastada() {
        return desgaste >= 20
    }

    method usar() {
        desgaste += 5
    }

}

class TrajeModular inherits Traje {
    const piezas = []

    override method usar() {
        piezas.forEach ({pieza => pieza.usar()})
    }

    override method estaGastado() {
       return piezas.all ({pieza =>pieza.estaGastada()})
    }

    method piezasSanas() {
      return piezas.filter({pieza =>not pieza.estaGastada()})
    }

    override method danioRecibido(danioBase) {
         if (self.estaGastado()) {
            return danioBase
        }
      const resistenciaTotal = self.piezasSanas().sum({ pieza => pieza.resistencia() })
      return danioBase - resistenciaTotal
    }

    override method experienciaGanada(experienciaBase) {
        return experienciaBase * (self.piezasSanas().size()/piezas.size())
    }
}


const goku = new Guerrero(poderOfensivo = 100, energia = 5000, experiencia = 0, traje = new TrajeDeEntrenamiento(multiplicador = 2))
const vegeta = new Guerrero(poderOfensivo = 80, energia = 5000, experiencia = 0, traje = new TrajeComun(porcentajeProteccion = 3))
