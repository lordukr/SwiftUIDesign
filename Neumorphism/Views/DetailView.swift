//
//  DetailView.swift
//  Neumorphism
//
//  Created by Anatolii Zavialov on 05.03.2020.
//  Copyright © 2020 Anatolii Zavialov. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var user: User
    
    var body: some View {
        VStack {
            Text(user.userFullName.fullName)
        }
        .padding()
        .navigationBarTitle(Text(user.phoneNumber), displayMode: .automatic)
        .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User(id: UUID(), userFullName: UserFullName(firstName: "Boo", lastName: "Poo"), phoneNumber: "1233423", userPhotoURL: UserAvatar(with: nil, thumb: "https://randomuser.me/api/portraits/thumb/men/80.jpg"), userEmail: "dfasfj@fsdlsdf"))
    }
}
