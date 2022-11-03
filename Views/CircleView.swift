import SwiftUI

struct CircleView: View
{
	let image: String
	let active: Bool
	let size: CGFloat

	init(_ image: String, active: Bool = false, size: CGFloat = 30)
	{
		self.image = image
		self.active = active
		self.size = size
	}

	var body: some View
	{
		ZStack
		{
			if active { Circle().fill(Color.accentColor) }

			Image(image)
			.resizable()
			.scaledToFit()
			.frame(
				width: active ? size * 0.9 : size,
				height: active ? size * 0.9 : size)
			.clipShape(Circle())
		}
		.frame(width: size, height: size)
	}
}

struct CircleView_Previews: PreviewProvider
{
	static var previews: some View
	{
		Group
		{
			CircleView(LocationsDataService.locations.first!.images.first!, size: 100)
			.preferredColorScheme(.light)

			CircleView(LocationsDataService.locations.first!.images.first!, size: 100)
			.preferredColorScheme(.dark)

			CircleView(LocationsDataService.locations.first!.images.first!, active: true, size: 100)
			.preferredColorScheme(.light)

			CircleView(LocationsDataService.locations.first!.images.first!, active: true, size: 100)
			.preferredColorScheme(.dark)
		}
		.previewLayout(.sizeThatFits)
	}
}
