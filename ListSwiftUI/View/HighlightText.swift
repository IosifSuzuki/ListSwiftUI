//
//  HighlightText.swift
//  ListSwiftUI
//
//  Created by echo on 7/15/21.
//

import SwiftUI

struct HighlightText: View {

    var highlightText: String
    var text: String

    var body: some View {
        let highlightText = self.highlightText.lowercased()
        let text = self.text.lowercased()
        let range = text.range(of: highlightText)
        if let range = range {
            var fullText: Text
            let leftPartText = Text(self.text[..<range.lowerBound])
            let middlePartText = Text(self.text[range])
                .bold()
            fullText = leftPartText + middlePartText
            let rightPartText = Text(self.text[ range.upperBound...])
            fullText = fullText + rightPartText
            return fullText
        } else {
            return Text(self.text)
        }

    }
}

struct HighlightText_Previews: PreviewProvider {
    static var previews: some View {
        HighlightText(highlightText: "World", text: "Hello World")
    }
}
