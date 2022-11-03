import SwiftUI

struct PreviewView: View
{
	@EnvironmentObject var locationsViewModel: LocationsViewModel

	let location: Location

	init(_ location: Location) { self.location = location }

	var body: some View
	{
		HStack(spacing: 20)
		{
			Image(location.images.first!)
			.resizable()
			.scaledToFit()
			.frame(width: 100, height: 100)
			.cornerRadius(12)

			VStack
			{
				Button(action: { locationsViewModel.sheetLocation = location })
				{
					Text("\(Image(systemName: "book")) Learn more").font(.title)
				}
				.buttonStyle(.borderedProminent)

				Spacer(minLength: 0)

				Button(action: locationsViewModel.nextLocation)
				{
					Text("Next \(Image(systemName: "chevron.right"))").font(.title2)
				}
				.buttonStyle(.borderless)

				Spacer(minLength: 0)
			}
		}
		.padding(20)
		.frame(height: 140)
		.frame(maxWidth: .infinity)
		.background(.thinMaterial)
	}
}

struct PreviewView_Previews: PreviewProvider
{
	static var previews: some View
	{
		Group
		{
			PreviewView(LocationsDataService.locations.first!)
				.preferredColorScheme(.light)

			PreviewView(LocationsDataService.locations.first!)
				.preferredColorScheme(.dark)
		}
		.previewLayout(.sizeThatFits)
		.environmentObject(LocationsViewModel())
	}
}
