//
//  ViewController.swift
//  Lights
//
//  Created by Boyan Krastev on 10/12/17.
//  Copyright © 2017 Boyan Krastev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LightsViewController: UIViewController , UITableViewDataSource , UITableViewDelegate , LightsTableViewCellDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var devices = [Device]()
    var authorizationHeaders = Authorization.authorizationInstance.headers
    var urlString = Authorization.authorizationInstance.urlString
    var state: Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:  - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "lightsCell", for: indexPath) as! LightsTableViewCell
        let devicesPath = self.devices[indexPath.row]
        
        if ( devicesPath.metrics?.level == "on") {
            state = true
        } else {
            state = false
        }
        
        cell.binarySwitchTitle?.text = devicesPath.metrics?.title
        cell.cellSwitch?.setOn(state, animated: false)
        cell.devicesIDs = devicesPath.deviceId
        cell.delegate = self
        
        return cell
    }
    
    // MARK: - LightTableViewCellDelegate
    
    func switchChangeValue(cell: LightsTableViewCell) {
        
        guard let switchValue = cell.cellSwitch  else {
            print(" State of switch is broken ")
            return
        }
        
        guard let device = cell.devicesIDs else {
            print(" No device IDs ")
            return
        }
        
        if switchValue.isOn {
            Alamofire.request("\(urlString)/\(device)/command/on", headers: authorizationHeaders)
        } else {
            Alamofire.request("\(urlString)/\(device)/command/off", headers: authorizationHeaders)
        }
    }
    
}
