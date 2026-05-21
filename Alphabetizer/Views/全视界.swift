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
            视界2()
                .tabItem {
                    Label("", systemImage: "2.circle")
            }
            视界3()
                .tabItem {
                    Label("", systemImage: "3.circle")
            }
            视界4()
                .tabItem {
                    Label("", systemImage: "4.circle")
            }
            视界5()
                .tabItem {
                    Label("", systemImage: "5.circle")
            }
        }
    }
}
