    //==================
    
    // Test cases for classic guest
    
    //==================
    
    
    
    // SUCCESS
    //        let entrant = ParkPass(forClassicGuest: .classicGuest)
    
    // FAILURE
    
    //        let entrant = ParkPass(forClassicGuest: .manager)
    
    //        do {
    //            try entrant.createPassFor(classicOrVIPGuest: entrant.entree)
    //
    //        } catch PassCreationError.wrongEntrantType {
    //            print("Pass not created... Wrong entrant type")
    //        } catch {
    //            fatalError("\(error)")
    //        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //==================
    
    // Test cases for VIP guest
    
    //==================
    
    
    
    // SUCCESS
    //                let entrant = ParkPass(forClassicGuest: .VIPGuest)
    
    // FAILURE
    
    //                let entrant = ParkPass(forClassicGuest: .manager)
    
    //        do {
    //
    //                       try entrant.createPassFor(classicOrVIPGuest: entrant.entree)
    //
    //        } catch PassCreationError.wrongEntrantType {
    //            print("Pass not created... Wrong entrant type")
    //        } catch {
    //            fatalError("\(error)")
    //        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //======================
    
    // Test cases for free child
    
    //======================
    
    
    
    //        SUCCESS
    //        let entrant = ParkPass(forFreeChild: .freeChildGuest, dateOfBirthMMDDYYYY: "06/02/2015")
    
    
    
    //         FAILURE
    //        let entrant = ParkPass(forFreeChild: .freeChildGuest, dateOfBirthMMDDYYYY: "06/02/1999")
    
    
    //        do {
    //
    //            try entrant.createPassFor(childWithAge: entrant.dateOfBirth, entree: entrant.entree)
    //
    //
    //        } catch PassCreationError.invalidAge {
    //            print("Pass not created... Child not younger than 5")
    //
    //
    //        } catch PassCreationError.invalidBirthday {
    //            print("Pass not created... Please put in your date of birth in the following format mm/dd/yyyy")
    //
    //
    //        } catch PassCreationError.noAgeInput {
    //            print("Pass not created... Date of birth text field is required")
    //
    //
    //        } catch PassCreationError.wrongEntrantType {
    //            print("Pass not created... Wrong entrant type")
    //        } catch {
    //            fatalError("\(error)")
    //        }
    //
    //
    
    
    
    
    
    
    
    
    
    //=======================
    
    // Test case for employee
    
    //=======================
    
    
    //SUCCESS
    //        let entrant = ParkPass(forEmployeeOrManager: .hourlyMaintenanceEmployee, firstName: "jon", lastName: "Doe", streetAddress: "123 Random Street", city: "Best city", state: "Best State", zipCode: "N2Z 1L2")
    
    //FAILURE
    //        let entrant = ParkPass(forEmployeeOrManager: .hourlyMaintenanceEmployee, firstName: nil, lastName: "Doe", streetAddress: "123 Random Street", city: "Best city", state: "Best State", zipCode: nil)
    //
    //        do {
    
    //            try entrant.createPassFor(employeeOrManager: entrant.entree, firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode)
    //
    //        } catch PassCreationError.wrongEntrantType {
    //            print("Pass not created... Wrong entrant type")
    //
    //        } catch PassCreationError.missingRequiredInfo {
    //
    //            print("Pass not created... Please fill in all required info such as first name, last name, street address, city, state and zip code")
    //
    //        } catch {
    //    fatalError("\(error)")
    //    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //================
    
    // Test Case for Manager
    
    //================
    
    
    
    
    //SUCCESS
    //                let entrant = ParkPass(forEmployeeOrManager: .manager, firstName: "jon", lastName: "Doe", streetAddress: "123 Random Street", city: "Best city", state: "Best State", zipCode: "N2Z 1L2")
    
    
    //FAILED
    //        let entrant = ParkPass(forEmployeeOrManager: .manager, firstName: "jon", lastName: "Doe", streetAddress: nil, city: "Best city", state: nil, zipCode: "N2Z 1L2")
    
    
    
    //        do {
    
    
    
    //            try entrant.createPassFor(employeeOrManager: entrant.entree, firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode)
    //
    //        } catch PassCreationError.wrongEntrantType {
    //            print("Pass not created... Wrong entrant type")
    //
    //        } catch PassCreationError.missingRequiredInfo {
    //
    //            print("Pass not created... Please fill in all required info such as first name, last name, street address, city, state and zip code")
    //
    //        } catch {
    //            fatalError("\(error)")
    //        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //====================
    
    // Swipe Method tests (requires uncommented instance of ParkPass)
    
    //====================
    
    
    
    
    
    //Acces to amusement areas
    //        entrant.swipeForAccessTo(amusementAreaWith: entrant.entree)
    
    //Acces to kitchen area
    //        entrant.swipeForAccessTo(kitchenAreaWith: entrant.entree)
    
    //Acces to ride control area
    //        entrant.swipeForAccessTo(rideControlAreaWith: entrant.entree)
    
    //Acces to maintenance area
    //        entrant.swipeForAccessTo(maintenanceAreaWith: entrant.entree)
    
    //Acces to all Rides
    //        entrant.swipeForAccessTo(allRidesWith: entrant.entree)
    
    //Acces to skip lines
    //        entrant.swipeForAccessTo(skipLinesWith: entrant.entree)
    
    //Acces to get food discount
    //        entrant.swipeForAccessTo(discountOnFoodWith: entrant.entree)
    
    //Acces to get merchandise discount
    //        entrant.swipeForAccessTo(discountOnMerchandiseWith: entrant.entree)
    
    //Acces to office area
    //        entrant.swipeForAccessTo(officeAreaWith: entrant.entree)