//
//  ApiClient.swift
//  UsersListApp
//
//  Created by Anatolii Zavialov on 4/9/19.
//  Copyright © 2019 Anatolii Zavialov. All rights reserved.
//

//import Alamofire
import Foundation
import Combine

struct ApiClient {
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func performRequest<T: Decodable>(route: APIConfiguration, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
        
        return URLSession.shared
            .dataTaskPublisher(for: try! route.asURLRequest())
            .tryMap { result -> Response<T> in
                let response = try decoder.decode(T.self, from: result.data)
                return Response(value: response, response: result.response)
        }
        .receive(on: DispatchQueue.main)
    .eraseToAnyPublisher()
        
    }
}
//        AF.request(route).validate(statusCode: 200..<299).responseDecodable(decoder: decoder, completionHandler: completion)
//    }
//
//    static func performRequest(route: APIConfiguration, completion: @escaping (Result<Any, Error>) -> Void) {
//        AF.request(route).validate(statusCode: 200..<299).responseJSON(completionHandler: completion)
//    }
//}
