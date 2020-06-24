import ciudades.*
class Vendedor {
	var property certificaciones = []
	
	method agregarCertificaciones(cual){ certificaciones.add(cual) }
	method puedeTrabajarEn(donde)
	method tieneCertificacionDeProducto(){ return certificaciones.any({cert=>cert.tipo() == producto})}
	method tieneCertificacionDeDistribucion(){ return certificaciones.any({cert=>cert.tipo() == distribucion})}
	method esVersatil(){ 
		return certificaciones.size() >= 3 and self.tieneCertificacionDeProducto() and self.tieneCertificacionDeDistribucion()
	}
	method esFirme(){ return certificaciones.sum({cert=>cert.puntos()}) >= 30}
	method esInfluyente(){ return false} 
}

class VendedorFijo inherits Vendedor{
	var property ciudad
	
	override method puedeTrabajarEn(donde){ return self.ciudad() == donde}
}

class VendedorViajante inherits Vendedor {
	var property provincias = []
		
	method agregarCiudad(cual){ provincias.add(cual) }
	override method puedeTrabajarEn(donde){ return provincias.contains(donde.provincia())}
	override method esInfluyente(){ return provincias.sum({prov=>prov.poblacion()}) >= 10000000 }
}

class ComercioCorresponsal inherits Vendedor{
	var property ciudadesSucursales = []
	
	override method puedeTrabajarEn(donde){ return ciudadesSucursales.contains(donde)}
	method provinciasConSucursales(){ return ciudadesSucursales.map({suc=>suc.provincia()}).asSet().size()}
	method ciudadesConSucursales(){ return ciudadesSucursales.asSet().size()}
	override method esInfluyente(){ return self.ciudadesConSucursales() >= 5 or self.provinciasConSucursales() >= 3 }
}

class Certificacion {
	var property tipo
	var property puntos
}

object producto{}
object distribucion{}
