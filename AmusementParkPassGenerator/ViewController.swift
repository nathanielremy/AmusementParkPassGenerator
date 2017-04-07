//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Nathaniel Remy on 2017-04-05.
//  Copyright © 2017 Nathaniel Remy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let me = ParkPass(forClassicGuest: .manager)
        
        let me1 = ParkPass(forEmployeeOrManager: .VIPGuest, firstName: "Nathaniel", lastName: "Remy", streetAddress: "123 Random Street", city: "Random City", state: "Random State", zipCode: "C3Y 3P2")
        
        me1.swipeForAccessTo(amusementAreaWith: me1.entree)
        
        me1.swipeForAccessTo(kitchenAreaWith: me1.entree)
        
        me1.swipeForAccessTo(rideControlAreaWith: me1.entree)
        
        me1.swipeForAccessTo(maintenanceAreaWith: me1.entree)
        
        me1.swipeForAccessTo(allRidesWith: me1.entree)
        
        me1.swipeForAccessTo(skipLinesWith: me1.entree)
        
        me1.swipeForAccessTo(discountOnFoodWith: me1.entree)
        
        me1.swipeForAccessTo(discountOnMerchandiseWith: me1.entree)
        
        
        
        
//        do {
//            
//            // ========================================
//            
//            try me.createPassFor(classicOrVIPGuest: me.entree)
//            
//            // ========================================
//            
//        } catch PassCreationError.wrongEntrantType {
//            print("Pass not created... Wrong entrant type")
//            
//        } catch {
//            fatalError("\(error)")
//            
//        }
//        
//        
//        do {
//            try me1.createPassFor(employeeOrManager: me1.entree, firstName: me1.firstName, lastName: me1.lastName, streetAddress: me1.streetAddress, city: me1.city, state: me1.state, zipCode: me1.zipCode)
//            
//            
//        } catch PassCreationError.missingRequiredInfo {
//            print("Please fill out the required personal information such first name, last name, address, city, state and zip code")
//        } catch PassCreationError.wrongEntrantType {
//            print("Pass not created... Wrong entrant type")
//        } catch {
//            fatalError("\(error)")
//        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

