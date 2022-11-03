import Foundation
import MapKit

class LocationsDataService
{
	static let locations: [Location] = [
		Location(
			name: "Colosseum",
			coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
			built: "69–79 AD",
			description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
			images: [
				"rome-colosseum-1",
				"rome-colosseum-2",
				"rome-colosseum-3",
			],
			link: "https://en.wikipedia.org/wiki/Colosseum"),
		Location(
			name: "Pantheon",
			coordinates: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769),
			built: "113–125 AD",
			description: "The Pantheon is a former Roman temple and since the year 609 a Catholic church, in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus.",
			images: [
				"rome-pantheon-1",
				"rome-pantheon-2",
				"rome-pantheon-3",
			],
			link: "https://en.wikipedia.org/wiki/Pantheon,_Rome"),
		Location(
			name: "Trevi Fountain",
			coordinates: CLLocationCoordinate2D(latitude: 41.9009, longitude: 12.4833),
			built: "1732–1762",
			description: "The Trevi Fountain is a fountain in the Trevi district in Rome, Italy, designed by Italian architect Nicola Salvi and completed by Giuseppe Pannini and several others. Standing 26.3 metres high and 49.15 metres wide, it is the largest Baroque fountain in the city and one of the most famous fountains in the world.",
			images: [
				"rome-trevifountain-1",
				"rome-trevifountain-2",
				"rome-trevifountain-3",
			],
			link: "https://en.wikipedia.org/wiki/Trevi_Fountain")
	]
}
