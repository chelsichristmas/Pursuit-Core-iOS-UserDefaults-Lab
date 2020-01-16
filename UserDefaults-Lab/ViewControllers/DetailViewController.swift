//
//  DetailViewController.swift
//  UserDefaults-Lab
//
//  Created by Chelsi Christmas on 1/13/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var username: String?
    var currentSign: String?
    var currentSignForAPI: String?
    var horoscopeInfo: Horoscope?
    
    
    @IBOutlet weak var signLabel: UILabel!
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var horoscopeLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        print("Username: \(username) currentSign: \(currentSign)")
    }
    
    func updateUI() {
        signLabel.text = currentSign
        
        
    
        HoroscopeAPI.fetchHoroscope(sign: currentSignForAPI!) { (result) in
                switch result {
                case .failure(let appError):
                    print("Could not retrieve horoscope: \(appError)")
                case .success(let horoscopeInfo):
                    DispatchQueue.main.async{
                    self.horoscopeInfo = horoscopeInfo
                        self.horoscopeLabel.text = horoscopeInfo.horoscope
                        self.greetingLabel.text = "Hello \(self.username!). Your horoscope for the day can be found below"
                    }
                }
        
        }
    }

    @IBAction func reset(_ sender: Any) {
        UserDefaults.standard.set(nil, forKey: UserPreferenceKey.username)
        
    }
}
