import SwiftUI

struct MapPinView: View
{
	let image: String
	let active: Bool

	init(_ image: String, active: Bool = false)
	{
		self.image = image
		self.active = active
	}

	var body: some View
	{
		ZStack
		{
			Image(systemName: "triangle.fill")
			.resizable()
			.scaledToFit()
			.frame(width: 40)
			.foregroundColor(active ? .accentColor : .secondary)
			.rotationEffect(Angle(degrees: 180))
			.offset(y: 15)

			CircleView(image, active: active, size: 40)
		}
		.padding(.bottom, 60)
		.scaleEffect(active ? 1.3 : 1)
	}
}

struct MapPinView_Previews: PreviewProvider
{
	static var previews: some View
	{
		Group
		{
			MapPinView(LocationsDataService.locations.first!.image)
			.preferredColorScheme(.light)

			MapPinView(LocationsDataService.locations.first!.image, active: true)
			.preferredColorScheme(.light)

			MapPinView(LocationsDataService.locations.first!.image)
			.preferredColorScheme(.dark)

			MapPinView(LocationsDataService.locations.first!.image, active: true)
			.preferredColorScheme(.dark)
		}
		.previewLayout(.sizeThatFits)
	}
}
