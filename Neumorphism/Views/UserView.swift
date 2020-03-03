//
//  UserView.swift
//  Neumorphism
//
//  Created by Anatolii Zavialov on 03.03.2020.
//  Copyright © 2020 Anatolii Zavialov. All rights reserved.
//

import SwiftUI

struct UserView: View {
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            URLImage(url: user.userPhotoURL.thumb)
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray.opacity(30), lineWidth: 1))
                
            VStack {
                Text("\(user.userFullName.fullName)")
                Text("\(user.phoneNumber)")
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User(id: UUID(), userFullName: UserFullName(firstName: "Boo", lastName: "Poo"), phoneNumber: "1233423", userPhotoURL: UserAvatar(with: nil, thumb: nil), userEmail: "dfasfj@fsdlsdf"))
    }
}
