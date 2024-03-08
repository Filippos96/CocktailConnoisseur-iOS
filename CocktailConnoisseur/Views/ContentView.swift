//
//  ContentView.swift
//  CocktailConnoisseur
//
//  Created by Filip on 2024-03-06.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            TabView {
                Group{
                    HomeScreen()
                        .tabItem {
                            Image(systemName: "house")
                        }
                    HomeScreen()
                        .tabItem {
                            Image(systemName: "house.fill")
                        }
                    HomeScreen()
                        .tabItem {
                            Image(systemName: "house.fill")
                        }
                }
                .toolbarBackground(.hidden, for: .tabBar)
                .toolbarBackground(.black, for: .tabBar)
            }
        }
    }
}

#Preview {
    ContentView()
}
