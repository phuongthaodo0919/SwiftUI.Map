//
//  PlaceListView.swift
//  SwiftUI.Map
//
//  Created by Salmdo on 4/29/23.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    
    let landmarks: [Landmark]
    var onTap: () -> ()
    
    var body: some View {
        
        VStack {
            HStack{
                EmptyView()
            }
            .frame(width: UIScreen.main.bounds.size.width, height: 60)
            .background(Color.green)
            .gesture(TapGesture()
                .onEnded(self.onTap))
            
            List(landmarks, id: \.id) { landmark in
                /*@START_MENU_TOKEN@*/Text(landmark.name)/*@END_MENU_TOKEN@*/
            }
        }.cornerRadius(16)
            .animation(.spring())
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D()))], onTap: {})
    }
}
