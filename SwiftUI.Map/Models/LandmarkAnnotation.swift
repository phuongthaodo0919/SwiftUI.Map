//
//  LandmarkAnnotation.swift
//  SwiftUI.Map
//
//  Created by Salmdo on 4/29/23.
//

import Foundation
import MapKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(landmark: Landmark){
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
    
    
    
}
