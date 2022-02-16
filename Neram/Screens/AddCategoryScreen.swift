//
//  AddCategoryScreen.swift
//  Neram
//
//  Created by Selvarajan on 21/12/21.
//

import SwiftUI

struct AddCategoryScreen: View {
    @State private var name: String = ""
    @State private var tags: String = ""
    @State private var notes: String = ""
    @State var chips: [[ChipData]] = [
        [ChipData(chipText: "Hello"), ChipData(chipText: "Welcome"), ChipData(chipText: "Thanks")]
    ]
    
    
    var body: some View {
        Form {
            TextField("Enter Category Name: ", text: $name)
            
            VStack(alignment: .leading) {
                Text("Enter Tags: ").foregroundColor(.gray).opacity(0.5)
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        // chips view
                        
                        ForEach(chips.indices, id: \.self){ index in
                            HStack {
                                ForEach(chips[index].indices, id: \.self){ chipIndex in
                                    Text(chips[index][chipIndex].chipText)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal)
                                        .background(Capsule().stroke(.black, lineWidth: 1))
                                        .lineLimit(1)
                                        .overlay(
                                            GeometryReader{ reader -> Color in
                                                let maxX = reader.frame(in: .global).maxX
                                                if maxX > UIScreen.main.bounds.width - 70 && !chips[index][chipIndex].isExceeded {
                                                    DispatchQueue.main.async {
                                                        chips[index][chipIndex].isExceeded = true
                                                        let lastItem = chips[index][chipIndex]
                                                        chips.append([lastItem])
                                                        chips[index].remove(at: chipIndex)
                                                        
                                                    }
                                                }
                                                return Color.clear
                                            },
                                            alignment: .trailing
                                        )
                                        .clipShape(Capsule())
                                        .onTapGesture {
                                            chips[index].remove(at: chipIndex)
                                            if chips[index].isEmpty {
                                                chips.remove(at: index)
                                            }
                                        }
                                }
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 90,
                       height: UIScreen.main.bounds.height / 4)
                .background(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1.5))
                
                TextEditor(text: $tags)
                    .lineSpacing(20)
                    .frame(height: 100)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(.gray).opacity(0.5))
                
                Button {
                    if chips.isEmpty {
                        chips.append([])
                    }
                    withAnimation(.default) {
                        // adding chip to last array
                        chips[chips.count - 1].append(ChipData(chipText: tags))
                        tags = ""
                    }
                    
                } label: {
                    Text("Add Tag")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(.purple)
                        .cornerRadius(4)
                }
                .disabled(tags == "")
                .opacity(tags == "" ? 0.4 : 1)
                
            }.padding(.vertical, 5)
            
            
            VStack(alignment: .leading) {
                Text("Enter Notes: ").foregroundColor(.gray).opacity(0.5)
                TextEditor(text: $notes)
                    .lineSpacing(20)
                    .frame(height: 100)
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(.gray).opacity(0.5))
                
            }.padding(.vertical, 5)
            
            Button("Save Category") {
                // action
            }
            .padding(.vertical)
            .buttonStyle(.borderedProminent)
        }
    }
}

struct AddCategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryScreen()
    }
}

struct ChipData: Identifiable {
    var id = UUID().uuidString
    var chipText : String
    var isExceeded = false
}
