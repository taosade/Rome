import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject
{
	var locations: [Location]

	@Published var mapLocation: Location { didSet { updateMapRegion(mapLocation) } }

	@Published var mapRegion: MKCoordinateRegion

	@Published var sheetLocation: Location?

	@Published var listPresented: Bool

	init()
	{
		self.locations = LocationsDataService.locations
		self.listPresented = false
		self.sheetLocation = nil
		self.mapLocation = locations.first!
		self.mapRegion = MKCoordinateRegion()

		updateMapRegion(self.mapLocation)
	}

	/// Updates map region to specific location
	private func updateMapRegion(_ location: Location)
	{
		withAnimation
		{
			self.mapRegion = MKCoordinateRegion(
				center: location.coordinates,
				span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
		}
	}

	/// Selects location
	func chooseLocation(_ location: Location)
	{
		withAnimation
		{
			self.mapLocation = location

			self.listPresented = false
		}

	}

	/// Selects next location
	func nextLocation()
	{
		guard let index = self.locations.firstIndex(where: { location in location == self.mapLocation })
		else { return }

		guard self.locations.indices.contains(index + 1) else
		{
			guard let location = self.locations.first else { return }

			self.chooseLocation(location)

			return
		}

		self.chooseLocation(self.locations[index + 1])
	}
}
