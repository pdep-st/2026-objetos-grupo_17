class Guerrero {
    const poderOfensivo
    const energiaInicial = energia
    var experiencia
    var energia
    var property traje

    method traje(trajeElegido) {
        traje = trajeElegido
    }

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
    }

    method comeSemillaDelErmitanio() {
        energia = energiaInicial
    }

}

class TrajeComun {
    const porcentajeProteccion

    method danioRecibido(danioBase) {
        return danioBase * (porcentajeProteccion / 100)
    }

    method experienciaGanada(experienciaBase) {
        return experienciaBase
    }
}


class TrajeDeEntrenamiento {
    var property multiplicador = 2
    method danioRecibido(danioBase) {
        return danioBase
    }

    method experienciaGanada(experienciaBase) {
        return experienciaBase * multiplicador
    }
}

const goku = new Guerrero(poderOfensivo = 100, energia = 5000, experiencia = 0, traje = new TrajeDeEntrenamiento(multiplicador = 2))
const vegeta = new Guerrero(poderOfensivo = 80, energia = 5000, experiencia = 0, traje = new TrajeComun(porcentajeProteccion = 3))
