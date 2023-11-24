//
//  Home.swift
//  SmartHome
//
//  Created by Cormell, David - DPC on 24/11/2023.
//

import Foundation

class Home {
    var devices: [Device] = []
    
    func add(_ device: Device) {
        devices.append(device)
    }
    
    func getAllDevicesDescription() -> String {
        var description = ""
        
        for device in devices {
            description.append(device.display + "\n")
        }
        
        return description
    }
}

protocol Device {
    var display: String { get }
    
    func toggle()
    func turnOff()
    func turnOn()
}

protocol Colour {
    var colour: String { get set }
}

protocol Dimmable {
    var brightness: Int { get set }
    mutating func setBrightness(level: Int)
}

extension Dimmable {
    mutating func setBrightness(level: Int) {
        if level >= 100 {
            brightness = 100
        } else if level <= 0 {
            brightness = 0
        } else {
            brightness = level
        }
    }
}

class Bulb: Device {
    private var isOn: Bool = false
    private var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var display: String {
        return "\(name) Bulb is \(isOn ? "On":"Off")."
    }
    
    func toggle() {
        isOn.toggle()
    }
    
    func turnOff() {
        isOn = false
    }
    
    func turnOn() {
        isOn = true
    }
    
}

class PhilipsHueColourAmbiance: Bulb, Dimmable, Colour {
    var brightness: Int = 100
    var colour: String = "White"
}
