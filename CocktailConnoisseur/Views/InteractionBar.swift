//
//  InteractionBar.swift
//  CocktailConnoisseur
//
//  Created by Jasmin on 2024-03-08.
//

import SwiftUI

struct InteractionBar: View {
    var body: some View {
        HStack{
            Image(systemName: "heart")
                .resizable()
                .frame(width: 25, height: 25)
            Spacer()
            Image(systemName: "heart")
                .resizable()
                .frame(width: 25, height: 25)
            Spacer()
            Image(systemName: "square.and.pencil")
                .resizable()
                .frame(width: 25, height: 25)
        }
        .padding(.horizontal, 100)
        .foregroundColor(.red)
    }
}

#Preview {
    InteractionBar()
}
