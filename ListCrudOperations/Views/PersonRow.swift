//
//  PersonRow.swift
//  ListCrudOperations
//
//  Created by De La Cruz, Eduardo on 10/01/2020.
//  Copyright © 2020 De La Cruz, Eduardo. All rights reserved.
//

import SwiftUI

struct PersonRow: View {
    
    var person: Person
    var didDelete: (Person) -> ()
    
    var body: some View {
        HStack {
            Image(uiImage: person.image)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 60)
                        .strokeBorder(style: StrokeStyle(lineWidth: 2)))
                .foregroundColor(Color.black)
                .cornerRadius(60)
            VStack(alignment: .leading) {
                Text("\(person.firstName) \(person.lastName)")
                    .fontWeight(.bold)
                Text(person.jobTitle)
                    .fontWeight(.light)
            }
            Spacer()
            Button(action: {
                self.didDelete(self.person)
            }, label: {
                Text("Delete")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.all, 12)
                    .background(Color.red)
                    .cornerRadius(3)
            })
        }.padding(.vertical, 8)
    }
}
