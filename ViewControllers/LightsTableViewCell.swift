//
//  LightsTableViewCell.swift
//  Lights
//
//  Created by Boyan Krastev on 10/18/17.
//  Copyright © 2017 Boyan Krastev. All rights reserved.
//

import UIKit

protocol LightsTableViewCellDelegate {
    func switchChangeValue(cell: LightsTableViewCell)
}

class LightsTableViewCell: UITableViewCell {
   
    var delegate: LightsTableViewCellDelegate?
    var devicesIDs : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet weak var binarySwitchTitle: UILabel!
    @IBOutlet weak var cellSwitch: UISwitch!
    
    @IBAction func switchAction(_ sender: UISwitch) {
        delegate?.switchChangeValue(cell: self)
    }
    
}
