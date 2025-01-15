//
//  ContentView.swift
//  BBQuotes17
//
//  Created by Mohamed Nagi on 06/01/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            QuoteView(show: "Breaking Bad")
                .toolbarBackgroundVisibility(.visible, for: .tabBar)
                .tabItem {
                    Label("Breaking Bad", systemImage: "tortoise")
                }
            
            QuoteView(show: "Better Call Saul")
                .toolbarBackgroundVisibility(.visible, for: .tabBar)
                .tabItem {
                    Label("Better Call Saul", systemImage: "briefcase")
                }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    HomeView()
}
