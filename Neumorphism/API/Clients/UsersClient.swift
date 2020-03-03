//
//  UsersClient.swift
//  UsersListApp
//
//  Created by Anatolii Zavialov on 4/10/19.
//  Copyright © 2019 Anatolii Zavialov. All rights reserved.
//

import Foundation
import Combine

enum UsersClient {
    static let client = ApiClient()
}

extension UsersClient {
    static func usersList(items: Int, page: Int) -> AnyPublisher<UsersListResponse, Error> {
        let route = UsersApiRouter.users(count: items, page: page)
        
        return client.performRequest(route: route)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
