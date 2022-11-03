import SwiftUI

@main
struct RomeApp: App
{
	@StateObject private var locationsViewModel: LocationsViewModel = LocationsViewModel()

	var body: some Scene
	{
		WindowGroup
		{
			LocationsView().environmentObject(locationsViewModel)
		}
	}
}
