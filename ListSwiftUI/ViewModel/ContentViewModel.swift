//
//  ContentViewModel.swift
//  ListSwiftUI
//
//  Created by echo on 7/15/21.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {

    @Published var filteredText: String = ""
    @Published var filteredDataSource: [CountryItem] = []

    private let dataSource: [CountryItem]
    private var subscriptions: Set<AnyCancellable> = []

    init() {
        dataSource = TimeZone.knownTimeZoneIdentifiers.map({ timeZoneIdentifier in
            return CountryItem(name: timeZoneIdentifier.split(separator: "/").last!.replacingOccurrences(of: "_", with: " "))
        })
        filteredDataSource = dataSource

        bindObservers()
    }

    private func bindObservers() {
        $filteredText
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .sink(receiveValue: { [weak self] filteredText in
                guard let self = self else {
                    return
                }
                if filteredText.isEmpty {
                    self.filteredDataSource = self.dataSource
                } else {
                    self.filteredDataSource = self.dataSource.filter({ locationItem in
                        return locationItem.name.lowercased().contains(filteredText.lowercased())
                    })
                }
            })
            .store(in: &subscriptions)
    }

}
