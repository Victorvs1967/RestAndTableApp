//
//  ViewController.swift
//  RestAndTableApp
//
//  Created by Victor Smirnov on 05/06/2019.
//  Copyright © 2019 Victor Smirnov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  let kApiKey = "c3a3a1f5bcmsh4cc8762b081790ap1fb4bcjsn4477ad658522"
  
  private let cardNames = [
    "Ysera",
    "Ancient Watcher",
    "Argent Protector",
    "Cruel Taskmaster",
    "Defias RingLeader",
    "Dire Wolf Alpha",
    "Doomsayer",
    "Eviscerate"
  ]
  
  var cards = [Card]() {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view
    tableView.register(CardTableViewCell.self, forCellReuseIdentifier: "Cell")
    tableView.register(UINib(nibName: "CardTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    tableView.rowHeight = UITableView.automaticDimension
    
    for name in cardNames {
      
      let urlString = "https://omgvamp-hearthstone-v1.p.rapidapi.com/cards/\(name)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
      var request = URLRequest(url: URL(string: urlString!)!)
      request.httpMethod = "GET"
      request.addValue(kApiKey, forHTTPHeaderField: "X-RapidAPI-Key")
      
      URLSession.shared.dataTask(with: request) { (data, request, error) in
        guard let cardsData = data else {
          print(error!)
          return
        }
        
        do {
          let card = try JSONDecoder().decode([Card].self, from: cardsData).first!
          self.cards.append(card)
        } catch {
          print(error)
        }
      }.resume()
    }
  }
  
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cards.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CardTableViewCell
    let card = cards[indexPath.row]
    
    cell.nameLabel.text = card.name
    cell.descriptionLabel.text = card.text
    
    do {
      cell.cardImageView.image = try UIImage(data: Data(contentsOf: URL(string: card.imagePath)!))!
    } catch {
      print(error)
    }
    return cell
  }
}
