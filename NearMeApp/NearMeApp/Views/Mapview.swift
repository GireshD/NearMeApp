//
//  Mapview.swift
//  NearMeApp
//
//  Created by Giresh Dora on 24/05/20.
//  Copyright © 2020 Giresh. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import SwiftUI

struct Mapview: UIViewRepresentable {
    
    let landmarks: [Landmark]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true;
        map.delegate = context.coordinator
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<Mapview>) {
        updateAnnotations(form: uiView)
    }
    
    private func updateAnnotations(form mapView: MKMapView){
        
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.landmarks.map(LankmarkAnnotation.init)
        mapView.addAnnotations(annotations)
        
    }
}
