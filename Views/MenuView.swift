import SwiftUI

struct MenuView: View
{
	@EnvironmentObject var locationsViewModel: LocationsViewModel

	var body: some View
	{
		Button(action: { withAnimation { locationsViewModel.listPresented.toggle() } })
		{
			HStack(spacing: 0)
			{
				CircleView(locationsViewModel.mapLocation.image)
				.padding(.leading)

				Text(locationsViewModel.mapLocation.name)
				.foregroundColor(.primary)
				.lineLimit(1)
				.padding()

				Spacer(minLength: 0)

				Image(systemName: "list.bullet")
				.foregroundColor(.secondary)
				.padding(.trailing)
			}
			.background(.thinMaterial)
			.cornerRadius(.infinity)
			.shadow(radius: 6)
		}
		.animation(.none, value: locationsViewModel.mapLocation)
	}
}

struct MenuView_Previews: PreviewProvider
{
	static var previews: some View
	{
		Group
		{
			MenuView().preferredColorScheme(.light)

			MenuView().preferredColorScheme(.dark)
		}
		.previewLayout(.sizeThatFits)
		.environmentObject(LocationsViewModel())
	}
}
