//
//  Device.swift
//  Lights
//
//  Created by Boyan Krastev on 10/17/17.
//  Copyright © 2017 Boyan Krastev. All rights reserved.
//

import Foundation
import SwiftyJSON

class Device {
    
    var metrics: Metrics?
    
    var deviceType = ""
    var visibility = false
    var hasHistory = false
    var deviceId = ""
    
    init(json: [String: Any]) {
        deviceType = json["deviceType"] as? String ?? ""
        visibility = json["visibility"] as? Bool ?? false
        hasHistory = json["hasHistory"] as? Bool ?? false
        deviceId = json["id"] as? String ?? ""
        
        if let checkForMetrics = json["metrics"] as? [String: Any] {
            
            metrics = Metrics(json: checkForMetrics)
        }
    }
    
}
