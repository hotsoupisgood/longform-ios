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
    var currentPodcast: NSDictionary = [:]
    
    func play() {
        let locationString = currentPodcast["location"] as! String
        print(locationString)
        let location = URL(string: locationString)

        let playerItem = AVPlayerItem(url: location!)
        
        let player = AVPlayer(playerItem:playerItem)
        player.volume = 1.0
        player.play()
    }
    
    func getRandomPodcast() {
        Alamofire.request("http://localhost:8888/php/getRandomPodcast.php").responseJSON { response in
            if let result = response.result.value {
                self.currentPodcast = result as! NSDictionary
            }
        }
    }
}
