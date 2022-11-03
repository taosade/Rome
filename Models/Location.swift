import Foundation
import MapKit

struct Location: Equatable, Identifiable
{
	let id: UUID = UUID()
	let name: String
	let coordinates: CLLocationCoordinate2D
	let built: String
	let description: String
	let images: [String]
	let link: String

	var image: String { images.first! }

	static func == (location_1: Location, location_2: Location) -> Bool
	{
		location_1.id == location_2.id
	}
}
