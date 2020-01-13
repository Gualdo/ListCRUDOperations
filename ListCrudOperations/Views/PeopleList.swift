//
//  PeopleList.swift
//  ListCrudOperations
//
//  Created by De La Cruz, Eduardo on 10/01/2020.
//  Copyright © 2020 De La Cruz, Eduardo. All rights reserved.
//

import SwiftUI

struct PeopleList: View {
    
    @State var people: [Person] = [
        .init(firstName: "Steve", lastName: "Jobs", image: #imageLiteral(resourceName: "jobs"), jobTitle: "Founder of Apple"),
        .init(firstName: "Tim", lastName: "Cook", image: #imageLiteral(resourceName: "cook"), jobTitle: "Apple CEO"),
        .init(firstName: "Jony", lastName: "Ive", image: #imageLiteral(resourceName: "ive"), jobTitle: "Head of Design")
    ]
    @State var isPresentingAddModal: Bool = false
    
    var body: some View {
        NavigationView {
            List(people) { person in
                PersonRow(person: person, didDelete: { _ in
                    self.people.removeAll(where: { $0.id == person.id })
                })
            }.navigationBarTitle("People")
                .navigationBarItems(trailing:
                    Button(action: {
                        self.isPresentingAddModal.toggle()
                    }, label: {
                        Text("Add")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(Color.green)
                            .cornerRadius(4)
                    }))
                .sheet(isPresented: $isPresentingAddModal, content: { PersonForm(isPresented: self.$isPresentingAddModal, didAddPerson: { p in
                    self.people.append(p)
                }) })
        }
    }
}

struct PeopleList_Previews: PreviewProvider {
    static var previews: some View {
        PeopleList()
    }
}
