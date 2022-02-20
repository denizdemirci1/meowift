//
//  LoadingView.swift
//  meowift
//
//  Created by Deniz Demirci on 19/02/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("😺")
                .font(.system(.largeTitle))
            ProgressView()
            Text("Getting the cats...")
                .foregroundColor(.gray)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
