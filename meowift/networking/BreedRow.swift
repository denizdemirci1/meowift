//
//  BreedRow.swift
//  meowift
//
//  Created by Deniz Demirci on 19/02/2022.
//

import SwiftUI

struct BreedRow: View {
    let breed: Breed
    let imagesize: CGFloat = 100
    var body: some View {
        HStack {
            if breed.image?.url != nil {
                AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imagesize, height: imagesize)
                            .clipped()
                    } else if phase.error != nil {
                        Color.red
                    } else {
                        ProgressView()
                            .frame(width: imagesize, height: imagesize)
                    }
                }
            } else {
                Color.gray
                    .frame(width: imagesize, height: imagesize)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name)
                    .font(.headline)
                Text(breed.temperament)
            }
        }
    }
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: Breed.example1())
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
