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
    case wrongEntrantType
    case missingRequiredInfo
    case invalidAge
    case noAgeInput
    case invalidBirthday
}




