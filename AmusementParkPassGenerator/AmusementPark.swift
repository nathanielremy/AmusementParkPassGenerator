//
//  AmusementPark.swift
//  AmusementParkPassGenerator
//
//  Created by Nathaniel Remy on 2017-04-06.
//  Copyright © 2017 Nathaniel Remy. All rights reserved.
//

import Foundation
import UIKit

protocol AmusementParkPassible {
    
    var entree: Entrant { get }
    
    var dateOfBirth: String? { get }
    var firstName: String? { get }
    var lastName: String? { get }
    var streetAddress: String? { get }
    var city: String? { get }
    var state: String? { get }
    var zipCode: String? { get }
    var company: String? { get }
    var projectNumber: String? { get }
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
    var company: String?
    var projectNumber: String?
    
    init(forClassicGuest entree: Entrant) {
        self.entree = entree
    }
    
    init(forVIPGuest entree: Entrant) {
        self.entree = entree
    }
    
    init(forFreeChild entree: Entrant, dateOfBirthMMDDYYYY DOB: String?) throws {
        
        if let dob = DOB {
            
            if dob != "" {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateFromString = dateFormatter.date(from: dob)

            if let dateFromString = dateFromString {

                let currentDay = Date()


                if (currentDay.isYoungerThan5(dateOfBirth: dateFromString)) {
                    print("pass created for FREE CHILD\n BIRTHDAY: \(dateFromString)\n \(entree)")
                    
                    self.entree = entree
                    self.dateOfBirth = dob
                    
                    } else {
                    throw PassCreationError.invalidAge
                }

            
        } else {
            throw PassCreationError.invaliDateFormat
            }
            } else {
                throw PassCreationError.missingRequiredInfo
            }
        } else {
            throw PassCreationError.missingRequiredInfo
        }
    }
    
    init(forEmployeeOrManagerOrSeasonPassGuest entree: Entrant, firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?) throws {
        
        if let firstName = firstName, let lastName = lastName, let streetAddress = streetAddress, let city = city, let state = state, let zipCode = zipCode {
            
            if !(firstName == "" || lastName == "" || streetAddress == "" || city == "" || state == "" || zipCode == "") {
                
                self.entree = entree
                self.firstName = firstName
                self.lastName = lastName
                self.streetAddress = streetAddress
                self.city = city
                self.state = state
                self.zipCode = zipCode
                
            } else {
                throw PassCreationError.missingRequiredInfo
            }
            
        } else {
            throw PassCreationError.missingRequiredInfo
        }
    }
    
    init(forSeniorGuest entree: Entrant, firstName: String?, lastName: String?, dateOfBirthMMDDYYYY DOB: String?) throws {
        
        if let firstName = firstName, let lastName = lastName, let dob = DOB {
            if !(firstName == "" || lastName == "" || dob == "") {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                let dateFromString = dateFormatter.date(from: dob)
                
                if let _ = dateFromString {
                    
                        self.entree = entree
                        self.firstName = firstName
                        self.lastName = lastName
                        self.dateOfBirth = dob
                    
                    
                } else {
                    throw PassCreationError.invaliDateFormat
                }
            } else {
                throw PassCreationError.missingRequiredInfo
            }
        } else {
            throw PassCreationError.missingRequiredInfo
        }
    }
    
    init(forContractor entree: Entrant, firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, projectNumber: String?) throws {
        
        if let firstName = firstName, let lastName = lastName, let streetAddress = streetAddress, let city = city, let projectNumber = projectNumber, let state = state, let zipCode = zipCode {
            
            if !(firstName == "" || lastName == "" || streetAddress == "" || city == "" || state == "" || zipCode == "" || projectNumber == "") {
                
                if projectNumber == "1001" || projectNumber == "1002" || projectNumber == "1003" || projectNumber == "2001" || projectNumber == "2002" {
                
                self.entree = entree
                self.firstName = firstName
                self.lastName = lastName
                self.streetAddress = streetAddress
                self.city = city
                self.state = state
                self.zipCode = zipCode
                self.projectNumber = projectNumber
                    
                    print(projectNumber)
                
                } else {
                    throw PassCreationError.invalidProjectNumber
                }
                
            } else {
                throw PassCreationError.missingRequiredInfo
            }
            
        } else {
            throw PassCreationError.missingRequiredInfo
        }
    }
    
    
    
    init(forVendor entree: Entrant, firstName: String?, lastName: String?, company: String?, dateOfBirthMMDDYYYY DOB: String?) throws {
        
        if let firstName = firstName, let lastName = lastName, let company = company, let dob = DOB {
            if !(firstName == "" || lastName == "" || company == "" || dob == "") {
                if company == "Acme" || company == "acme" || company == "Orkin" || company == "orkin" || company == "Fedex" || company == "fedex" || company == "NW Electrical" || company == "nw electrical"  {
                    
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "MM/dd/yyyy"
                        let dateFromString = dateFormatter.date(from: dob)
                
                        if let _ = dateFromString {
                
                            self.entree = entree
                            self.firstName = firstName
                            self.lastName = lastName
                            self.company = company
                            self.dateOfBirth = dob
                            

                            
                        } else {
                            throw PassCreationError.invaliDateFormat
                        }
             } else {
                    throw PassCreationError.invalidCompany
                }
            } else {
                throw PassCreationError.missingRequiredInfo
            }
        } else {
            throw PassCreationError.missingRequiredInfo
        }
    }
}






// park pass functionality
extension ParkPass {
    
    
    // SWIPE METHODS BELOW
    
    // Swipe methods for access points
    func swipeForAccessTo(amusementAreaWith entrant: ParkPass) -> Bool {
       
        if entrant.entree == .contractor {
        
            if let project = entrant.projectNumber {
                switch project {
                case "1001", "1002", "1003": return true
                default: return false
                }
            }
            
            
        } else if entrant.entree == .vendor {
            
            if let company = entrant.company {
                
                switch company {
                case "orkin", "Orkin", "nw electrical", "NW Electrical": return true
                default: return false
                }
                
            }
        }

        return entrant.entree.canAccessAmusementArea
    }

    
    func swipeForAccessTo(kitchenAreaWith entrant: ParkPass) -> Bool {
        
        if entrant.entree == .contractor {
            if let project = entrant.projectNumber {
                
                switch project {
                case "1001", "1002", "2001": return false
                default: return true
                }
            }
        
        } else if entrant.entree == .vendor {
            if let company = entrant.company {
             
                switch company {
                    case "fedex", "Fedex": return false
                default: return true
                }
                
            }
        }
        
        return entrant.entree.canAccessKitchenArea
        
    }

    
    func swipeForAccessTo(rideControlAreaWith entrant: ParkPass) -> Bool {
        if entrant.entree == .contractor {
            if let project = entrant.projectNumber {
                
                switch project {
                case "2001", "2002": return false
                default: return true
                }
            }
        } else if entrant.entree == .vendor {
            if let company = entrant.company {
                
                switch company {
                case "acme", "Acme", "fedex", "Fedex": return false
                default: return true
                }
            }
        }
        
        return entrant.entree.canAccessRideControlArea
        
    }

    
    func swipeForAccessTo(maintenanceAreaWith entrant: ParkPass) -> Bool {
        if entrant.entree == .contractor {
            if let project = entrant.projectNumber {
                
                switch project {
                case "1001", "2001": return false
                default: return true
                }
            }
        } else if entrant.entree == .vendor {
            if let company = entrant.company {
                
                switch company {
                case "acme", "Acme", "orkin", "Orkin": return false
                default: return true
                }
            }
        }

        return entrant.entree.canAccessMaintenanceArea
        
    }
    
    
    func swipeForAccessTo(officeAreaWith entrant: ParkPass) -> Bool {
        if entrant.entree == .contractor {
            if let project = entrant.projectNumber {
                
                switch project {
                case "1003", "2001": return true
                default: return false
                }
            }
        } else if entrant.entree == .vendor {
            if let company = entrant.company {
                
                switch company {
                case "acme", "Acme", "orkin", "Orkin": return false
                default: return true
                }
            }
        }
        return entrant.entree.canAccessOffice
    }
    
    

    func swipeForAccessTo(allRidesWith entrant: ParkPass) -> Bool {
        
        return entrant.entree.canAccessAllRides
        
    }

    
    func swipeForAccessTo(skipLinesWith entrant: ParkPass) -> Bool {
       
        return entrant.entree.canSkipLines
        
    }

    
    func swipeForAccessTo(discountOnFoodWith entrant: ParkPass) -> String {
        
        return entrant.entree.discountOnFood
        
    }

    
    func swipeForAccessTo(discountOnMerchandiseWith entrant: ParkPass) -> String {
        
        return entrant.entree.discountOnMerchandise
        
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


























































