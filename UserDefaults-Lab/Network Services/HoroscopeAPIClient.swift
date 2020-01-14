//
//  HoroscopeAPIClient.swift
//  UserDefaults-Lab
//
//  Created by Chelsi Christmas on 1/13/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import Foundation

struct HoroscopeAPI {
    
    
    static func fetchHoroscope(sign: String, completion: @escaping (Result<Horoscope,AppError>) -> ()) {
      
        
        let horoscopeEndpointURLString = "http://sandipbgt.com/theastrologer/api/horoscope/\(sign)/today"
      
      guard let url = URL(string: horoscopeEndpointURLString) else {
        completion(.failure(.badURL(horoscopeEndpointURLString)))
        return
      }
      
      
      let request = URLRequest(url: url)
     
      
      NetworkHelper.shared.performDataTask(with: request) { (result) in
        switch result {
        case .failure(let appError):
          completion(.failure(.networkClientError(appError)))
        case .success(let data):
          do {
            
            let horoscopeName = try JSONDecoder().decode(Horoscope.self, from: data)
            
            
            
            completion(.success(horoscopeName))
            
          } catch {
            completion(.failure(.decodingError(error)))
          }
        }
      }
    }
    
    
}
