//
//  CharacterView.swift
//  BBQuotes17
//
//  Created by Mohamed Nagi on 09/01/2025.
//

import SwiftUI

struct CharacterView: View {
    let show: String
    let character: Character
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                Image("\(show.lowercased().replacingOccurrences(of: " ", with: ""))")
                    .resizable()
                    .scaledToFit()
                ScrollView {
                    VStack(alignment: .leading) {
                        AsyncImage(url: character.images[0]) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: geo.size.width/1.2, height: geo.size.height/1.8)
                        .clipShape(.rect(cornerRadius: 25))
                        .padding(.top, 90)
                        
                        Text(character.name)
                            .font(.largeTitle)
                        
                        Text("Portrayed By: \(character.portrayedBy)")
                            .font(.subheadline)
                        
                        Divider()
                        
                        Text("\(character.name) Character Info")
                            .font(.title2)
                        
                        Text("Born: \(character.birthday)")
                        
                        Divider()
                        
                        Text("Occupations:")
                        ForEach(character.occupations, id: \.self) { occupation in
                            Text("•\(occupation)")
                                .font(.subheadline)
                        }
                        
                        Divider()
                        
                        Text("Nicknames:")
                        if character.aliases.count > 0 {
                            ForEach(character.aliases, id: \.self) { alias in
                                Text("•\(alias)")
                                    .font(.subheadline)
                            }
                        }else {
                            Text("None")
                                .font(.subheadline)
                        }
                    }
                    
                }
                .frame(width: geo.size.width/1.25, alignment: .leading)
                .scrollIndicators(.hidden)
            }
            .ignoresSafeArea()
        }
    }
}

//#Preview {
//    CharacterView(show: "Breaking Bad", character: ViewModel().character)
//}
