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
        let installId = MSAppCenter.installId()
       //print("PUSH - InstallID: \(installId?.description ?? "none")")
        MSAppCenter.setUserId("jomedell")
         // Custom properties - segment users then send push notifications
        let customProperties = MSCustomProperties()
        customProperties.setString("Black", forKey: "Color")
        customProperties.setNumber(10, forKey: "Number")
        MSAppCenter.setCustomProperties(customProperties)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK Actions
    
    @IBAction func eventsButtonPressed(_ sender: UIButton) {
        
        MSAnalytics.trackEvent("custEvntWprop", withProperties: ["Cus1" : "one", "Cust2" : "two"])
        
        MSAnalytics.trackEvent("withNoDictionary")
        
        
       
    }
}
