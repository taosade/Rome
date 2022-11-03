import SwiftUI

struct DetailView: View
{
	let location: Location

	init(_ location: Location) { self.location = location }

	var body: some View
	{
		ScrollView
		{
			VStack
			{
				TabView
				{
					ForEach(location.images, id: \.self)
					{
						image in Image(image).resizable().scaledToFill()
					}
				}
				.tabViewStyle(.page)
				.frame(height: 400)
				.shadow(radius: 6)

				VStack(alignment: .leading)
				{
					Text(location.name)
					.font(.largeTitle)
					.fontWeight(.semibold)

					Text(location.built)
					.font(.headline)
					.foregroundColor(.secondary)

					Text(location.description).padding(.vertical)

					if let url = URL(string: location.link)
					{
						Link("\(Image(systemName: "globe")) Read more on Wikipedia", destination: url)
						.padding(.bottom)
					}
				}.padding(.horizontal)
			}
		}.background(.thinMaterial)
	}
}

struct DetailView_Previews: PreviewProvider
{
	static var previews: some View
	{
		Group
		{
			DetailView(LocationsDataService.locations.first!)
			.preferredColorScheme(.light)

			DetailView(LocationsDataService.locations.first!)
			.preferredColorScheme(.dark)
		}
	}
}
