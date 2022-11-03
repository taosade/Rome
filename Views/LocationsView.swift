import SwiftUI
import MapKit

struct LocationsView: View
{
	@EnvironmentObject var locationsViewModel: LocationsViewModel

	var body: some View
	{
		ZStack
		{
			Map(
				coordinateRegion: $locationsViewModel.mapRegion,
				annotationItems: locationsViewModel.locations,
				annotationContent:
				{
					location in MapAnnotation(coordinate: location.coordinates)
					{
						MapPinView(
							location.image,
							active: location == locationsViewModel.mapLocation)
						.onTapGesture { locationsViewModel.chooseLocation(location) }
					}
				})
			.ignoresSafeArea()
			.zIndex(1)

			// PreviewView

			VStack
			{
				Spacer()

				ForEach(locationsViewModel.locations)
				{
					location in if location == locationsViewModel.mapLocation
					{
						PreviewView(locationsViewModel.mapLocation).transition(.slide)
					}
				}
			}
			.zIndex(2)
			.ignoresSafeArea()

			// ListView

			if
				locationsViewModel.listPresented &&
				locationsViewModel.locations.count > 1
			{
				ListView()
				.transition(.move(edge: .leading))
				.zIndex(3)
			}

			// MenuView

			VStack
			{
				MenuView().padding().frame(maxWidth: 600)

				Spacer(minLength: 0)
			}
			.zIndex(4)
		}
		.sheet(item: $locationsViewModel.sheetLocation)
		{
			location in DetailView(location)
		}
	}
}

struct LocationsView_Previews: PreviewProvider
{
	static var previews: some View
	{
		Group
		{
			LocationsView().preferredColorScheme(.light)

			LocationsView().preferredColorScheme(.dark)
		}
		.environmentObject(LocationsViewModel())
	}
}
