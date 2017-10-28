//
//  Authorization.swift
//  Lights
//
//  Created by Boyan Krastev on 10/12/17.
//  Copyright © 2017 Boyan Krastev. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

class Authorization {
    
    static var authorizationInstance = Authorization()

    let urlString = "http://10.10.0.10:8083/ZAutomation/api/v1/devices"
    var headers: HTTPHeaders = [:]
    var devicesArray = [Device]()

    func authorizationRequest(userName: String, userPassword: String, completion:@escaping (_ arrResponse: [Device]?) -> Void) {
    
        if let authorizationHeader = Request.authorizationHeader(user: userName, password: userPassword) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        Alamofire.request(urlString, headers: headers)
            .responseJSON { response in
                let json = JSON(response.result.value as Any)
                let jsonDict =  json["data"].dictionaryValue
                
                guard let devices = jsonDict["devices"]?.arrayObject else {
                    print(" No devices available at this time or wrong username/password")
                    return
                }
            
                for subJson in devices {
                    guard let object = subJson as? [String: Any] else {
                        continue
                    }
                    let device = Device.init(json: object)
                    if device.deviceType == "switchBinary" {
                        self.devicesArray.append(device)
                    }
                }
               completion(self.devicesArray)
        }
       
    }
    
}
