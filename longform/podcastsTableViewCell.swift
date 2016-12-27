//
//  podcastsTableViewCell.swift
//  longform
//
//  Created by Mac on 12/24/16.
//  Copyright © 2016 This Agora. All rights reserved.
//

import UIKit
import AVFoundation

class podcastsTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var podcastTitle: UILabel!
    @IBOutlet weak var podcastDescription: UITextView!
    var locationString = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: Actions
    @IBAction func pressedCell(_ sender: UIButton) {
        let locationUrl = URL(string: locationString)
        let playerItem = AVPlayerItem(url: locationUrl!)
        
        UniversalPlayer.podcastTitle = podcastTitle.text!
        UniversalPlayer.podcastDescription = podcastDescription.text
        UniversalPlayer.audio.replaceCurrentItem(with: playerItem)
        
        let tabBarController: UITabBarController = (self.window?.rootViewController as? UITabBarController)!
        tabBarController.selectedIndex = 1
    }
}
