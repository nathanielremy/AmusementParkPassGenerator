//
//  Entrant.swift
//  AmusementParkPassGenerator
//
//  Created by Nathaniel Remy on 2017-04-06.
//  Copyright © 2017 Nathaniel Remy. All rights reserved.
//



import Foundation


// Entrant identity
enum Entrant {
    case classicGuest
    case VIPGuest
    case freeChildGuest
    case hourlyFoodServiceEmployee
    case hourlyRideServiceEmployee
    case hourlyMaintenanceEmployee
    case manager
    case seasonPassGuest
    case seniorGuest
    case contractor
    case vendor
}







// Entrant functionality for swipe methods
extension Entrant {
    
    
    var canAccessAmusementArea: Bool {
        
        switch self {
        case .vendor, .contractor: fatalError()
        default: return true
        }
        
        
    }
    
    var canAccessKitchenArea: Bool {
        switch self {
        case .vendor, .contractor: fatalError()
        case .hourlyFoodServiceEmployee, .hourlyMaintenanceEmployee, .manager: return true
        default: return false
        }
    }
    
    var canAccessRideControlArea: Bool {
        switch self {
        case .vendor, .contractor: fatalError()
        case .hourlyRideServiceEmployee, .hourlyMaintenanceEmployee, .manager: return true
        default: return false
        }
    }
    
    var canAccessMaintenanceArea: Bool {
        switch self {
        case .vendor, .contractor: fatalError()
        case .hourlyMaintenanceEmployee, .manager: return true
        default: return false
        }
    }
    
    var canAccessAllRides: Bool {
        switch self {
        case .contractor, .vendor: return false
        default: return true
        }
    }
    
    var canSkipLines: Bool {
        switch self {
        case .VIPGuest, .seasonPassGuest, .seniorGuest: return true
        default: return false
        }
    }
    
    var discountOnFood: String {
        switch self {
        case .VIPGuest, .seasonPassGuest, .seniorGuest: return "10% off all foods"
        case .hourlyRideServiceEmployee, .hourlyMaintenanceEmployee, .hourlyFoodServiceEmployee: return "15% off all foods"
        case .manager: return "25% off all foods"
        default: return "Access to food discount denied"
        }
    }
    
    var discountOnMerchandise: String {
        switch self {
        case .seniorGuest: return "10% off all merchandise"
        case .VIPGuest, .seasonPassGuest: return "20% off all merchandise"
        case .hourlyFoodServiceEmployee, .hourlyMaintenanceEmployee, .hourlyRideServiceEmployee, .manager: return "25% off all merchandise"
        default: return "Access to merchandise discount denied"
        }
    }
    
    var canAccessOffice: Bool {
        switch self {
        case .vendor, .contractor: fatalError()
        case .manager: return true
        default: return false
        }
    }
    
    
    
}



































