import vendedores.*

class ClienteInseguro {
	
	method mePuedeAtender(quien){ return quien.esVersatil() and quien.esFirme() }
}

class ClienteDetallista { 
	
	method mePuedeAtender(quien){ return quien.certificaciones().filter({cert=>cert.tipo() == producto}).size() >= 3 }
	
}

class ClienteHumanista {
	
	method mePuedeAtender(quien){ return quien == new VendedorFijo() or quien == new VendedorViajante()}
	
}
