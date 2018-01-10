//
//  BikesTableViewController.swift
//  Bikes
//
//  Created by Admin on 1/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class BikesTableViewController: UITableViewController {
    
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    var bikes = [Bike]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Setup Navigation Bar
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Bikes"
        
        FeedController().getBikesFeed(for: nil) { (results) in
            self.bikes = results ?? [Bike]()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(bikes.count)
        return bikes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell

        // Configure the cell...
        cell.titleLabel.text = bikes[indexPath.row].cleanTitle
        cell.brandLabel.text = bikes[indexPath.row].brand
        cell.ratingLabel.text = String(bikes[indexPath.row].rating)
        cell.priceLabel.text = bikes[indexPath.row].displayPrice.priceDisplay.price
        
        let imageUrl = URL(string: bikes[indexPath.row].thumbnailImageLink)
        NetworkController().getImageFromURL(url: imageUrl) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    cell.itemImageView.image = image
                }
            }
        }

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    @IBAction func didSelectCategory(_ sender: UISegmentedControl) {
        let feedController = FeedController()
        let category = feedController.categoryNameAtIndex(sender.selectedSegmentIndex)
        FeedController().getBikesFeed(for: category) { (results) in
            self.bikes = results ?? [Bike]()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
