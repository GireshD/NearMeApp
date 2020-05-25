//
//  LandmarkAnnotation.swift
//  NearMeApp
//
//  Created by Giresh Dora on 24/05/20.
//  Copyright © 2020 Giresh. All rights reserved.
//

import Foundation
import MapKit

final class LankmarkAnnotation: NSObject, MKAnnotation{
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
