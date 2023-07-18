//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Uriel Ortega on 17/07/23.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(
                                Color(
                                    hue: min(1, geo.frame(in: .global).minY / fullView.size.height), // To use the smaller value of 1 or the calculated hue.
                                    saturation: 1,
                                    brightness: 1
                                )
                            )
                            .rotation3DEffect(
                                .degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5,
                                axis: (x: 0, y: 1, z: 0)
                            )
                            .opacity(geo.frame(in: .global).minY / 200) // View fades out in the Y range of 0 through 200.
                            .scaleEffect(
                                max(
                                    0.5, // 50% minimum size.
                                    geo.frame(in: .global).minY / 400 // Use 1/400th of the Y position.
                                )
                            )
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
