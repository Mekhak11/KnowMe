//
//  PersonCard.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 01.02.24.
//

import SwiftUI

struct PersonCard: View {
    @State var person: PersonModel
    @State var isMoreSelected: Bool = false
    var body: some View {
        card
    }
}

extension PersonCard {
    var card: some View {
        HStack(alignment: .top) {
            image
            Spacer()
            content
            Spacer()
        }
            .background(Color.secondary)
            .cornerRadius(16)
            .padding(16)
        
    }
    
    var content: some View {
        VStack(alignment: .leading) {
            header
            if isMoreSelected {
           //     socials
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            isMoreSelected = false
                        }
                    } label: {
                        Text("Show less")
                    }
                }
            } else {
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            isMoreSelected = true
                        }
                    } label: {
                        Text("Show more")
                    }
                }

            }
            
        }
    }
    var image: some View {
        Image("")
            .cornerRadius(100)
            .frame(width: 120, height: 120)
            .padding()
    }
    
    var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            nickname
            objective
            age
        }
    }
    
    var nickname: some View {
        Text(person.nickName)
            .font(.title)
            .foregroundColor(.black)
    }
    
    var objective: some View {
        Text(person.goalHere)
            .font(.body)
            .foregroundColor(.black)
    }
    
    var age: some View {
        Text(person.dateOfBirth)
            .font(.callout)
            .foregroundColor(.secondary)
    }
    
//    var socials: some View {
//        ForEach(person.social) { social in
//            scialRow(social: social)
//        }
//    }
//    
//    func scialRow(social: SocialModel) -> some View{
//       return HStack {
//            social.type.image
//            Text(social.userName)
//               .font(.callout)
//           Spacer()
//        }
//    }
    
}

//struct PersonCard_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonCard()
//    }
//}
