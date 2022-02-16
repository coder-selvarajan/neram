//
//  ListTest.swift
//  Neram
//
//  Created by Selvarajan on 21/12/21.
//

import SwiftUI

struct ListTest: View {
    @State var username : String = ""
    private var colors: [Color] = [.blue, .green, .indigo, .pink, .orange, .gray, .black, .gray, .red]
    @State var users = ["one", "two", "three", "four", "five", "one", "two", "three", "four", "five", "one", "two", "three", "four", "five"]
    
    @State var categories = ["Entertainment", "Family", "Development", "Learning", "Yoga"]
    
    var body: some View {
        NavigationView {
            List {
                //            GroupBox(label: Text("Slide to add hours").font(.footnote).foregroundColor(.gray)) {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(categories, id: \.self) { category in
                        let index = categories.firstIndex(of: category)
                        
                        HStack {
                            Label(category, systemImage: "doc.circle")
                                .foregroundColor(colors[index ?? 0])
                            //                            .frame(maxWidth: .infinity)
                                .padding(15)
                            Spacer()
                        }
                        .background(RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(.gray)
                                        .opacity(0.05)
                                        .frame(maxWidth: .infinity))
                        
                        //                        Text(category)
                        //                            .foregroundColor(.black)
                        //                            .frame(maxWidth: .infinity)
                        //                            .padding(15)
                        //                            .background(RoundedRectangle(cornerRadius: 5)
                        //                                            .foregroundColor(.gray)
                        ////                                            .foregroundColor(colors[index ?? 0])
                        //                                            .opacity(0.25))
                    }
                }
                
                //            }
                .listRowSeparatorTint(.white)
                
                Section(header: Text("Dec 21").font(.title2)) {
                    ForEach(1...15, id: \.self){ index in
                        Text (randomString(length: Int.random(in: 10...50))).font(.headline)
                    }
                }
                
                Section(header: Text("Dec 20").font(.title2)) {
                    ForEach(1...15, id: \.self){ index in
                        Text (randomString(length: Int.random(in: 10...50))).font(.headline)
                    }
                }
                
                Section(header: Text("Dec 19").font(.title2)) {
                    ForEach(1...15, id: \.self){ index in
                        Text (randomString(length: Int.random(in: 10...50))).font(.headline)
                    }
                }
                
            }
            .listStyle(PlainListStyle())
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Spacer()
                    NavigationLink(destination: AddActivityScreen()) {
                        Capsule()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                            .overlay(Text("+")
                                        .font(.title)
                                        .foregroundColor(.white))
                            .padding()
                    }
                }
            }
            .navigationTitle("Neram")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "text.justify").padding(.horizontal)
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddCategoryScreen()) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    NavigationLink(destination: AddTagScreen()) {
                        Image(systemName: "chart.pie.fill")
                            .foregroundColor(.blue)
                    }
                }
                
//                ToolbarItem(placement: .navigationBarTrailing) {
////                    HStack {
////                        Spacer()
//                        Button {
//                            //
//                        } label: {
//                            Image(systemName: "plus.circle.fill").padding(.horizontal)
//                        }
//                        Button {
//                        //
//                    } label: {
//                        Image(systemName: "chart.pie.fill").padding(.horizontal)
//                    }
////                    }
//                }
            }
        }
//        .accentColor(.blue)
        
        
    }
    
    func randomString(length: Int) -> String {
        let letters = "      abcdefghijklmnopqrstuvwxyz"
        let caps = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let rStr = String((0..<length).map{ _ in letters.randomElement()! })
        
        let firstLetter = String(caps.randomElement() ?? "A")
        return firstLetter + rStr.trimmingCharacters(in: CharacterSet(charactersIn: " "))
    }
    
}

struct ListTest_Previews: PreviewProvider {
    static var previews: some View {
        ListTest()
    }
}
