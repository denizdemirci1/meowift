//
//  APIServiceProtocol.swift
//  meowift
//
//  Created by Deniz Demirci on 19/02/2022.
//

import Foundation

protocol APIServiceProtocol {
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void)
}
