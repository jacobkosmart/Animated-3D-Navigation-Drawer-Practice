//
//  NavigationViewModel.swift
//  navigation3DDrawer
//
//  Created by Jacob Ko on 2022/03/12.
//

import SwiftUI

class NavigationViewModel: ObservableObject {
	// MARK: -  PROPERTY
	@Published var currentTab: String = "Home"
	@Published var showMenu: Bool = false
}
