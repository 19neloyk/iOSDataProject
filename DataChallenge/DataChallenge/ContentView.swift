//
//  ContentView.swift
//  DataChallenge
//
//  Created by Neloy Kundu on 6/8/20.
//  Copyright © 2020 Neloy Kundu. All rights reserved.
//

import SwiftUI

struct User: Codable {
    let name: String
    let company: String
    let friends: [Friend]
    let id: String
    let about: String
}

struct Friend: Codable {
    let id:String
    let name:String
}



struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Person.entity(),sortDescriptors: []) var persons : FetchedResults<Person>
    @State var users: [User] = [User]()
    var body: some View {
        NavigationView {
            List{
                HStack {
                    Spacer()
                    Text("We live in a society").font(.title).bold().multilineTextAlignment(.center)
                    Spacer()
                }.padding()
            ForEach(users,id: \.name) { user in
                NavigationLink(destination: DetailView(users:self.users, user: user)){
                    HStack {
                        Image(systemName: "person.icloud.fill").foregroundColor(.pink)
                        Spacer()
                        Text(user.name).foregroundColor(.blue).font(.headline).bold()
                    }.padding()
                }
            }
            }
            .navigationBarTitle(Text("List of People"), displayMode: .inline)
        }.onAppear(perform: initiateData)

    }
    func loadUsers() {
        if persons.count > 0 {
            print("NOT FETCHING DATA FROM SERVER")
            return
        } else { //Fetch data from server
            print("FETCHING DATA FROM SERVER")
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-type")
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print("PROBLEM RETRIEVING DATA")
                    return
                }
                if let decodedUsers = try? JSONDecoder().decode([User].self,from: data) {
                    DispatchQueue.main.async {
                        for aUser in decodedUsers {
                            let aPerson = Person(context: self.moc)
                            aPerson.about = aUser.about
                            aPerson.company = aUser.company
                            aPerson.name = aUser.name
                            aPerson.id = aUser.id
                            for aFriend in aUser.friends{
                                let perFren = Acquaintance(context: self.moc)
                                perFren.id = aFriend.id
                                perFren.name = aFriend.id
                                perFren.origin = aPerson
                            }
                            try? self.moc.save()
                        }
                        
                        self.users = decodedUsers
                    }
                    return
                }
                print("PROBLEM DECODING DATA")
            }.resume()
        }
    }
    
    func initiateData() {
        loadUsers()
        var theUsers = [User]()
        for person in self.persons {
            var friends = [Friend]()
            for fren in person.acquaintanceArray{
                friends.append(Friend(id: fren.wrappedId, name: fren.wrappedName))
            }
            var aUser = User(name: person.wrappedName, company: person.wrappedCompany, friends: friends, id: person.wrappedId, about: person.wrappedAbout)
            theUsers.append(aUser)
        }
        self.users = theUsers
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(users: [User]())
    }
}
