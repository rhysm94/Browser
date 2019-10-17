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
	@Binding var contentHeight: CGFloat

	func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
		let webView = WKWebView()
		webView.scrollView.isScrollEnabled = false
		webView.navigationDelegate = context.coordinator
		return webView
	}

	func updateUIView(_ wkWebView: WKWebView, context: UIViewRepresentableContext<WebView>) {
		wkWebView.load(urlRequest)
	}

	func makeCoordinator() -> Coordinator {
		Coordinator(contentHeight: $contentHeight)
	}

	class Coordinator: NSObject, WKNavigationDelegate {
		@Binding var contentHeight: CGFloat
		var resized = false

		init(contentHeight: Binding<CGFloat>) {
			self._contentHeight = contentHeight
		}

		func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
			webView.evaluateJavaScript("document.readyState") { complete, _ in
				guard complete != nil else { return }
				webView.evaluateJavaScript("document.body.scrollHeight") { height, _ in
					guard let height = height as? CGFloat else { return }

					if !self.resized {
						self.contentHeight = height
						self.resized = true
					}
				}
			}
		}
	}
}
