//
//  SideMenu.swift
//  navigation3DDrawer
//
//  Created by Jacob Ko on 2022/03/12.
//

import SwiftUI

struct SideMenu: View {
	// MARK: -  PROPERTY
	
	@Binding var currentTab: String
	// Adding Smooth Transition between tabs with the help of matched Geometry Effects..
	@Namespace var animation
	// MARK: -  BODY
	var body: some View {
		VStack {
			// title 부분
			HStack (spacing: 15) {
				Image("Pic")
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 45, height: 45)
					.clipShape(Circle())
			
				Text("Emma")
					.font(.title2.bold())
					.foregroundColor(.white)
			} //: HSTACK
			.padding()
			.hLeading()
			
			// For smaal Screens to add ScrollView Buttons
			ScrollView(.vertical, showsIndicators: false) {
				// Tab Buttons..
				VStack(alignment: .leading, spacing: 25) {
					CustomTabButton(icon: "theatermasks.fill", title: "Home")
					CustomTabButton(icon: "safari.fill", title: "Discover")
					CustomTabButton(icon: "applewatch", title: "Devices")
					CustomTabButton(icon: "person.fill", title: "Profile")
					CustomTabButton(icon: "gearshape.fill", title: "Settings")
					CustomTabButton(icon: "info.circle.fill", title: "About")
					CustomTabButton(icon: "questionmark.circle.fill", title: "Help")
					Spacer()
					// Making logour as constant button with orange color..
					CustomTabButton(icon: "rectangle.portrait.and.arrow.right", title: "Logout")
				} //: VSTACK
				.padding()
				.padding(.top, 45)
				// Max Width of screen width
				.frame(width: getReact().width / 2, alignment: .leading)
				.hLeading()
			}
		} //: VSTACK
		.padding(.leading, 10)
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
		.background(
			Color.gray
		)
	}
	
	// Custom Button
	@ViewBuilder
	func CustomTabButton(icon: String, title: String) -> some View {
		Button {
			if title == "Logout" {
				// Do Action Here>>
				print("Logout")
			} else {
				withAnimation(.spring()) {
						currentTab = title
				}
			}
		} label: {
			HStack (spacing: 12) {
				Image(systemName: icon)
					.font(.title3)
					.frame(width: currentTab == title ? 48 : nil, height: 48)
					.foregroundColor(currentTab == title ? Color("Purple"): (title == "Logout" ? Color("Orange") : .white))
					.background(
						ZStack {
							if currentTab == title {
								Color.white
									.clipShape(Circle())
									.matchedGeometryEffect(id: "TABCIRCLE", in: animation)
							}
						} //: ZSTACK
					)
				
				Text(title)
					.font(.callout)
					.fontWeight(.semibold)
					.foregroundColor( title == "Logout" ? Color("Orange") : .white)
			} //: HSTACK
			.padding(.trailing, 18)
			.background(
				ZStack {
					if currentTab == title {
						Color("Purple")
							.clipShape(Capsule())
							.matchedGeometryEffect(id: "TABCAPSULE", in: animation)
					}
				} //: ZSTACK
			)
		}
		.offset(x: currentTab == title ? 15 : 0)
	}
}

// MARK: -  PREVIEW
struct SideMenu_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.environmentObject(NavigationViewModel())
	}
}		


// MARK: -  EXTENSTION
extension View {
	func getReact() -> CGRect {
		return UIScreen.main.bounds
	}
}
