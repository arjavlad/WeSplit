//
//  ContentView.swift
//  WeSplit
//
//  Created by Arjav Lad on 23/04/20.
//  Copyright © 2020 Arjav Lad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State private var tapCount = 0
	@State private var storedText: String = ""
	var body: some View {
		NavigationView {
			Form {
				Group {
					Button("Tap Count: \(tapCount)") {
						self.tapCount += 1
					}
					Button("Clear Taps") {
						self.tapCount = 0
					}
				}
				Group {
					Text("Hello")
					Text("Hello")
					Text("Hello")
					Text("Hello")
					Text("Hello")
					Text("Hello")
					Text(storedText)
					TextField("Enter Text Here", text: $storedText).keyboardType(.numberPad)
				}
			}
			.navigationBarTitle("List", displayMode: .inline)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.padding(0.0)
	}
}
