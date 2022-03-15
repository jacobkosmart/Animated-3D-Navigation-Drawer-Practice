//
//  Home.swift
//  navigation3DDrawer
//
//  Created by Jacob Ko on 2022/03/15.
//

import SwiftUI

struct Home: View {
	// MARK: -  PROPERTY
	// MARK: -  BODY
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(alignment: .leading, spacing: 15) {
				Image("Pic")
					.resizable()
					.scaledToFill()
					.frame(width: getReact().width - 30, height: 250)
					.cornerRadius(20)
				
				Text("I Love SwiftUI")
					.font(.caption)
					.foregroundColor(.gray)
			} //: VSTACK
			.padding(.top)
		} //: SCROLL
	}
}

// MARK: -  PREVIEW
struct Home_Previews: PreviewProvider {
	static var previews: some View {
		Home()
	}
}
