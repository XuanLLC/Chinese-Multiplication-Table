//
//  ContentView.swift
//  Alphabetizer
//
//  Created by Xuan Wu on 5/16/26.
//
import SwiftUI

struct 全视界: View {
    var body: some View {
        TabView {
            视界1()
                .tabItem {
                    Label("", systemImage: "1.circle")
                }
            Text("二档")
                .tabItem {
                    Label("", systemImage: "2.circle")
            }
        }
    }
}
