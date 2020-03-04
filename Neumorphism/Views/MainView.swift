//
//  MainView.swift
//  Neumorphism
//
//  Created by Anatolii Zavialov on 02.03.2020.
//  Copyright © 2020 Anatolii Zavialov. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var usersModel = UsersViewModel()
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(usersModel.users) { user in
                    NavigationLink(destination: DetailView(user: user)) {
                        UserView(user: user)
                    }
                }
            }
            .navigationBarTitle(Text("Title"))
        }
            
        .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
