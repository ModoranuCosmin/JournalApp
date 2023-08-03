//
//  DatePickerButton.swift
//  Journal App
//
//  Created by Modoranu Cosmin on 02.08.2023.
//

import SwiftUI
struct DatePickerButton: View {
    @State private var selectedDate: Date
    @State private var showDatePicker = false
    
    init(selectedDate: Date? = nil) {
        _selectedDate = State(initialValue: selectedDate ?? Date())
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    showDatePicker.toggle()
                } label: {
                    Text(selectedDate,style: .date)
                        .padding(.all)
                }
            }
            
            if showDatePicker {
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: .date
                )
                .labelsHidden()
                .datePickerStyle(.graphical)
                .frame(maxHeight: 400)
            }
            
            Spacer()
        }
    }
}

struct DatePickerButton_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerButton()
    }
}
