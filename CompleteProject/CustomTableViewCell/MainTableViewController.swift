//
//  MainTableViewController.swift
//  CustomTableViewCell
//
//  Created by Peterson Cemoin on 11/11/19.
//  Copyright © 2019 YourAreAwesome. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var actors : [Actor]!
    var rowHeight : CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assuming you're developing for only iPhone and Ipad, otherwise do more checks for other apple devices
        self.rowHeight = UIScreen.main.traitCollection.userInterfaceIdiom == .phone ? 152 : 75
        self.tableView.rowHeight = self.rowHeight
        
        self.actors = getActors()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.actors.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cast the cell to an ActorTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ActorTableViewCell
        
        //get our cell data
        let actor = self.actors[indexPath.row]
        
        //set values
        cell.actorImage.image = UIImage(named:"\(actor.firstName)_\(actor.lastName).jpg")
        cell.fullName.text = "  FullName: \(actor.firstName) \(actor.lastName)"
        cell.email.text = "  Email: \(actor.email)"
        cell.rating.text = "  Overall Rating: \(actor.rating)"
        
        //transform image shape from square to circle
        cell.actorImage.layer.cornerRadius =  UIScreen.main.traitCollection.userInterfaceIdiom == .pad ? cell.actorImage.frame.width / 4 : cell.actorImage.frame.width / 2
        cell.actorImage.layer.masksToBounds = true
        
        /*
         Smaller circle looks like a square. To make sure you can actually see a circle, I had to divide by 4 vs 2. 
         */

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    func getActors()-> [Actor]{
        return [
            Actor(firstName: "Denzel", lastName: "Washington", email: "denzel@washington.com", rating: 3.7),
            Actor(firstName: "Johnny", lastName: "Depp", email: "johnny@depp.com", rating: 3.4),
            Actor(firstName: "Al", lastName: "Pacino", email: "al@pacino.com", rating: 3.8),
            Actor(firstName: "Robert", lastName: "DeNiro", email: "robert@deniro.com", rating: 3.3),
            Actor(firstName: "Russell", lastName: "Crowe", email: "russell@crowe.com", rating: 3.5),
            Actor(firstName: "Brad", lastName: "Pitt", email: "brad@pitt.com", rating: 3.8),
            Actor(firstName: "Denzel", lastName: "Washington", email: "denzel@washington.com", rating: 3.7),
            Actor(firstName: "Johnny", lastName: "Depp", email: "johnny@depp.com", rating: 3.4),
            Actor(firstName: "Al", lastName: "Pacino", email: "al@pacino.com", rating: 3.8),
            Actor(firstName: "Robert", lastName: "DeNiro", email: "robert@deniro.com", rating: 3.3),
            Actor(firstName: "Russell", lastName: "Crowe", email: "russell@crowe.com", rating: 3.5),
            Actor(firstName: "Brad", lastName: "Pitt", email: "brad@pitt.com", rating: 3.8),
            Actor(firstName: "Denzel", lastName: "Washington", email: "denzel@washington.com", rating: 3.7),
            Actor(firstName: "Johnny", lastName: "Depp", email: "johnny@depp.com", rating: 3.4),
            Actor(firstName: "Al", lastName: "Pacino", email: "al@pacino.com", rating: 3.8),
            Actor(firstName: "Robert", lastName: "DeNiro", email: "robert@deniro.com", rating: 3.3),
            Actor(firstName: "Russell", lastName: "Crowe", email: "russell@crowe.com", rating: 3.5),
            Actor(firstName: "Brad", lastName: "Pitt", email: "brad@pitt.com", rating: 3.8)
        ]
    }
}
