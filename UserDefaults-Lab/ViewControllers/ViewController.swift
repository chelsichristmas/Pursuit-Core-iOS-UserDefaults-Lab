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
    var currentSign: String?
    var currentSignForAPI: String?
    var horoscopeInfo: Horoscope?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var signPicker: UIPickerView!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signPicker.dataSource = self
        signPicker.delegate = self
    }

    
    
    
    @IBAction func next(_ sender: Any) {
        HoroscopeAPI.fetchHoroscope(sign: currentSignForAPI ?? "aries", completion:  { (result) in
            switch result{
            case .failure(let appError):
                print("error \(appError)")
            case .success(let horoscopeInfo):
                DispatchQueue.main.async {
                    self.horoscopeInfo = horoscopeInfo
                }
            }
            
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailViewController = segue.destination as? DetailViewController else {
            fatalError("Unable to access detail view controller")
        }
        
        detailViewController.currentSign = currentSign
        detailViewController.currentSignForAPI = currentSignForAPI
        detailViewController.horoscopeInfo = horoscopeInfo
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
        
        
        currentSign = horoscopeArray[row]
        currentSignForAPI = horoscopeArray[row].lowercased()
        
        return horoscopeArray[row]
    }
}

