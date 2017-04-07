//
//  AmusementPark.swift
//  AmusementParkPassGenerator
//
//  Created by Nathaniel Remy on 2017-04-06.
//  Copyright © 2017 Nathaniel Remy. All rights reserved.
//

import Foundation

protocol AmusementParkPassible {
    
    var entree: Entrant { get }
    
//  FIXME:  Add stored property for DOB
    var firstName: String? { get }
    var lastName: String? { get }
    var streetAddress: String? { get }
    var city: String? { get }
    var state: String? { get }
    var zipCode: String? { get }
}


extension AmusementParkPassible {
    
    func createPassFor() throws {}
    func swipeForAccessTo() {}
}


class ParkPass: AmusementParkPassible {


    let entree: Entrant
    
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    
    init(forClassicGuest entree: Entrant) {
        self.entree = entree
    }
    
    init(forVIPGuest entree: Entrant) {
        self.entree = entree
    }
    
//    FIXME: Initializer for Free Chil 
    
    init(forEmployeeOrManager entree: Entrant, firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?) {
        self.entree = entree
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }

}


extension ParkPass {
    
    func createPassFor(classicOrVIPGuest entree: Entrant) throws {
        
        if (entree == .classicGuest) || (entree == .VIPGuest) {
            if (entree == .classicGuest) {
                print("Pass created for CLASSIC GUEST! Enjoy your day")
            } else if (entree == .VIPGuest) {
                print("Pass created for VIP GUEST! Enjoy your day")
            }
            
            
        } else {
            throw PassCreationError.wrongEntrantType
        }
    }
    
    // FIXME: create free child pass
    
    
    func createPassFor(employeeOrManager entree: Entrant, firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?) throws {
        
        if let firstName = firstName, let lastName = lastName, let streetAddress = streetAddress, let city = city, let state = state, let zipCode = zipCode {
            
            
            if (entree == .hourlyFoodServiceEmployee) || (entree == .hourlyMaintenanceEmployee) || (entree == .hourlyRideServiceEmployee) || (entree == .manager) {
                
                if (entree == .hourlyFoodServiceEmployee) {
                    print("Pass created for HOURLY MAINTENANCE EMPLOYEE!\n FIRST NAME: \(firstName)\n LAST NAME: \(lastName)\n STREET ADDRESS: \(streetAddress)\n CITY: \(city)\n STATE: \(state)\n ZIP CODE: \(zipCode)")
                } else if (entree == .hourlyMaintenanceEmployee) {
                    print("Pass created for HOURLY RIDE SERVICE EMPLOYEE!\n FIRST NAME: \(firstName)\n LAST NAME: \(lastName)\n STREET ADDRESS: \(streetAddress)\n CITY: \(city)\n STATE: \(state)\n ZIP CODE: \(zipCode)")
                } else if (entree == .hourlyRideServiceEmployee) {
                    print("Pass created for HOURLY RIDE SERVICE EMPLOYEE!\n FIRST NAME: \(firstName)\n LAST NAME: \(lastName)\n STREET ADDRESS: \(streetAddress)\n CITY: \(city)\n STATE: \(state)\n ZIP CODE: \(zipCode)")
                }
            } else {
                throw PassCreationError.wrongEntrantType
            }
        } else {
            throw PassCreationError.missingRequiredInfo
        }
    }
    
    
    
    // Swipe methods for access points
    
    func swipeForAccessTo(amusementAreaWith entree: Entrant) {
        if (entree.canAccessAmusementArea) {
            print("Access to amusement area granted!")
        } else {
            print("Access to amusement area denied...")
        }
    }
    
    func swipeForAccessTo(kitchenAreaWith entree: Entrant) {
        if (entree.canAccessKitchenArea) {
            print("Access to kitchen area granted!")
        } else {
            print("Access to kitchen area denied...")
        }
    }
    
    func swipeForAccessTo(rideControlAreaWith entree: Entrant) {
        if (entree.canAccessRideControlArea) {
            print("Access to ride control area granted!")
        } else {
            print("Access to ride control area denied...")
        }
    }
    
    func swipeForAccessTo(maintenanceAreaWith entree: Entrant) {
        if (entree.canAccessMaintenanceArea) {
            print("Access to maintenance area granted!")
        } else {
            print("Access to maintenance area denied...")
        }
    }
    
    func swipeForAccessTo(allRidesWith entree: Entrant) {
        if (entree.canAccessAllRides) {
            print("Access to all rides granted!")
        } else {
            print("Access to all rides denied...")
        }
    }
    
    func swipeForAccessTo(skipLinesWith entree: Entrant) {
        if (entree.canSkipLines) {
            print("Access to skip lines granted!")
        } else {
            print("Access to skip lines denied...")
        }
    }
    
    func swipeForAccessTo(discountOnFoodWith entree: Entrant) {
        print(entree.discountOnFood)
    }
    
    func swipeForAccessTo(discountOnMerchandiseWith entree: Entrant) {
        print(entree.discountOnMerchandise)
    }    
}





























































