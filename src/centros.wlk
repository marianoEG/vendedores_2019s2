import vendedores.*
class CentroDistribucion {
	const property ciudad
	var property vendedores = []
	
	method agregarVendedor(cual){
		if (vendedores.contains(cual)){
			throw new Exception(message = "Vendedor ya registrado")
		}
		else { vendedores.add(cual)}
	}
	
	method vendedorEstrella(){ return vendedores.max({vend=>vend.puntaje()}) }
	method puedeCubrir(cual){ return vendedores.any({vend=>vend.puedeTrabajarEn(cual)})}
	method vendedoresGenericos(){ return vendedores.any({vend=>vend.esGenerico()})}
	method esRobusto(){ return vendedores.filter({vend=>vend.esFirme()}).size() >= 3}
	method repartirCertificado(cual){ vendedores.forEach({vend=>vend.agregarCertificaciones(cual)}) }
	
}
