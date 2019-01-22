//
//  AmigosTableViewCell.swift
//  CoreDataApp
//
//  Created by Adrián Rodríguez Escudero on 06/01/2019.
//  Copyright © 2019 Adrián Rodríguez Escudero. All rights reserved.
//

import UIKit

class AlumnosTableViewCell: UITableViewCell {

    @IBOutlet weak var nombreTxt: UILabel!
    @IBOutlet weak var apellidosTxt: UILabel!
    @IBOutlet weak var dniTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
