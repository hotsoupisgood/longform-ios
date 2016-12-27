//
//  player.swift
//  longform
//
//  Created by Mac on 12/23/16.
//  Copyright © 2016 This Agora. All rights reserved.
//

import UIKit
import AVFoundation

class UniversalPlayer: NSObject {
    static var audio = AVPlayer()
    static var podcastTitle = String()
    static var podcastDescription = String()
    static var selectedPodcastId = Int64()
}
