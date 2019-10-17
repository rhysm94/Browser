//
//  WebViewContainerView.swift
//  Browser
//
//  Created by Rhys Morgan on 17/10/2019.
//  Copyright © 2019 Rhys Morgan. All rights reserved.
//

import SwiftUI

struct WebViewContainerView: View {
	@State var url: URL

	var body: some View {
		GeometryReader { reader in
			ScrollView {
				HStack {
					Image(systemName: "photo")
					Text(self.url.absoluteString)
				}.padding(.top)

				WebView(urlRequest: URLRequest(url: self.url))
					.edgesIgnoringSafeArea(.bottom)
					.frame(width: reader.size.width, height: reader.size.height)
			}.navigationBarTitle(Text(self.url.absoluteString), displayMode: .inline)
		}
	}
}

struct WebViewContainerView_Preview: PreviewProvider {
	static var urls = [
		"https://google.co.uk",
		"https://nintendo.co.uk"
	].compactMap(URL.init)

	static var previews: some View {
		Group {
			ForEach(urls, id: \.self) {
				WebViewContainerView(url: $0)
					.previewDevice("iPhone 11 Pro")
					.previewDisplayName($0.absoluteString)
			}
		}
	}
}
