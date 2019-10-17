//
//  WebView.swift
//  Browser
//
//  Created by Rhys Morgan on 17/10/2019.
//  Copyright © 2019 Rhys Morgan. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
	@State var urlRequest: URLRequest

	func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
		let webView = WKWebView()
		return webView
	}

	func updateUIView(_ wkWebView: WKWebView, context: UIViewRepresentableContext<WebView>) {
		wkWebView.load(urlRequest)
	}
}
