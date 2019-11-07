//
//  GetContent.swift
//  10012650-7211
//
//  Created by Dayne Game on 7/11/19.
//  Copyright © 2019 Dayne Game. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class GetContent: ObservableObject {
    @Published var myData = Content()
    
    init(fileName: String) {
        let name = fileName
        load(fileName: name)
    }
    
    func load(fileName: String) {
        guard let url = URL(string: "https://api.github.com/repos/daynes-swift/\(fileName)/readme?client_id=9020c9d9e8beb1b4af3a&client_secret=036c11e53692d9350454d0786b1d8fda694e4675") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let json = data else { return }
                let swift = try JSONDecoder().decode(Content.self, from: json)
                DispatchQueue.main.async {
                    self.myData = swift
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }
}
