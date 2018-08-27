//
//  ApproveStatusTableViewCell.swift
//  CertNetwork
//
//  Created by Thongpak on 25/8/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import UIKit
import UIGradient

class ApproveStatusTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameCertLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let color1 = UIColor.hex("2196F3")
        let color2 = UIColor.hex("64E3B2")
   //     let gradient = GradientLayer(direction: .leftToRight, colors: [color1, color2])
        containerView.layer.cornerRadius = 5
        containerView.clipsToBounds = true
        containerView.backgroundColor = UIColor.fromGradientWithDirection(.leftToRight, frame: frame, colors: [color1, color2])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectedBackgroundView = UIView()
        let color1 = UIColor.hex("2196F3")
        let color2 = UIColor.hex("64E3B2")
        containerView.backgroundColor = UIColor.fromGradientWithDirection(.leftToRight, frame: frame, colors: [color1, color2])
        
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        self.selectedBackgroundView = UIView()
        let color1 = UIColor.hex("2196F3")
        let color2 = UIColor.hex("64E3B2")
        containerView.backgroundColor = UIColor.fromGradientWithDirection(.leftToRight, frame: frame, colors: [color1, color2])
    }

}
