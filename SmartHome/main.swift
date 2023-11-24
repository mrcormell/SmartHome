//
//  main.swift
//  SmartHome
//
//  Created by Cormell, David - DPC on 24/11/2023.
//

import Foundation

func displayMainMenu() {
    print("""
          Welcome to your SMART Home, what would you like to do?
          1. Add a SMART Device
          2. Interact with a device
          3. View the status of all your devices
          4. Quit
          """)
}

let home = Home()
var selection = ""
repeat {
    displayMainMenu()
    if let input = readLine() {
        selection = input
        switch input {
        case "1":
            home.add(Bulb(name: "Living Room"))
            home.add(PhilipsHueColourAmbiance(name: "Kitchen"))
        case "2":
            print("Selected 2")
        case "3":
            print(home.getAllDevicesDescription())
        case "4":
            print("Quitting...")
        default:
            print("Invalid option selected")
        }
    }
} while selection != "4"
            
print("Exited SMART Home App")


