//
//  MapView.swift
//  SwiftUI.Map
//
//  Created by Salmdo on 4/29/23.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let landmarks: [Landmark]
    
    func makeCoordinator() -> MapCoordinator {
            return MapCoordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        uiView.removeAnnotations(uiView.annotations)
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        uiView.addAnnotations(annotations)
    }
}
