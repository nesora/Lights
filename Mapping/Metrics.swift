//
//  Metrics.swift
//  Lights
//
//  Created by Boyan Krastev on 10/17/17.
//  Copyright © 2017 Boyan Krastev. All rights reserved.
//

import Foundation
import SwiftyJSON

class Metrics {
    
    var change = ""
    var isFailed = false
    var title = ""
    var level = ""
    var lastLevel = ""
    var icon = ""
    var modificationTime = ""
    
    init(json: [String: Any]) {
        
        change = json["change"] as? String ?? ""
        isFailed = json["isFailed"] as? Bool ?? false
        title = json["title"] as? String ?? ""
        level = json["level"] as? String ?? ""
        lastLevel = json["lastLevel"] as? String ?? ""
        icon = json["icon"] as? String ?? ""
        modificationTime = json["modificationTime"] as? String ?? ""
        
    }
    
}
