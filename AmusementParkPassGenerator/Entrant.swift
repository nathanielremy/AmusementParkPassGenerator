//
//  Entrant.swift
//  AmusementParkPassGenerator
//
//  Created by Nathaniel Remy on 2017-04-06.
//  Copyright © 2017 Nathaniel Remy. All rights reserved.
//



import Foundation

enum Entrant {
    case classicGuest
    case VIPGuest
    case freeChildGuest
    case hourlyFoodServiceEmployee
    case hourlyRideServiceEmployee
    case hourlyMaintenanceEmployee
    case manager
    
}

extension Entrant {
    
    var canAccessAmusementArea: Bool {
        return true
    }
    
    var canAccessKitchenArea: Bool {
        switch self {
        case .hourlyFoodServiceEmployee, .hourlyMaintenanceEmployee, .manager: return true
        default: return false
        }
    }
    
    var canAccessRideControlArea: Bool {
        switch self {
        case .hourlyRideServiceEmployee, .hourlyMaintenanceEmployee, .manager: return true
        default: return false
        }
    }
    
    var canAccessMaintenanceArea: Bool {
        switch self {
        case .hourlyMaintenanceEmployee, .manager: return true
        default: return false
        }
    }
    
    var canAccessAllRides: Bool {
        return true
    }
    
    var canSkipLines: Bool {
        switch self {
        case .VIPGuest: return true
        default: return false
        }
    }
    
    var discountOnFood: String {
        switch self {
        case .VIPGuest: return "10% off all foods"
        case .hourlyRideServiceEmployee, .hourlyMaintenanceEmployee, .hourlyFoodServiceEmployee: return "15% off all foods"
        case .manager: return "25% off all foods"
        default: return "Access to food discount denied"
        }
    }
    
    var discountOnMerchandise: String {
        switch self {
        case .VIPGuest: return "20% off all merchandise"
        case .hourlyFoodServiceEmployee, .hourlyMaintenanceEmployee, .hourlyRideServiceEmployee, .manager: return "25% off all merchandise"
        default: return "Access to merchandise discount denied"
        }
    }
    
    
    
}



































