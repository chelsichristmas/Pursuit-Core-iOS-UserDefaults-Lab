//
//  ViewController.swift
//  UserDefaults-Lab
//
//  Created by Chelsi Christmas on 1/13/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var horoscopeArray = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
    
    var currentName = ""
    var currentSign = UserDefaults.standard.object(forKey: UserPreferenceKey.userHoroscope) ?? "No horoscope found"

    var currentSignForAPI = ""
    var username = UserDefaults.standard.object(forKey: UserPreferenceKey.username) ?? "No username found"
    // var horoscopeInfo: Horoscope?
            
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var signPicker: UIPickerView!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signPicker.dataSource = self
        signPicker.delegate = self
        nameTextField.delegate = self
        print("Username: \(username) Sign: \(currentSign)")
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailViewController = segue.destination as? DetailViewController else {
            fatalError("Unable to access detail view controller")
        }
        
        detailViewController.currentSign = currentSign as? String
        detailViewController.currentSignForAPI = currentSignForAPI
        detailViewController.username = username as? String
        
    }
    
    
    
    @IBAction func next(_ sender: UIButton) {
      
        
    }
    
    
    
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return horoscopeArray.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return horoscopeArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentSign = horoscopeArray[row]
        UserDefaults.standard.set(currentSign, forKey: UserPreferenceKey.userHoroscope)
        currentSignForAPI = horoscopeArray[row].lowercased()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = nameTextField!.text {
        username = text
            textField.resignFirstResponder()
            UserDefaults.standard.set(username, forKey: UserPreferenceKey.username)
            username = UserDefaults.standard.object(forKey: UserPreferenceKey.username) as! String
            print(username)
       
            return true
            
        }
        return true
    }
}
