//
//  Card.swift
//  RestAndTableApp
//
//  Created by Victor Smirnov on 05/06/2019.
//  Copyright © 2019 Victor Smirnov. All rights reserved.
//

import Foundation

class Card: Codable {
  
  let name: String
  let manaCost: Int
  let text: String
  let imagePath: String
  
  init(name: String, manaCost: Int, text: String, imagePath: String) {
    
    self.name = name
    self.manaCost = manaCost
    self.text = text
    self.imagePath = imagePath
  }
  
  enum CodingKeys: String, CodingKey {
    
    case name = "name"
    case manaCost = "cost"
    case text = "text"
    case imagePath = "img"
  }
  
}
