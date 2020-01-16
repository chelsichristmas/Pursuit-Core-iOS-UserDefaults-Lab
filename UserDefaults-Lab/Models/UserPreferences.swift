//
//  UserPreferences.swift
//  UserDefaults-Lab
//
//  Created by Chelsi Christmas on 1/14/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import Foundation

enum Username: String {
    case username = "Username"
    case noUsername = "No Username"
}

struct UserPreferenceKey {
    static let username = "No Username"
    static let userHoroscope = "No Horoscope"
}


class UserPreference {
    
    // a Singleton's  intializer NEEDS to be private - this ensures that only one instance  of this class is used through out the application
    
    private init() {}
    
    
    
    static let shared = UserPreference()
        
    func updateUserName(with unit: Username)  {
        // storing or persisting the unit measuremnt value to UserDefaults (device or simulator as permanent storage
        
        // UserDefaults.standard is a Singleton in iOS that gives us access to saving and retrieving data in the device or simulator
        
        // This is the one line needed to save data to a device
        UserDefaults.standard.set(unit.rawValue, forKey:
            UserPreferenceKey.username)
        
        // key is "Unit Measuremnt"
        // value is either "Miles" or "Kilometers"
        // UserDefaultas: ["Unit Measurement" : "Kilometers"]
    }
    
    // retrieve a user default value (object)
   
    
    
}
