//
//  AppStoreItem.swift
//  AppleSearch
//
//  Created by Blake kvarfordt on 8/14/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation

struct AppStoreItem {
    let title: String
    let subtitle: String
    let imageURL: String?
    
    
    enum ItemType: String {
        
        case app = "software"
        case music = "musicTrack"
    }
}



extension AppStoreItem {
    
    init?(itemType: AppStoreItem.ItemType, dictionary: [String : Any]) {
        
        let imageURL = dictionary["artworkUrl100"] as? String
        
        if itemType == .app {
            
            guard let title = dictionary["trackName"] as? String, let subtitle = dictionary["description"] as? String else { return nil }
            
            self.title = title
            self.subtitle = subtitle
            self.imageURL = imageURL
            
        } else if itemType == .music {
            
            guard let title = dictionary["artistName"] as? String, let subtitle = dictionary["trackName"] as? String else { return nil}
            
            
            self.title = title
            self.subtitle = subtitle
            self.imageURL = imageURL
            
        } else {
            print("did not set item type very well")
            return nil
        }
        
        return nil
    }
    
    
    
    
}
