//
//  ErrorTypes.swift
//  AmusementParkPassGenerator
//
//  Created by Nathaniel Remy on 2017-04-06.
//  Copyright © 2017 Nathaniel Remy. All rights reserved.
//

import Foundation


// Error types

enum PassCreationError: Error {
    case noEntrantType
    case missingRequiredInfo
    case invalidAge
    case invalidBirthday
    case invaliDateFormat
    case invalidProjectNumber
    case invalidCompany
}




