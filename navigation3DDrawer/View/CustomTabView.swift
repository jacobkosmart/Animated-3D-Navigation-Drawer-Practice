//
//  CustomTabView.swift
//  navigation3DDrawer
//
//  Created by Jacob Ko on 2022/03/15.
//

import SwiftUI
struct CustomTabView: View {

	// MARK: -  PROPERTY
	@Binding var currentTab: String
	@Binding var showMenu: Bool
	// MARK: -  BODY
	var body: some View {
		VStack {
			// Static Header View for all Pages..
			HStack {
				// Menu Button
				Button {
					// Toggleing Menu Option..
					withAnimation(.spring()) {
						showMenu = true
					}
				} label: {
					Image(systemName: "line.3.horizontal.decrease")
						.font(.title.bold())
						.foregroundColor(.white)
				}
				// Hiding when Menu is Visible..
				.opacity(showMenu ? 0 : 1)
				Spacer()
			} //: HSTACK
			.overlay(
				Text(currentTab)
					.font(.title2.bold())
					.foregroundColor(.white)
				// Same Hiding when Menu is Visible
					.opacity(showMenu ? 0 : 1)
			)
			.padding([.horizontal, .top])
			.padding(.bottom, 8)
			.padding(.top, getSafeArea().top)
			
			TabView(selection: $currentTab) {
				Home()
					.tag("Home")
				
				// Replace your Custom Views here..
				Text("Discover")
					.tag("Discover")
				
				Text("Devices")
					.tag("Devices")
				
				Text("Profile")
					.tag("Profile")
			} //: TAB
		} //: VSTACK
		// Disabling actions when menu is visible..
		.disabled(showMenu)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.overlay(
			// Close Button
			Button {
				// Toggleing Menu Option..
				withAnimation(.spring()) {
					showMenu = false
				}
			} label: {
				Image(systemName: "xmark")
					.font(.title.bold())
					.foregroundColor(.white)
			}
			// Hiding when Menu is Visible..
			.opacity(showMenu ? 1 : 0)
				.padding()
				.padding(.top)
			, alignment: .topLeading
		)
		.background(
			Color.black
		)
	}
}

// MARK: -  PREVIEW
struct CustomTabView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.environmentObject(NavigationViewModel())
	}
}
