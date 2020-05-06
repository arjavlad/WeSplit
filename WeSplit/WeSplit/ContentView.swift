//
//  ContentView.swift
//  WeSplit
//
//  Created by Arjav Lad on 23/04/20.
//  Copyright © 2020 Arjav Lad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State private var checkAmount = ""
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 2

	let tipPercentages = [10, 15, 20, 25, 0]
	var orderAmount: Double { Double(checkAmount) ?? 0 }
	var tipSelection: Double { Double(tipPercentages[tipPercentage]) }
	var tipValue: Double { orderAmount / 100 * tipSelection }

	var totalPerPerson: Double {
		let peopleCount = Double(numberOfPeople + 2)
		let amountPerPerson = grandTotal / peopleCount
		return amountPerPerson
	}

	var grandTotal: Double { orderAmount + tipValue }

	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Enter Amount", text: $checkAmount)
						.keyboardType(.decimalPad)
					Picker("Number of people", selection: $numberOfPeople) {
						ForEach(2 ..< 100) {
							Text("\($0) people")
						}
					}
				}
				Section(header: Text("How much tip do you want to leave?")) {
					Picker("Tip percentage", selection: $tipPercentage) {
						ForEach(0 ..< tipPercentages.count) {
							Text("\(self.tipPercentages[$0])%")
						}
					}.pickerStyle(SegmentedPickerStyle())
				}
				Section(header: Text("Amount per person")) {
					Text("$ \(totalPerPerson, specifier: "%.2f")")
				}
				Section(header: Text("Total amount for check")) {
					Text("$ \(grandTotal, specifier: "%.2f")")
				}

			}.navigationBarTitle("WeSplit")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.padding(0.0)
	}
}
