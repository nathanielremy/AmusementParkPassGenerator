//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Nathaniel Remy on 2017-04-05.
//  Copyright © 2017 Nathaniel Remy. All rights reserved.
//

import UIKit




 public class ViewController: UIViewController {
    
    // Entrant Type
    var entree: Entrant?
    var entrant: ParkPass?
    
    
    // MARK: User Interface Properties
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var projectNumberTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    

    // MARK: UI Button Outlets
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var contractorButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    
    // Purple Placeholder View
    @IBOutlet weak var purplePlaceHolderView: UIView!
    
    // MARK: Programmatically Created Buttons
    // Guest Buttons
    lazy var classiGuestButton: UIButton = {
       let classic = UIButton()
        classic.translatesAutoresizingMaskIntoConstraints = false
        classic.backgroundColor = UIColor(red: 43/255.0, green: 50/255.0, blue: 57/255.0, alpha: 1.0)
        classic.setTitle("Classic", for: .normal)
        classic.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        classic.addTarget(self, action: #selector(ViewController.displayFormInput(_:)), for: .touchUpInside)
        
        return classic
    }()
    
    lazy var VIPGuestButton: UIButton = {
       let vip = UIButton()
        vip.translatesAutoresizingMaskIntoConstraints = false
        vip.backgroundColor = UIColor(red: 43/255.0, green: 50/255.0, blue: 57/255.0, alpha: 1.0)
        vip.setTitle("VIP", for: .normal)
        vip.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        vip.addTarget(self, action: #selector(ViewController.displayFormInput(_:)), for: .touchUpInside)
        
        return vip
    }()
    
    lazy var freeChildButton: UIButton = {
        let child = UIButton()
        child.translatesAutoresizingMaskIntoConstraints = false
        child.backgroundColor = UIColor(red: 43/255.0, green: 50/255.0, blue: 57/255.0, alpha: 1.0)
        child.setTitle("Child", for: .normal)
        child.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        child.addTarget(self, action: #selector(ViewController.displayFormInput(_:)), for: .touchUpInside)
        
        return child
    }()
    
    lazy var seasonPassButton: UIButton = {
       let season = UIButton()
        season.translatesAutoresizingMaskIntoConstraints = false
        season.backgroundColor = UIColor(red: 43/255.0, green: 50/255.0, blue: 57/255.0, alpha: 1.0)
        season.setTitle("Season Pass", for: .normal)
        season.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        season.addTarget(self, action: #selector(ViewController.displayFormInput(_:)), for: .touchUpInside)
        
        return season
    }()
    
    lazy var seniorGuestButton: UIButton = {
        let senior = UIButton()
        senior.translatesAutoresizingMaskIntoConstraints = false
        senior.backgroundColor = UIColor(red: 43/255.0, green: 50/255.0, blue: 57/255.0, alpha: 1.0)
        senior.setTitle("Senior", for: .normal)
        senior.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        senior.addTarget(self, action: #selector(ViewController.displayFormInput(_:)), for: .touchUpInside)
        
        return senior
    }()
    
    // Emloyee/Manager Buttons
    lazy var foodServiceButton: UIButton = {
        let food = UIButton()
        food.translatesAutoresizingMaskIntoConstraints = false
        food.backgroundColor = UIColor(red: 43/255.0, green: 50/255.0, blue: 57/255.0, alpha: 1.0)
        food.setTitle("Food Service", for: .normal)
        food.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        food.addTarget(self, action: #selector(ViewController.displayFormInput(_:)), for: .touchUpInside)
        
        return food
    }()
    
    lazy var rideServiceButton: UIButton = {
        let ride = UIButton()
        ride.translatesAutoresizingMaskIntoConstraints = false
        ride.backgroundColor = UIColor(red: 43/255.0, green: 50/255.0, blue: 57/255.0, alpha: 1.0)
        ride.setTitle("Ride Service", for: .normal)
        ride.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        ride.addTarget(self, action: #selector(ViewController.displayFormInput(_:)), for: .touchUpInside)
        
        return ride
    }()
    
    lazy var maintenanceButton: UIButton = {
        let maintenance = UIButton()
        maintenance.translatesAutoresizingMaskIntoConstraints = false
        maintenance.backgroundColor = UIColor(red: 43/255.0, green: 50/255.0, blue: 57/255.0, alpha: 1.0)
        maintenance.setTitle("Maintenance", for: .normal)
        maintenance.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        maintenance.addTarget(self, action: #selector(ViewController.displayFormInput(_:)), for: .touchUpInside)
        
        return maintenance
    }()
    
    lazy var managerButton: UIButton = {
       let manager = UIButton()
        manager.translatesAutoresizingMaskIntoConstraints = false
        manager.backgroundColor = UIColor(red: 43/255.0, green: 50/255.0, blue: 57/255.0, alpha: 1.0)
        manager.setTitle("Manager", for: .normal)
        manager.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        manager.addTarget(self, action: #selector(ViewController.displayFormInput(_:)), for: .touchUpInside)
        
        return manager
    }()
    
    // Contractor Button
    lazy var contractButton: UIButton = {
        let contractor = UIButton()
        contractor.translatesAutoresizingMaskIntoConstraints = false
        contractor.backgroundColor = UIColor(red: 43/255.0, green: 50/255.0, blue: 57/255.0, alpha: 1.0)
        contractor.setTitle("Contractor", for: .normal)
        contractor.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        contractor.addTarget(self, action: #selector(ViewController.displayFormInput(_:)), for: .touchUpInside)
        
        return contractor
    }()
    
    // Vendor Buttom
    lazy var vendButton: UIButton = {
        let vendor = UIButton()
        vendor.translatesAutoresizingMaskIntoConstraints = false
        vendor.backgroundColor = UIColor(red: 43/255.0, green: 50/255.0, blue: 57/255.0, alpha: 1.0)
        vendor.setTitle("Vendor", for: .normal)
        vendor.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        vendor.addTarget(self, action: #selector(ViewController.displayFormInput(_:)), for: .touchUpInside)
        
        return vendor
    }()
    

    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
   
    
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Show the correct entrant type options on the second nav bar
    @IBAction func displayEntrantSelection(_ sender: UIButton) {
        
        if sender == guestButton {
            view.addSubview(classiGuestButton)
            NSLayoutConstraint.activate([
                classiGuestButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.20),
                classiGuestButton.heightAnchor.constraint(equalToConstant: 25),
                classiGuestButton.leftAnchor.constraint(equalTo: view.leftAnchor),
                classiGuestButton.topAnchor.constraint(equalTo: guestButton.bottomAnchor)
                ])
            
            view.addSubview(VIPGuestButton)
            NSLayoutConstraint.activate([
                VIPGuestButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.20),
                VIPGuestButton.heightAnchor.constraint(equalTo: classiGuestButton.heightAnchor),
                VIPGuestButton.leftAnchor.constraint(equalTo: classiGuestButton.rightAnchor),
                VIPGuestButton.topAnchor.constraint(equalTo: employeeButton.bottomAnchor)
                ])
            
            view.addSubview(freeChildButton)
            NSLayoutConstraint.activate([
                freeChildButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.20),
                freeChildButton.heightAnchor.constraint(equalTo: classiGuestButton.heightAnchor),
                freeChildButton.leftAnchor.constraint(equalTo: VIPGuestButton.rightAnchor),
                freeChildButton.topAnchor.constraint(equalTo: employeeButton.bottomAnchor)
                
                ])
            
            view.addSubview(seasonPassButton)
            NSLayoutConstraint.activate([
                seasonPassButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.20),
                seasonPassButton.heightAnchor.constraint(equalTo: classiGuestButton.heightAnchor),
                seasonPassButton.leftAnchor.constraint(equalTo: freeChildButton.rightAnchor),
                seasonPassButton.topAnchor.constraint(equalTo: contractorButton.bottomAnchor)
                ])
            
            view.addSubview(seniorGuestButton)
            NSLayoutConstraint.activate([
                seniorGuestButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.20),
                seniorGuestButton.heightAnchor.constraint(equalTo: classiGuestButton.heightAnchor),
                seniorGuestButton.leftAnchor.constraint(equalTo: seasonPassButton.rightAnchor),
                seniorGuestButton.topAnchor.constraint(equalTo: vendorButton.bottomAnchor)
                ])
            
            
        } else if sender == employeeButton {
            view.addSubview(foodServiceButton)
            NSLayoutConstraint.activate([
                foodServiceButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
                foodServiceButton.heightAnchor.constraint(equalToConstant: 25),
                foodServiceButton.leftAnchor.constraint(equalTo: view.leftAnchor),
                foodServiceButton.topAnchor.constraint(equalTo: guestButton.bottomAnchor)
                ])
            
            view.addSubview(rideServiceButton)
            NSLayoutConstraint.activate([
                rideServiceButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
                rideServiceButton.heightAnchor.constraint(equalToConstant: 25),
                rideServiceButton.leftAnchor.constraint(equalTo: foodServiceButton.rightAnchor),
                rideServiceButton.topAnchor.constraint(equalTo: employeeButton.bottomAnchor)
                ])
            
            view.addSubview(maintenanceButton)
            NSLayoutConstraint.activate([
                maintenanceButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
                maintenanceButton.heightAnchor.constraint(equalToConstant: 25),
                maintenanceButton.leftAnchor.constraint(equalTo: rideServiceButton.rightAnchor),
                maintenanceButton.topAnchor.constraint(equalTo: contractorButton.bottomAnchor)
                ])
            
            view.addSubview(managerButton)
            NSLayoutConstraint.activate([
                managerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
                managerButton.heightAnchor.constraint(equalToConstant: 25),
                managerButton.leftAnchor.constraint(equalTo: maintenanceButton.rightAnchor),
                managerButton.topAnchor.constraint(equalTo: vendorButton.bottomAnchor)
                ])
            
        } else if sender == contractorButton {
            view.addSubview(contractButton)
            NSLayoutConstraint.activate([
                contractButton.widthAnchor.constraint(equalTo: view.widthAnchor),
                contractButton.heightAnchor.constraint(equalToConstant: 25),
                contractButton.leftAnchor.constraint(equalTo: view.leftAnchor),
                contractButton.topAnchor.constraint(equalTo: vendorButton.bottomAnchor)
                ])
            
        } else if sender == vendorButton {
            view.addSubview(vendButton)
            NSLayoutConstraint.activate([
                vendButton.widthAnchor.constraint(equalTo: view.widthAnchor),
                vendButton.heightAnchor.constraint(equalToConstant: 25),
                vendButton.leftAnchor.constraint(equalTo: view.leftAnchor),
                vendButton.topAnchor.constraint(equalTo: vendorButton.bottomAnchor)
                ])
        }
    }
    
    
    // Show user the correct text fields to fill out
    func displayFormInput(_ sender: UIButton) {
        
        disableAllForms()
        
        if sender == classiGuestButton {
            entree = .classicGuest
            // No user input required
    
        } else if sender == VIPGuestButton {
            entree = .VIPGuest
            // No user input required
            
        } else if sender == freeChildButton {
            entree = .freeChildGuest
            
            dateOfBirthTextField.isEnabled = true
            dateOfBirthTextField.alpha = 1.0
            
        } else if sender == seasonPassButton {
            entree = .seasonPassGuest
            
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            streetAddressTextField.isEnabled = true
            cityTextField.isEnabled = true
            stateTextField.isEnabled = true
            zipCodeTextField.isEnabled = true
            
            firstNameTextField.alpha = 1.0
            lastNameTextField.alpha = 1.0
            streetAddressTextField.alpha = 1.0
            cityTextField.alpha = 1.0
            stateTextField.alpha = 1.0
            zipCodeTextField.alpha = 1.0
            
        } else if sender == seniorGuestButton {
            entree = .seniorGuest
            
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            dateOfBirthTextField.isEnabled = true
            
            firstNameTextField.alpha = 1.0
            lastNameTextField.alpha = 1.0
            dateOfBirthTextField.alpha = 1.0
            
        } else if sender == foodServiceButton {
            entree = .hourlyFoodServiceEmployee
            
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            streetAddressTextField.isEnabled = true
            cityTextField.isEnabled = true
            stateTextField.isEnabled = true
            zipCodeTextField.isEnabled = true
            
            firstNameTextField.alpha = 1.0
            lastNameTextField.alpha = 1.0
            streetAddressTextField.alpha = 1.0
            cityTextField.alpha = 1.0
            stateTextField.alpha = 1.0
            zipCodeTextField.alpha = 1.0
            
        } else if sender == rideServiceButton {
            entree = .hourlyRideServiceEmployee
            
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            streetAddressTextField.isEnabled = true
            cityTextField.isEnabled = true
            stateTextField.isEnabled = true
            zipCodeTextField.isEnabled = true
            
            firstNameTextField.alpha = 1.0
            lastNameTextField.alpha = 1.0
            streetAddressTextField.alpha = 1.0
            cityTextField.alpha = 1.0
            stateTextField.alpha = 1.0
            zipCodeTextField.alpha = 1.0
            
        } else if sender == maintenanceButton {
            entree = .hourlyMaintenanceEmployee
            
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            streetAddressTextField.isEnabled = true
            cityTextField.isEnabled = true
            stateTextField.isEnabled = true
            zipCodeTextField.isEnabled = true
            
            firstNameTextField.alpha = 1.0
            lastNameTextField.alpha = 1.0
            streetAddressTextField.alpha = 1.0
            cityTextField.alpha = 1.0
            stateTextField.alpha = 1.0
            zipCodeTextField.alpha = 1.0
            
        } else if sender == managerButton {
            entree = .manager
            
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            streetAddressTextField.isEnabled = true
            cityTextField.isEnabled = true
            stateTextField.isEnabled = true
            zipCodeTextField.isEnabled = true
            
            firstNameTextField.alpha = 1.0
            lastNameTextField.alpha = 1.0
            streetAddressTextField.alpha = 1.0
            cityTextField.alpha = 1.0
            stateTextField.alpha = 1.0
            zipCodeTextField.alpha = 1.0
            
        } else if sender == contractButton {
            entree = .contractor
            
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            streetAddressTextField.isEnabled = true
            cityTextField.isEnabled = true
            stateTextField.isEnabled = true
            zipCodeTextField.isEnabled = true
            projectNumberTextField.isEnabled = true
            
            firstNameTextField.alpha = 1.0
            lastNameTextField.alpha = 1.0
            streetAddressTextField.alpha = 1.0
            cityTextField.alpha = 1.0
            stateTextField.alpha = 1.0
            zipCodeTextField.alpha = 1.0
            projectNumberTextField.alpha = 1.0
            
        } else if sender == vendButton {
            entree = .vendor
            
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            dateOfBirthTextField.isEnabled = true
            companyTextField.isEnabled = true
            
            firstNameTextField.alpha = 1.0
            lastNameTextField.alpha = 1.0
            dateOfBirthTextField.alpha = 1.0
            companyTextField.alpha = 1.0
            
        }
        
        printEntrantType()
    }
    
    
    func printEntrantType() {
        
        if entree == .classicGuest {
            print("classic guest")
        } else if entree == .VIPGuest {
            print("VIP")
        } else if entree == .freeChildGuest {
            print("Free child")
        } else if entree == .seasonPassGuest {
            print("Season Pass")
        } else if entree == .seniorGuest {
            print("Senior Guest")
        } else if entree == .hourlyFoodServiceEmployee {
            print("Food service employee")
        } else if entree == .hourlyRideServiceEmployee {
            print("Ride service employee")
        } else if entree == .hourlyMaintenanceEmployee {
            print("Maintenance employee")
        } else if entree == .manager {
            print("Manager")
        } else if entree == .contractor {
            print("Contractor")
        } else if entree == .vendor {
            print("Vendor")
        }
    }
    
    func disableAllForms() {
        firstNameTextField.text?.removeAll()
        lastNameTextField.text?.removeAll()
        dateOfBirthTextField.text?.removeAll()
        projectNumberTextField.text?.removeAll()
        companyTextField.text?.removeAll()
        streetAddressTextField.text?.removeAll()
        cityTextField.text?.removeAll()
        stateTextField.text?.removeAll()
        zipCodeTextField.text?.removeAll()
        
        firstNameTextField.isEnabled = false
        lastNameTextField.isEnabled = false
        dateOfBirthTextField.isEnabled = false
        projectNumberTextField.isEnabled = false
        companyTextField.isEnabled = false
        streetAddressTextField.isEnabled = false
        cityTextField.isEnabled = false
        stateTextField.isEnabled = false
        zipCodeTextField.isEnabled = false
        
        firstNameTextField.alpha = 0.3
        lastNameTextField.alpha = 0.3
        dateOfBirthTextField.alpha = 0.3
        projectNumberTextField.alpha = 0.3
        companyTextField.alpha = 0.3
        streetAddressTextField.alpha = 0.3
        cityTextField.alpha = 0.3
        stateTextField.alpha = 0.3
        zipCodeTextField.alpha = 0.3
    }
    
    
    
    
    // MARK: Generate Passes
    @IBAction func generatePass(_ sender: UIButton) {
        if let entree = entree {
            
            if entree == .classicGuest {
                entrant = ParkPass(forClassicGuest: entree)
            
            } else if entree == .VIPGuest {
                entrant = ParkPass(forVIPGuest: entree)
            
            } else if entree == .freeChildGuest {
                
                do {
                    try entrant = ParkPass(forFreeChild: entree, dateOfBirthMMDDYYYY: dateOfBirthTextField.text)
                    
                } catch PassCreationError.invalidAge {
                    alertViews(title: "Must be under 5 years old", message: "You are too old to obtain the free pass")
                    
                } catch PassCreationError.invaliDateFormat {
                    alertViews(title: "Invalid Date Format", message: "Please enter your birthdate in this format 'MM/DD/YYYY'")
                    
                } catch PassCreationError.missingRequiredInfo {
                    alertViews(title: "Missing required info", message: "Please fill out all highlighted text fields.")
                } catch {
                    fatalError()
                }
                
                
            } else if entree == .hourlyFoodServiceEmployee || entree == .hourlyRideServiceEmployee || entree == .hourlyMaintenanceEmployee || entree == .manager || entree == .seasonPassGuest {
                
                do {
                    try entrant = ParkPass(forEmployeeOrManagerOrSeasonPassGuest: entree, firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text)
                    
                } catch PassCreationError.missingRequiredInfo {
                    alertViews(title: "Missing required info", message: "Please fill out all highlighted text fields.")
                } catch {
                    fatalError()
                }
                
            } else if entree == .seniorGuest {
                
                do {
                    try entrant = ParkPass(forSeniorGuest: entree, firstName: firstNameTextField.text, lastName: lastNameTextField.text, dateOfBirthMMDDYYYY: dateOfBirthTextField.text)
                    
                } catch PassCreationError.invaliDateFormat {
                    alertViews(title: "Invalid Date Format", message: "Please enter your birthdate in this format 'MM/DD/YYYY'")
                } catch PassCreationError.missingRequiredInfo {
                    alertViews(title: "Missing required info", message: "Please fill out all highlighted text fields.")
                } catch {
                    fatalError()
                }
                
            } else if entree == .contractor {
                
                do {
                    try entrant = ParkPass(forContractor: entree, firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, projectNumber: projectNumberTextField.text)
                    
                } catch PassCreationError.invalidProjectNumber {
                    alertViews(title: "Invalid Project Number", message: "Valid projects are 1001, 1002, 1003, 2001, 2002")
                } catch PassCreationError.missingRequiredInfo {
                    alertViews(title: "Missing required info", message: "Please fill out all highlighted text fields.")
                } catch {
                    fatalError()
                }
                
            } else if entree == .vendor {
                
                do {
                    try entrant = ParkPass(forVendor: entree, firstName: firstNameTextField.text, lastName: lastNameTextField.text, company: companyTextField.text, dateOfBirthMMDDYYYY: dateOfBirthTextField.text)
                    
                } catch PassCreationError.invaliDateFormat {
                    alertViews(title: "Invalid Date Format", message: "Please enter your birthdate in this format 'MM/DD/YYYY'")
                } catch PassCreationError.invalidCompany {
                 alertViews(title: "Invalid Company", message: "Valid companies include Acme, Orkin, Fedex and NW Electrical")
                } catch PassCreationError.missingRequiredInfo {
                    alertViews(title: "Missing required info", message: "Please fill out all highlighted text fields.")
                } catch {
                    fatalError()
                }
                
            }
            
            
            
        } else {
            alertViews(title: "Select an Entrant Type", message: "Select a type from the nav bar up top.")
        }
        
        // Perform segue if all goes well
        if let entrant = entrant {
        performSegue(withIdentifier: "AccessTesting", sender: entrant)
        }
    }
    
    
    // Info to send to next UI
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? AccessTesting {
        
        if let entrant = entrant {
            
            destination.entrant = entrant
            
        }
        }
    }
    
    
    // Populate Data
    @IBAction func populateData() {
        
        if let entree = entree {
            
            if entree == .classicGuest || entree == .VIPGuest {
                alertViews(title: "No info needed", message: "Classic and VIP guests require no personal information")

            } else {
                
                if firstNameTextField.isEnabled {
                    firstNameTextField.text = "Jon"
                }
                
                if lastNameTextField.isEnabled {
                    lastNameTextField.text = "Doe"
                }
                
                if dateOfBirthTextField.isEnabled {
                    if entree == .freeChildGuest {
                        dateOfBirthTextField.text = "06/02/2016"
                    } else {
                        dateOfBirthTextField.text = "06/02/1944"
                    }
                }
                
                if projectNumberTextField.isEnabled {
                    projectNumberTextField.text = "2001"
                }
                
                if companyTextField.isEnabled {
                    companyTextField.text = "Acme"
                }
                
                if streetAddressTextField.isEnabled {
                    streetAddressTextField.text = "1234 Random Street"
                }
                
                if cityTextField.isEnabled {
                    cityTextField.text = "Los Angeles"
                }
                
                if stateTextField.isEnabled {
                    stateTextField.text = "California"
                }
                
                if zipCodeTextField.isEnabled {
                    zipCodeTextField.text = "J7T 9Q3"
                }
                
                
            }
            
            
        } else {
            
            alertViews(title: "No Entrant Type Selected", message: "Select an entrant type to find out required data")
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
    // Easy acces to perform alert views
    func alertViews(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
        
    }
    
}

























































