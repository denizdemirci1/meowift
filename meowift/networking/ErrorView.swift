//
//  ErrorView.swift
//  meowift
//
//  Created by Deniz Demirci on 19/02/2022.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var breedFetcher: BreedFetcher
    var body: some View {
        VStack {
            Text("😿")
                .font(.system(.largeTitle))
            Text(breedFetcher.errorMessage ?? "")
            Button {
                breedFetcher.fetchAllBreeds()
            } label: {
                Text("Retry ")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedFetcher: BreedFetcher())
    }
}
