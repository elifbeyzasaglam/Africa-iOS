//
//  LocationModel.swift
//  Africa
//
//  Created by ELİF BEYZA SAĞLAM on 9.12.2022.
//

import Foundation
import MapKit

struct NationalParkLocation : Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude : Double
    
    var location : CLLocationCoordinate2D { (CLLocationCoordinate2D(latitude:latitude , longitude:longitude))
    }
}
