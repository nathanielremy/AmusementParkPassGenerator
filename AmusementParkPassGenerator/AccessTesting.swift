//
//  AccessTesting.swift
//  AmusementParkPassGenerator
//
//  Created by Nathaniel Remy on 2017-04-19.
//  Copyright © 2017 Nathaniel Remy. All rights reserved.
//

import UIKit

class AccessTesting: UIViewController {
    
    var entrant: ParkPass?
    
    // MARK: User Interface Stored properties
    
    @IBOutlet weak var entrantNameLabel: UILabel!
    @IBOutlet weak var entrantTypeLabel: UILabel!
    @IBOutlet weak var testResultsView: UIView!
    @IBOutlet weak var testResutsLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Make sure info has been transmitted or else crash the app
        // Allows me to force unwrap
        guard let _ = entrant else { fatalError() }
        
        
        
        testResultsView.backgroundColor = .white
        testResutsLabel.text = "Test Results"
        
        passDesignSetUp()
        
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    @IBAction func dismissView(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    // AMUSEMENT AREA ACCESS
    @IBAction func amusementAreaAccess() {
        
        if entrant!.swipeForAccessTo(amusementAreaWith: entrant!) {
            
            testResutsLabel.text = "Access to amusement area granted"
            testResultsView.backgroundColor = .green
            
        } else {
            
            testResutsLabel.text = "Access to amusement area denied"
            testResultsView.backgroundColor = .red
            
        }
        
        
    }
    
    
    // KITCHEN AREA ACCESS
    @IBAction func kitchenAreaAccess() {
        
        if entrant!.swipeForAccessTo(kitchenAreaWith: entrant!) {
            
            testResutsLabel.text = "Access to kitchen area granted"
            testResultsView.backgroundColor = .green
            
        } else {
            
            testResutsLabel.text = "Access to kitchen area denied"
            testResultsView.backgroundColor = .red
            
        }
        
    }
    
    
    // RIDE CONTROL AREA ACCESS
    @IBAction func rideControlAccess() {
        
        if entrant!.swipeForAccessTo(rideControlAreaWith: entrant!) {
            
            testResutsLabel.text = "Access to ride control area granted"
            testResultsView.backgroundColor = .green
            
        } else {
            
            testResutsLabel.text = "Access to ride control area denied"
            testResultsView.backgroundColor = .red
            
        }
        
    }
    
    
    // ACCESS MAINTENANCE AREA
    @IBAction func maintenanceAreaAccess() {
        
        if entrant!.swipeForAccessTo(maintenanceAreaWith: entrant!) {
            
            testResutsLabel.text = "Access to maintenance area granted"
            testResultsView.backgroundColor = .green
            
        } else {
            
            testResutsLabel.text = "Access to maintenance area denied"
            testResultsView.backgroundColor = .red
            
        }
        
    }
    
    
    // OFFICE AREA ACCESS
    @IBAction func officeAreaAccess() {
        
        if entrant!.swipeForAccessTo(officeAreaWith: entrant!) {
            
            testResutsLabel.text = "Access to office area granted"
            testResultsView.backgroundColor = .green
            
        } else {
            
            testResutsLabel.text = "Access to office area denied"
            testResultsView.backgroundColor = .red
            
        }
        
    }
    
    
    // ACCESS ALL RIDES
    @IBAction func accessAllRides() {
        
        if entrant!.swipeForAccessTo(allRidesWith: entrant!) {
            
            testResutsLabel.text = "Access to all rides granted"
            testResultsView.backgroundColor = .green
            
        } else {
            
            testResutsLabel.text = "Access to all rides denied"
            testResultsView.backgroundColor = .red
            
        }
        
    }
    
    
    // SKIP LINES
    @IBAction func canSkipLines() {
        
        if entrant!.swipeForAccessTo(skipLinesWith: entrant!) {
            
            testResutsLabel.text = "Access to skip lines granted"
            testResultsView.backgroundColor = .green
            
        } else {
            
            testResutsLabel.text = "Access to skip lines denied"
            testResultsView.backgroundColor = .red
            
        }
        
    }
    
    
    // FOOD DISCOUNT
    @IBAction func foodDiscountAccess() {
        
        let discount = entrant!.swipeForAccessTo(discountOnFoodWith: entrant!)
        
        if discount == "Access to food discount denied" {
            testResutsLabel.text = discount
            testResultsView.backgroundColor = .red
            
        } else {
         
            testResutsLabel.text = discount
            testResultsView.backgroundColor = .green
            
        }
        
        
    }
    
    
    // MERCHANDISE DISCOUNT
   @IBAction func merchandiseDiscountAccess() {
        
        let discount = entrant!.swipeForAccessTo(discountOnMerchandiseWith: entrant!)
        
        if discount == "Access to merchandise discount denied" {
            testResutsLabel.text = discount
            testResultsView.backgroundColor = .red
            
        } else {
            
            testResutsLabel.text = discount
            testResultsView.backgroundColor = .green
            
        }
        
    }
    

    
    func passDesignSetUp() {
        
        entrantNameLabel.isHidden = false
        entrantTypeLabel.isHidden = false
        
        if let entrant = entrant {
            
            if let entrantFirstName = entrant.firstName, let entrantLastName = entrant.lastName {
                
                entrantNameLabel.text = "\(entrantFirstName) \(entrantLastName)"
                
                if entrant.entree == .classicGuest {
                    entrantTypeLabel.text = "Classic Guest"
                    
                } else if entrant.entree == .VIPGuest {
                    entrantTypeLabel.text = "VIP Guest"
                    
                } else if  entrant.entree == .freeChildGuest {
                    entrantTypeLabel.text = "Free Child"
                    
                } else if entrant.entree == .hourlyFoodServiceEmployee {
                    entrantTypeLabel.text = "Food Service Employee"
                    
                } else if entrant.entree == .hourlyRideServiceEmployee {
                    entrantTypeLabel.text = "Ride Service Employee"
                    
                } else if entrant.entree == .hourlyMaintenanceEmployee {
                    entrantTypeLabel.text = "Maintenance Employee"
                    
                } else if entrant.entree == .manager {
                    entrantTypeLabel.text = "Manager"
                    
                } else if entrant.entree == .seasonPassGuest {
                    entrantTypeLabel.text = "Season Pass"
                    
                } else if entrant.entree == .contractor {
                    entrantTypeLabel.text = "Contractor"
                    
                } else if entrant.entree == .seniorGuest {
                    entrantTypeLabel.text = "Senior Guest"
                    
                } else if entrant.entree == .vendor {
                    entrantTypeLabel.text = "Vendor"
                    
                }
                
            } else  {
                
                entrantTypeLabel.isHidden = true
                
                if entrant.entree == .classicGuest {
                    entrantNameLabel.text = "Classic Guest"
                    
                } else if entrant.entree == .VIPGuest {
                    entrantNameLabel.text = "VIP Guest"
                    
                } else if  entrant.entree == .freeChildGuest {
                    entrantNameLabel.text = "Free Child"
                    
                } else if entrant.entree == .hourlyFoodServiceEmployee {
                    entrantNameLabel.text = "Food Service Employee"
                    
                } else if entrant.entree == .hourlyRideServiceEmployee {
                    entrantNameLabel.text = "Ride Service Employee"
                    
                } else if entrant.entree == .hourlyMaintenanceEmployee {
                    entrantNameLabel.text = "Maintenance Employee"
                    
                } else if entrant.entree == .manager {
                    entrantNameLabel.text = "Manager"
                    
                } else if entrant.entree == .seasonPassGuest {
                    entrantNameLabel.text = "Season Pass"
                    
                } else if entrant.entree == .contractor {
                    entrantNameLabel.text = "Contractor"
                    
                } else if entrant.entree == .seniorGuest {
                    entrantNameLabel.text = "Senior Guest"
                    
                } else if entrant.entree == .vendor {
                    entrantNameLabel.text = "Vendor"
                    
                }
                
                
                
            }
            
            
            
        } else {
            fatalError()
        }
        
    }
    
    

}






























