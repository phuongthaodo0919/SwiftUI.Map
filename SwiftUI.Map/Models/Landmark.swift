//
//  Landmark.swift
//  SwiftUI.Map
//
//  Created by Salmdo on 4/29/23.
//

import Foundation
import MapKit

struct Landmark {
    let placemark: MKPlacemark
    
    var id: UUID {
        UUID()
    }
    
    var name: String {
        return self.placemark.name ?? ""
    }
        
    var title: String {
        return self.placemark.title ?? ""
    }
        
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
