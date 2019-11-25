//
//  MapView.swift
//  DriverSearch
//
//  Created by Martin on 11/19/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @EnvironmentObject var viewModel: TaxiListViewModel
    @Binding var taxis: [Taxi]
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        view.removeAnnotations(view.annotations)
        for taxi: Taxi in taxis {
            view.addAnnotation(TaxiAnnotation.init(taxi: taxi))
        }
    }
    
    func makeCoordinator() -> MapViewCoordinator{
        MapViewCoordinator(self, viewModel: self.viewModel)
    }
}

class MapViewCoordinator: NSObject, MKMapViewDelegate {
    var viewModel: TaxiListViewModel
    let mapView: MapView!
    
    init(_ control: MapView, viewModel: TaxiListViewModel) {
        self.mapView = control
        self.viewModel = viewModel
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let northEast = mapView.convert(CGPoint(x: mapView.bounds.width, y: 0), toCoordinateFrom: mapView)
        let southWest = mapView.convert(CGPoint(x: 0, y: mapView.bounds.height), toCoordinateFrom: mapView)
        let boundingBox = BoundingBox.init(point1: northEast, point2: southWest)
        viewModel.update(boundingBox: boundingBox)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }
}

//struct MapView_Previews: PreviewProvider {
//    @State var taxis = taxiData
//    static var previews: some View {
//        let coordinate = CLLocationCoordinate2D.init(latitude: taxiData[0].coordinate.latitude, longitude: taxiData[0].coordinate.longitude)
//        return MapView(taxis: $taxis, coordinate: coordinate)
//    }
//}
