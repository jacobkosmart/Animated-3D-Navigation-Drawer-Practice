//
//  MainView.swift
//  navigation3DDrawer
//
//  Created by Jacob Ko on 2022/03/12.
//

import SwiftUI

struct MainView: View {
	// MARK: -  PROPERTY

	@EnvironmentObject private var vm: NavigationViewModel
	
	// Hiding Navigation Tab Bar..
	init() {
		UITabBar.appearance().isHidden = true
	}
	
	// MARK: -  BODY
	var body: some View {
		ZStack {
			// Custom Slide menu
			SideMenu(currentTab: $vm.currentTab)
			
			// Main tab View..
			CustomTabView(currentTab: $vm.currentTab, showMenu: $vm.showMenu)
			// Appling Corner Radius
				.cornerRadius(vm.showMenu ? 25 : 0)
			// Mading 3D rotation
				.rotation3DEffect(.init(degrees: vm.showMenu ? -15 : 0), axis: (x: 0, y: 1, z: 0), anchor: .trailing)
			// Moving View Apart..
				.offset(x: vm.showMenu ? getReact().width / 2 : 0)
				.ignoresSafeArea()
		}
		// Always Dark Mode
		.preferredColorScheme(.dark)
	}
}

// MARK: -  PREVIEW
struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
			.environmentObject(NavigationViewModel())
	}
}

// MARK: -  EXTENTSION
// extending View to get safe Area value ..
extension View {
	func getSafeArea() -> UIEdgeInsets {
		guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
			return .zero
		}
		
		guard let safeArea = screen.windows.first?.safeAreaInsets else {
			return .zero
		}
		return safeArea
	}
}
