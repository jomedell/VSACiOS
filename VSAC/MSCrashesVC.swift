//
//  MSCrashesVC.swift
//  VSAC
//
//  Created by Jorge Medellin on 12/28/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import Foundation
import UIKit
import AppCenterCrashes
import AppCenter

class MSCrashesVC: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var crashLabel: UILabel!
    @IBOutlet weak var crashButton: UIButton!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK Actions
    
    @IBAction func crashesButtonPressed(_ sender: UIButton) {
        
        MSCrashes.generateTestCrash()
    }
}
