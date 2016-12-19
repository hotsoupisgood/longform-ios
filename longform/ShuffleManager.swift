//
//  ShuffleManager.swift
//  longform
//
//  Created by Mac on 12/16/16.
//  Copyright © 2016 This Agora. All rights reserved.
//

import Foundation
import Alamofire
import AVFoundation
class Shuffle: NSObject {
    var currentPodcast = NSDictionary()
    var player = AVPlayer()
    var pTitle = String()
    var pDescription = String()
    
    func getTitle() -> String {
        return pTitle
    }
    func getDescription() -> String {
        return pDescription
    }
    func play() {
        player.play()
    }
    func pause() {
        player.pause()
    }
    func getRandomPodcast() {
        Alamofire.request("http://localhost:8888/php/getRandomPodcast.php").responseJSON { response in
            if let result = response.result.value {
                self.currentPodcast = result as! NSDictionary
                
                self.pTitle = self.currentPodcast["name"] as! String
                self.pDescription = self.currentPodcast["description"] as! String
                
                let locationString = self.currentPodcast["location" ]
                let location = URL(string: locationString as! String)
                let playerItem = AVPlayerItem(url: location!)
                    
                self.player = AVPlayer(playerItem:playerItem)
                
            }
        }
    }
}
