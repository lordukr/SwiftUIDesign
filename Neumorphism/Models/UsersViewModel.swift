//
//  UsersViewModel.swift
//  Neumorphism
//
//  Created by Anatolii Zavialov on 03.03.2020.
//  Copyright © 2020 Anatolii Zavialov. All rights reserved.
//

import Foundation
import Combine

public class UsersViewModel: ObservableObject {
    @Published var users = [User]()
    var request: AnyCancellable?
    
    init() {
        loadUsers()
    }
    
    func loadUsers() {
        if let request = request {
            request.cancel()
        }
        
        request = UsersClient.usersList(items: 100, page: 1)
            .print()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print("failed")
                    print(error.localizedDescription)
                }
            }) { (usersResponse) in
                self.users = usersResponse.items
        }
        
    }
}
