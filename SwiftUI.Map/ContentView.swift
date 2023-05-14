//
//  ContentView.swift
//  SwiftUI.Map
//
//  Created by Salmdo on 4/29/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject private var locationManager = LocationManager()
    
    @State private var searchTerm: String = ""
    @State private var landmarks = [Landmark]()
    @State private var tapped: Bool = false
    
    private func getNearByLandmarks(){
        guard let location = self.locationManager.location else {
            return
        }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTerm
        request.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        let searchLocal = MKLocalSearch(request: request)
        searchLocal.start { response, err in
            guard let response, err == nil else {
                return
            }
            
            let mapItems = response.mapItems
            self.landmarks = mapItems.map {
                Landmark(placemark: $0.placemark)
            }
        }
    }
    
    func calculateOffset() -> CGFloat {
        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
        } else if self.tapped {
            return 100
        }
        return UIScreen.main.bounds.size.height
    }
    
    var body: some View {
        ZStack {
            
            MapView(landmarks: self.landmarks)
            
            TextField("Search", text: $searchTerm, onEditingChanged: { _ in
                getNearByLandmarks()
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .offset(y: -320)
            
            PlaceListView(landmarks: self.landmarks, onTap: {
                self.tapped.toggle()
            }).offset(y: calculateOffset())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
