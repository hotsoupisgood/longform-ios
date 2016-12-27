//
//  LibraryViewController.swift
//  longform
//
//  Created by Mac on 12/22/16.
//  Copyright © 2016 This Agora. All rights reserved.
//

import UIKit
import Alamofire

class LibraryViewController: UIViewController {
    var podcastLibrary = NSArray()
    
    @IBOutlet weak var podcastTable: UICollectionView!
    @IBOutlet weak var podcastsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        populatePodcast()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func populatePodcast() {
        Alamofire.request("http://localhost:8888/php/getAllPodcast.php").responseJSON { response in
            if let result = response.result.value {
                self.podcastLibrary = result as! NSArray
                self.podcastTable.reloadData()
                print(result)
            }
        }
    }
    @IBAction func pressedCell(_ sender: UIButton) {
        podcastsTable.reloadData()
    }
}

extension LibraryViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("count: \(podcastLibrary.count)")
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "podcastCell", for: indexPath as IndexPath) as? podcastCollectionViewCell
        if podcastLibrary.count != 0 {
            if let titleDict = podcastLibrary[indexPath.row] as? NSDictionary {
                if let titleText = titleDict["name"] as? String
                {
                    cell?.podcastTitle.text = titleText
                    cell?.podcastId = titleDict["id"] as! Int64
                }
            }
        }
        
        return cell!
    }
    
}
