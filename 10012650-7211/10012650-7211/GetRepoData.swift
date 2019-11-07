//
//  GetRepoData.swift
//  10012650-7211
//
//  Created by Dayne Game on 6/11/19.
//  Copyright © 2019 Dayne Game. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public class GetRepoData: ObservableObject {
    @Published var repos = [Repo]()
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "https://api.github.com/users/daynes-swift/repos?client_id=9020c9d9e8beb1b4af3a&client_secret=036c11e53692d9350454d0786b1d8fda694e4675?sort=created&direction=asc")!
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([Repo].self, from: d)
                    DispatchQueue.main.async {
                        self.repos = decodedLists
                    }
                }else {
                    print("No Data")
                }
            } catch {
                print ("Error")
            }
        }.resume()
    }
}
