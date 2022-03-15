//
//  navigation3DDrawerApp.swift
//  navigation3DDrawer
//
//  Created by Jacob Ko on 2022/03/12.
//

import SwiftUI

@main
struct navigation3DDrawerApp: App {
	
	@StateObject var vm: NavigationViewModel = NavigationViewModel()
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(vm)
		}
	}
}
