import SwiftUI

struct ListView: View
{
	@EnvironmentObject var locationsViewModel: LocationsViewModel
	
	var body: some View
	{
		HStack(alignment: .top)
		{
			VStack(alignment: .leading)
			{
				// Spacer equal to MenuView's height

				Text(" ")
				.padding(.vertical)
				.padding(.vertical)

				ForEach(locationsViewModel.locations)
				{
					location in

					let active: Bool = location == locationsViewModel.mapLocation

					Button(action: { locationsViewModel.chooseLocation(location) })
					{
						HStack
						{
							CircleView(location.image, active: active)

							Text(location.name)
							.foregroundColor(active ? .accentColor : .primary)
							.lineLimit(1)
						}
					}
				}

				Spacer(minLength: 0)
			}
			.padding(.horizontal)
			.padding(.leading)

			Spacer(minLength: 0)
		}
		.background(.ultraThinMaterial)
	}
}

struct ListView_Previews: PreviewProvider
{
	static var previews: some View
	{
		Group()
		{
			ListView().preferredColorScheme(.light)

			ListView().preferredColorScheme(.dark)
		}
		.environmentObject(LocationsViewModel())
	}
}
