//
//  ListRowView.swift
//  Journal App
//
//  Created by Modoranu Cosmin on 02.08.2023.
//

import SwiftUI

struct ListRowView: View {
    
    let gratitudeEntry: GratitudeEntryModel
    
    var body: some View {
        VStack {
            HStack {
                Text(gratitudeEntry.date, style: .date)
                    .opacity(0.5)
                
                Spacer()
            }
            HStack {
                Text(gratitudeEntry.entrySummary)
                    .font(.title3
                        .bold())
                    .font(.system(size: 20))
                Spacer()
            }
            if let photo = gratitudeEntry.photo {
                Image(uiImage: photo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            HStack{
                ForEach(gratitudeEntry.tags ?? [""], id: \.self) { tag in
                    Text("#"+tag)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray)
                        )
                }
                Spacer()
            }
            .padding()
            
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 =  GratitudeEntryModel(date: Date(), entrySummary: "Today, I am grateful for the beautiful weather!", photo: UIImage(named: "sunshine.jpg"), tags: ["nature", "weather"])
    static var previews: some View {
        
        ListRowView(gratitudeEntry:item1)
    }
}
