//
//  AddTagScreen.swift
//  Neram
//
//  Created by Selvarajan on 27/12/21.
//

import SwiftUI

struct AddTagScreen: View {
    @State var text: String = ""
    @State var tags: [Tag] = []
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Text("Tags")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            //Custom tag view
            TagView(maxLimit: 150, tags: $tags)
                .frame(height: 280)
                .padding(.top, 20)
            
            //Textfield
            TextField("apple", text: $text)
                .font(.title3)
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.white.opacity(0.2), lineWidth: 2)
                )
                .environment(\.colorScheme, .dark)
                .padding(.vertical, 12)
            
            // Add Button
            Button(action: {
                
                addTag(tags: tags, text: text, fontSize: 16, maxLimit: 150) { alert, tag in
                    if alert {
                        // showing alert
                        showAlert.toggle()
                    }
                    else {
                        //adding tag
                        tags.append(tag)
                        text = ""
                    }
                }
            }) {
                Text("Add Tag")
                    .fontWeight(.semibold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .background(.white)
                    .foregroundColor(.blue)
                    .cornerRadius(10)
            }
            .disabled(text == "")
            .opacity(text == "" ? 0.6 : 1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
        .background(
                Color.blue
                    .ignoresSafeArea()
            )
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Tag Limit Exceeded try to delete some tags !!!"), dismissButton: .destructive(Text("Ok")))
        }
        
        
    }
}

struct AddTagScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddTagScreen()
    }
}
