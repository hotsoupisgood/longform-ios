//
//  podcastCollectionViewCell.swift
//  longform
//
//  Created by Mac on 12/24/16.
//  Copyright © 2016 This Agora. All rights reserved.
//

import UIKit
import Alamofire

class podcastCollectionViewCell: UICollectionViewCell {
    
    var podcastId = Int64()
    
//    @IBOutlet weak var podcastPicture: UIImageView!
    @IBOutlet weak var podcastPicture: UIImageView!
    
    @IBOutlet weak var podcastTitle: UILabel!
//    @IBOutlet weak var podcastTitle: UILabel!
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    @IBAction func pressedCell(_ sender: UIButton) {
        UniversalPlayer.selectedPodcastId = podcastId
    }
}

