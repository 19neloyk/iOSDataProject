//
//  DetailView.swift
//  DataChallenge
//
//  Created by Neloy Kundu on 6/8/20.
//  Copyright © 2020 Neloy Kundu. All rights reserved.
//

import SwiftUI

struct HorizontalLine : Shape {
    func path (in rect:CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x:rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        return path
    }
}

struct DetailView: View {
    var users: [User]
    var user:User
    var friends : [User] {
        var friends = [User]()
        for friend in user.friends {
            friends.append(users.first(where: {$0.id == friend.id})!)
        }
        return friends
    }
    var body: some View {
            ScrollView{
                Spacer()
                Text("Company: \(user.company)").font(.title).bold()
                Text("About: \(user.about)").font(.headline).padding()
                Divider().accentColor(.black)
                Text("Friends").font(.title)
                ForEach(friends, id: \.id){friend in
                            HStack {
                                NavigationLink(destination: DetailView(users: self.users, user: friend)){
                                Image(systemName: "person.icloud")
                                Spacer()
                                Text(friend.name)
                                }
                            }.padding()
                        
                }
            }.navigationBarTitle(user.name)
    }
}
