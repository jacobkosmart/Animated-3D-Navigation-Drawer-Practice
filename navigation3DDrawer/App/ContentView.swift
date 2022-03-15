//
//  ContentView.swift
//  navigation3DDrawer
//
//  Created by Jacob Ko on 2022/03/12.
//

import SwiftUI

struct ContentView: View {

	var body: some View {
		MainView()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.environmentObject(NavigationViewModel())
	}
}
