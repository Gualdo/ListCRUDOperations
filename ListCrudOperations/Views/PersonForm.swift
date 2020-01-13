//
//  PersonForm.swift
//  ListCrudOperations
//
//  Created by De La Cruz, Eduardo on 10/01/2020.
//  Copyright © 2020 De La Cruz, Eduardo. All rights reserved.
//

import SwiftUI

struct PersonForm: View {
    
    @Binding var isPresented: Bool
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    
    var didAddPerson: (Person) -> ()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Create Person")
                .fontWeight(.heavy)
                .font(.system(size: 32))
            
            HStack(spacing: 16) {
                Text("First Nmane")
                TextField("First Name", text: $firstName)
                    .padding(.all, 12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .strokeBorder(style: StrokeStyle(lineWidth: 1))
                            .foregroundColor(Color(.sRGB, red: 0.1, green: 0.1, blue: 0.1, opacity: 0.2))
                )
            }
            
            HStack(spacing: 16) {
                Text("Last Nmane")
                TextField("Last Name", text: $lastName)
                    .padding(.all, 12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .strokeBorder(style: StrokeStyle(lineWidth: 1))
                            .foregroundColor(Color(.sRGB, red: 0.1, green: 0.1, blue: 0.1, opacity: 0.2))
                )
            }
            
            Button(action: {
                let person = Person(firstName: self.firstName, lastName: self.lastName, image: UIImage(named: "jobs")!, jobTitle: "Recently added")
                self.didAddPerson(person)
                self.isPresented = false
            }, label: {
                HStack {
                    Spacer()
                    Text("Add")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                    Spacer()
                }
            })
                .background(Color.green)
                .cornerRadius(4)
            
            Button(action: {
                self.isPresented = false
            }, label: {
                HStack {
                    Spacer()
                    Text("Cancel")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                    Spacer()
                }
            })
                .background(Color.red)
                .cornerRadius(4)
            Spacer()
        }.padding(.all, 20)
    }
}
