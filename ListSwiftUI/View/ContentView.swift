//
//  ContentView.swift
//  ListSwiftUI
//
//  Created by echo on 7/15/21.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel = ContentViewModel()

    let searchBarOffsetY: CGFloat = -23
    let navigationBarColor = Color(red: 0.047, green: 0.047, blue: 1)
    let rowHeight: CGFloat = 50

    init() {
        UINavigationBar
            .appearance()
            .largeTitleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont(name: "Helvetica Neue", size: 30)!
            ]
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .center) {
                    Rectangle()
                        .fill(navigationBarColor)
                        .frame(height: 150)
                    SearchBar(text: $viewModel.filteredText)
                        .offset(y: searchBarOffsetY)
                        .frame(
                            width: geometry.size.width * 0.9
                        )
                    List(viewModel.filteredDataSource) { locationItem in
                            NavigationLink(
                                destination: Text(locationItem.name),
                                label: {
                                    HighlightText(
                                        highlightText: viewModel.filteredText,
                                        text: locationItem.name
                                    )
                                    .font(.title3)
                                }
                            )
                            .frame(height: rowHeight)
                    }.padding(.top, searchBarOffsetY)
                }
                .navigationTitle("Search Location")
            }
            .edgesIgnoringSafeArea(.all)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
