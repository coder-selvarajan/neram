//
//  AddActivityScreen.swift
//  Neram
//
//  Created by Selvarajan on 21/12/21.
//

import SwiftUI

struct AddActivityScreen: View {
    @State private var category: Int?
    @State private var hoursSpent: Double = 0.0
    @State private var activityDate: Date = Date()
    @State private var tags: String = ""
    @State private var description: String = ""
    
    private var categoryValues = [ "One", "Two", "Three", "Four", "Five"]
    
    var body: some View {
        Form {
            HStack{
                Text("Category:")
                Spacer()
                Picker(selection: $category, label: Text("Category:")) {
                    ForEach(0 ..< categoryValues.count) {index in
                        Text(self.categoryValues[index]).tag(index)
                    }
                }
                .pickerStyle(.menu)
            }
            
            VStack {
                HStack {
                    Text("Hours Spent: ")
                    Spacer()
                    Text(String(format: "%.1f", hoursSpent))
                }
                Slider(value: $hoursSpent, in: 0...6, step: 0.5)
            }
            DatePicker("Activity Date: ", selection: $activityDate, displayedComponents: .date)
            
            VStack(alignment: .leading) {
                Text("Enter Tags: ")
                TextEditor(text: $description)
                    .lineSpacing(20)
                    .frame(height: 100)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(.gray).opacity(0.5))
                
            }.padding(.vertical, 5)
            
            VStack(alignment: .leading) {
                Text("Enter Notes: ")
                TextEditor(text: $tags)
                    .lineSpacing(20)
                    .frame(height: 200)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(.gray).opacity(0.5))
                
            }.padding(.vertical, 5)
            
            Button("Save Activity") {
                // action
            }
            .padding(.vertical)
            .buttonStyle(.borderedProminent)
        }
//        .accentColor(.red)
    }
}

struct AddActivityScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityScreen()
    }
}
