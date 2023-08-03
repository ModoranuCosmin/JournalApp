//
//  AddGratitudeView.swift
//  Journal App
//
//  Created by Modoranu Cosmin on 02.08.2023.
//

import SwiftUI

struct GratitudeDetailsView: View {
    
    var gratitudeEntry: GratitudeEntryModel?
    var updateEntryDate: ((Date) -> Void)?
    var updateEntrySummary: ((String) -> Void)?
    
    @State private var entrySummary: String = "" // Default value for entrySummary
    @State private var date: Date = Date() // Default value for date
    
    init(gratitudeEntry: GratitudeEntryModel? = nil,
         updateEntryDate: ((Date) -> Void)? = nil,
         updateEntrySummary: ((String) -> Void)? = nil) {
        self.gratitudeEntry = gratitudeEntry
        self._entrySummary = State(initialValue: gratitudeEntry?.entrySummary ?? "")
        self._date = State(initialValue: gratitudeEntry?.date ?? Date())
        self.updateEntryDate = updateEntryDate
        self.updateEntrySummary = updateEntrySummary
    }
    
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    DatePickerButton(selectedDate: gratitudeEntry?.date)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    TextField("Type your thoughts", text: $entrySummary, axis: .vertical)
                        .frame(height: 55)
                        .lineLimit(3)
                        .padding(.horizontal)
                    
                    if let photo = gratitudeEntry?.photo {
                        Image(uiImage: photo)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    HStack{
                        ForEach(gratitudeEntry?.tags ?? [""], id: \.self) { tag in
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
                    
                    
                    
                }
                .padding(14)
            }
        }
        .navigationBarItems(trailing:
                                Button{
            print("save")
        } label: {
            Image(systemName: "trash")
                .font(.system(size: 20))
        })
        .navigationBarItems(trailing:
                                Button{
            print("save")
        } label: {
            Image(systemName: "pencil")
                .font(.system(size: 20))
        })
    }
}

struct AddGratitudeView_Previews: PreviewProvider {
    static var previews: some View {
        GratitudeDetailsView(
            updateEntryDate: { newDate in
                // Handle date update
            },
            updateEntrySummary: { newSummary in
                // Handle summary update
            }
        )
    }
}
