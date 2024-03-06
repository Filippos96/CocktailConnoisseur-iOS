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
            HomeScreen()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)

    }
}

#Preview {
    ContentView()
}
