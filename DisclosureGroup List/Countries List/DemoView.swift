//
//  DemoView.swift
//  DisclosureGroup List
//
//  Created by Gokhan Bozkurt on 16.05.2022.
//

import SwiftUI

struct DemoView: View {
    @State var step1Expanded = true
    @State var step2Expanded = false
    
    var body: some View {
        VStack {
            DisclosureGroup("Step 1", isExpanded: $step1Expanded) {
                VStack(alignment: .trailing) {
                    Text("First step to learn disclosure groups")
                    Button("Next") {
                        Task {
                        withAnimation {
                            step1Expanded.toggle()
                        }
                            try? await Task.sleep(nanoseconds: 250_000_000)
                        withAnimation {
                            step2Expanded.toggle()
                        }
                    }
                    }
                }
               }
            .accentColor(.green)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green)
                            .opacity(0.1))
                
            DisclosureGroup(isExpanded: $step2Expanded) {
                VStack(alignment: .trailing) {
                    Text("Second step to learn disclosure groups")
                    Button("Previous") {
                        Task {
                        withAnimation {
                            step1Expanded.toggle()
                        }
                            try? await Task.sleep(nanoseconds: 250_000_000)
                        withAnimation {
                            step2Expanded.toggle()
                        }
                    }
                    }
                }
            } label: {
                Label("Step 2", systemImage: "lightbulb.fill")
            }
            .accentColor(.orange)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
                            .fill(Color.orange)
                            .opacity(0.1))

          
            Spacer()
        }
        .padding()
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
