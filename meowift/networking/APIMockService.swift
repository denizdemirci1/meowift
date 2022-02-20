//
//  APIMockService.swift
//  meowift
//
//  Created by Deniz Demirci on 19/02/2022.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var result: Result<[Breed], APIError>
    
    func fetchBreeds(url: URL?, completion: @escaping (Result<[Breed], APIError>) -> Void) {
        completion(result)
    }
}
