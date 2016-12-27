//
//  podcastCollectionViewController.swift
//  longform
//
//  Created by Mac on 12/25/16.
//  Copyright © 2016 This Agora. All rights reserved.
//

import UIKit
import Alamofire

private let reuseIdentifier = "podcastCollectionViewCell"

class podcastCollectionViewController: UICollectionViewController {
    //MARK: Properties
    var podcastLibrary = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        getAllPodcastFromServer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print(podcastLibrary.count)
        return podcastLibrary.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? podcastCollectionViewCell else {
            fatalError("The dequeued cell is not an instance of podcastCell.")
        }
        print("title")
        // Configure the cell
        if podcastLibrary.count != 0 {
            if let titleDict = podcastLibrary[indexPath.row] as? NSDictionary {
                if let titleText = titleDict["name"] as? String
                {
                    cell.podcastTitle.text = titleText
                    cell.podcastId = titleDict["id"] as! Int64
                    
                }
            }
        }
        return cell
    }
    private func getAllPodcastFromServer() {
        Alamofire.request("http://localhost:8888/php/getAllPodcast.php").responseJSON { response in
            if let result = response.result.value {
                self.podcastLibrary = result as! NSArray
                self.collectionView?.reloadData()
//                print(result)
            }
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
