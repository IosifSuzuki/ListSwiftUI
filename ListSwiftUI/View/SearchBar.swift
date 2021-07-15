//
//  SearchBar.swift
//  ListSwiftUI
//
//  Created by echo on 7/15/21.
//

import SwiftUI

struct SearchBar: View {

    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search ...", text: $text)
                .padding(8)
                .cornerRadius(8)
            Button(action: {
                text = ""
            }) {
                Image(systemName: "xmark")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
            }
            .padding(.trailing, 10)
        }
        .shadow(color: Color.gray, radius: 2, x: 0, y: 2)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 2))
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
