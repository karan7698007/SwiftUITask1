//
//  CityListView.swift
//  DemoK
//
//  Created by Karan Sarvaiya on 27/01/25.
//

import SwiftUI

struct CityListView: View {
    
    @StateObject var viewModel = CityViewModel()
    @State private var expandedStates: Set<String> = []
    
    var body: some View {
        
        NavigationView {
            VStack {
                //REVERSE BUTTON
                Button {
                    viewModel.toggleReversedOrder()
                } label: {
                    Text(viewModel.isReversed ? "Reverse Order" : "Normal Order")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                }
                //STATE LIST
                List {
                    ForEach(viewModel.sortedStates, id: \.self) { state in
                        Section(header: SectionHeaderView(state: state, expanded: expandedStates.contains(state)) {
                            toggleSection(state: state)
                        }) {
                            if expandedStates.contains(state) {
                                ForEach(viewModel.statesKeyValuePair[state] ?? []) { city in
                                    Text(city.city)
                                }
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("States")
            }
        }
    }
    
    private func toggleSection(state: String) {
        if expandedStates.contains(state) {
            expandedStates.remove(state)
        } else {
            expandedStates.insert(state)
        }
    }
}

#Preview {
    CityListView()
}
