//
//  UserTableViewCell.swift
//  CertNetwork
//
//  Created by Thongpak on 25/8/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.image = #imageLiteral(resourceName: "gim")
        profileImageView.layer.cornerRadius = profileImageView.layer.height / 2
        profileImageView.clipsToBounds = true
        nameLabel.text = "Thongpak Pongsilathong"
        addressLabel.text = HDWallet.shared.getAddress()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
