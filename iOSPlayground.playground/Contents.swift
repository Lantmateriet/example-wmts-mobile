/*: some text
 # How to use Lantmäteriet WMTS in MapKit
 ## Create a free account
 Before you start you need to visit
 [Öppna Geodata](https://www.lantmateriet.se/sv/Kartor-och-geografisk-information/oppna-data/)
 to create an account. This is required to get your own access token needed later.
 
 ## Implement the code
 
 First you need to import MapKit.
 If you want do display the mapview as a live view in a playground you also need to import PlaygroundSupport.
 */
import MapKit
import UIKit
import PlaygroundSupport
//: You need to create a `MKTileOverlay` with a custom URL template. You can create a subclass that
//: takes the required access token as a parameter
class LMVTileOverlay: MKTileOverlay {
    init(accessToken: String) {
        let version = "1.0.0"
        let template = "https://api.lantmateriet.se/open/topowebb-ccby/v1/wmts/token/\(accessToken)/\(version)/topowebb/default/3857/{z}/{y}/{x}.png"
        super.init(urlTemplate: template)
    }
}
//: You also need to tell the MapView to use your new tile renderer. This is done by implementing the function
//: `func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer`
//: in the `MKMapViewDelegate` protocol.
class MyMapViewDelegate: NSObject, MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let lmvOverlay = overlay as? LMVTileOverlay else {
            fatalError()
        }
        return MKTileOverlayRenderer(tileOverlay: lmvOverlay)
    }
}
//: Create the MKMapView:
let frame = CGRect( x:0, y:0, width:400, height:400 )
let mapView = MKMapView(frame: frame)
//: Insert your own access token from the [opendata portal](https://opendata.lantmateriet.se/#mykeys):
let overlay = LMVTileOverlay(accessToken: "<Insert yor token here>")
//: Add your custom overlay to the map view:
mapView.addOverlay(overlay, level: .aboveLabels)
//: Create an instance of your delegate and assign it to the mapview:
let delegate = MyMapViewDelegate()
mapView.delegate = delegate

//: Create a region for the center of Sweden:
let initialRegion = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 62.173276, longitude: 14.942265),
    span: MKCoordinateSpan(latitudeDelta: 3.141592, longitudeDelta: 3.141592))
mapView.region = initialRegion
mapView.showsUserLocation = true
//: Set the mapView as the live view in the playground:
PlaygroundPage.current.liveView = mapView
PlaygroundPage.current.needsIndefiniteExecution = true
//: You can read more about custom map tiles in the [MapKit official documentation](https://developer.apple.com/documentation/mapkit/mktileoverlay)
