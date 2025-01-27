//
//  SectionHeaderView.swift
//  DemoK
//
//  Created by Karan Sarvaiya on 27/01/25.
//

import SwiftUI

struct SectionHeaderView: View {
    let state: String
    let expanded: Bool
    let toggle: () -> Void
    
    
    init(state: String = "", expanded: Bool = false, toggle: @escaping () -> Void = {}) {
        self.state = state
        self.expanded = expanded
        self.toggle = toggle
    }
    
    var body: some View {
        HStack {
            Text(state)
                .font(.headline)
            Spacer()
            Image(systemName: expanded ? "chevron.down" : "chevron.right")
                .foregroundColor(.gray)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            toggle()
        }
    }
}

#Preview {
    SectionHeaderView()
}

