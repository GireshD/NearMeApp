//
//  ContentView.swift
//  NearMeApp
//
//  Created by Giresh Dora on 24/05/20.
//  Copyright © 2020 Giresh. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject private var locationManager = LocationManager()
    @State var searchString = ""
    @State var landmarks = [Landmark]()
    
    private func getNearbyLandmark(){
        
        guard let location = self.locationManager.location else {
            return
        }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = self.searchString
        request.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            
            guard let response = response, error == nil else {
                return
            }
            
            let mapItems = response.mapItems
            
            self.landmarks = mapItems.map{
                Landmark(placemark: $0.placemark)
            }
        }
    }
    
    var body: some View {
        
        ZStack(alignment: .top){
            Mapview(landmarks: self.landmarks)
            
            TextField("Search", text: self.$searchString, onEditingChanged: { _ in }) {
                self.getNearbyLandmark()
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
                .offset(y: 44)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
