//
//  CardTableViewCell.swift
//  RestAndTableApp
//
//  Created by Victor Smirnov on 05/06/2019.
//  Copyright © 2019 Victor Smirnov. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

  @IBOutlet weak var cardImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
