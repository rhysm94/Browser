//
//  ContentView.swift
//  Browser
//
//  Created by Rhys Morgan on 17/10/2019.
//  Copyright © 2019 Rhys Morgan. All rights reserved.
//

import SwiftUI

struct MainView: View {
	var urls = [
		"https://nintendo.co.uk",
		"https://google.co.uk",
		"https://apple.com/uk"
	]
	.compactMap(URL.init)

	var body: some View {
		NavigationView {
			List(urls, id: \.self) { url in
				NavigationLink(destination: WebViewContainerView(url: url)) {
					Text(url.absoluteString)
				}
			}.navigationBarTitle(Text("Browse to..."), displayMode: .automatic)
		}
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
