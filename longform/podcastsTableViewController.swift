//
//  podcastsTableViewController.swift
//  longform
//
//  Created by Mac on 12/25/16.
//  Copyright © 2016 This Agora. All rights reserved.
//

import UIKit
import Alamofire

class podcastsTableViewController: UITableViewController {
    //MARK: Properties
    var podcastsLibrary = NSArray()
    var podcastId = Int64()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        populatePodcastsFromServer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return podcastsLibrary.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "podcastsCell", for: indexPath) as? podcastsTableViewCell else {
            fatalError("The dequeued cell is not an instance of podcastsCell.")
        }

//         Configure the cell...
        let podcastDictionary = podcastsLibrary[indexPath.row] as! NSDictionary
        cell.podcastTitle.text = podcastDictionary["name"] as? String
        cell.podcastDescription.text = podcastDictionary["description"] as! String
        cell.locationString = podcastDictionary["location"] as! String
        return cell
    }
    private func populatePodcastsFromServer() {
        print(UniversalPlayer.selectedPodcastId)
        let parameters: Parameters = [
                    "id": UniversalPlayer.selectedPodcastId
        ]
        Alamofire.request("http://localhost:8888/php/getAllPodcastsWithId.php", parameters: parameters).responseJSON { response in
            
            if let result = response.result.value {
                self.podcastsLibrary = result as! NSArray
                self.tableView.reloadData()
            }
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
