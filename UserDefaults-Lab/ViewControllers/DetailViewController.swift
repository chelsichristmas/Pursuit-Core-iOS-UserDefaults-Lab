//
//  DetailViewController.swift
//  UserDefaults-Lab
//
//  Created by Chelsi Christmas on 1/13/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var userName: String?
    var currentSign: String?
    var horoscopeInfo: Horosocope?
    @IBOutlet weak var signLabel: UILabel!
    
    @IBOutlet weak var horoscopeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI() {
        signLabel.text = currentSign
        
    }
    
    
    
}
