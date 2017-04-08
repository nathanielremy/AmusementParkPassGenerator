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
    
    var dateOfBirth: String? { get }
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



// park pass identity
class ParkPass: AmusementParkPassible {


    let entree: Entrant
    
    var dateOfBirth: String?
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
    
    init(forFreeChild entree: Entrant, dateOfBirthMMDDYYYY DOB: String?) {
        self.entree = entree
        self.dateOfBirth = DOB
    }
    
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









// park pass functionality
extension ParkPass {
    
    // Pass creations
    func createPassFor(classicOrVIPGuest entree: Entrant) throws {
        
        // create simple pass with no business info required
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
    
    
    
    func createPassFor(childWithAge age: String?, entree: Entrant) throws {
        
        if entree == .freeChildGuest {
        
        if let age = age {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateFromString = dateFormatter.date(from: age)
            
            if let dateFromString = dateFromString {
                
                let currentDay = Date()
    
                
                if (currentDay.isYoungerThan5(dateOfBirth: dateFromString)) {
                    print("pass created for FREE CHILD\n BIRTHDAY: \(dateFromString)")
                    } else {
                    
                    throw PassCreationError.invalidAge
                }
   
                
            } else {
                throw PassCreationError.invalidBirthday
            }
            
        } else {
            throw PassCreationError.noAgeInput
        }
            
        } else {
            throw PassCreationError.wrongEntrantType
        }
        
        
    }
    
    
    
    func createPassFor(employeeOrManager entree: Entrant, firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?) throws {
        
        // Unwrap all required business info
        if let firstName = firstName, let lastName = lastName, let streetAddress = streetAddress, let city = city, let state = state, let zipCode = zipCode {
            
            
            if (entree == .hourlyFoodServiceEmployee) || (entree == .hourlyMaintenanceEmployee) || (entree == .hourlyRideServiceEmployee) || (entree == .manager) {
                
                
                // Print off the correct pass for the correct Entrant Type
                if (entree == .hourlyFoodServiceEmployee) {
                    print("Pass created for HOURLY FOOD SERVICE EMPLOYEE!\n FIRST NAME: \(firstName)\n LAST NAME: \(lastName)\n STREET ADDRESS: \(streetAddress)\n CITY: \(city)\n STATE: \(state)\n ZIP CODE: \(zipCode)")
                } else if (entree == .hourlyMaintenanceEmployee) {
                    print("Pass created for HOURLY MAINTENANCE EMPLOYEE!\n FIRST NAME: \(firstName)\n LAST NAME: \(lastName)\n STREET ADDRESS: \(streetAddress)\n CITY: \(city)\n STATE: \(state)\n ZIP CODE: \(zipCode)")
                } else if (entree == .hourlyRideServiceEmployee) {
                    print("Pass created for HOURLY RIDE SERVICE EMPLOYEE!\n FIRST NAME: \(firstName)\n LAST NAME: \(lastName)\n STREET ADDRESS: \(streetAddress)\n CITY: \(city)\n STATE: \(state)\n ZIP CODE: \(zipCode)")
                } else if (entree == .manager) {
                    print("Pass created for MANAGER!\n FIRST NAME: \(firstName)\n LAST NAME: \(lastName)\n STREET ADDRESS: \(streetAddress)\n CITY: \(city)\n STATE: \(state)\n ZIP CODE: \(zipCode)")
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
    
    
    // access to office to office area
    func swipeForAccessTo(officeAreaWith entree: Entrant) {
        if entree.canAccessOffice {
            print("Acces to office granted")
        } else {
            print("Acces to offfice denied...")
        }
    }
    
    
}


//MARK: isYoungerThan5

extension Date {
    
    // Verify Free child age
    func isYoungerThan5(dateOfBirth: Date) -> Bool {
        let childsAge: Int = Calendar.current.dateComponents([.year], from: dateOfBirth, to: self).year as Int!
        
        if (childsAge > 4) {
            return false
            
        } else if (childsAge < 0) {
            return false
            
        } else {
            return true
            
        }
    }
}


























































