//
//  MSEventsVC.swift
//  VSAC
//
//  Created by Jorge Medellin on 12/28/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import Foundation
import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterPush

class MSEventsVC: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var eventButton: UIButton!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: move to MSPushVC
        var installId = MSAppCenter.installId()
        print("PUSH - InstallID: \(installId?.description)")
        
        var customProperties = MSCustomProperties()
        customProperties.setString("Black", forKey: "Color")
        customProperties.setNumber(10, forKey: "Number")
        MSAppCenter.setCustomProperties(customProperties)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK Actions
    
    @IBAction func eventsButtonPressed(_ sender: UIButton) {
        
        MSAnalytics.trackEvent("Custom event button pressed")
    }
}
