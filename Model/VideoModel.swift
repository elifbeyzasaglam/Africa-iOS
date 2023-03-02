//
//  VideoModel.swift
//  Africa
//
//  Created by ELİF BEYZA SAĞLAM on 29.10.2022.
//

import Foundation

struct Video: Codable,Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
