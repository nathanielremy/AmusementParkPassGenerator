
import Foundation




extension Entrant {
    func hasAccessTo() {
        switch self {
        case .guest: print("Acces granted")
        case .employee: print("Acces NOT granted")
        }
    }
}


enum Entrant {
    case guest
    case employee
}


struct Entrants {
    var entree: Entrant?
}


let me = Entrants(entree: .guest)


func call() {

if let entree = me.entree {

entree.hasAccessTo()
    
} else {
    print("I FUCKED UP")
    }
}

call()