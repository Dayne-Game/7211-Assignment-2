//
//  ContentView.swift
//  10012650-7211
//
//  Created by Dayne Game on 6/11/19.
//  Copyright © 2019 Dayne Game. All rights reserved.
//

import SwiftUI

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .medium
    return dateFormatter
}()

struct ContentView: View {
    @ObservedObject var data = GetRepoData()

    var body: some View {
        NavigationView {
            List {
                ForEach(data.repos) { item in
                    NavigationLink(
                        destination: DetailView(name: item.name)
                    ) {
                        Text(item.description)
                    }
                }
            }
        .navigationBarTitle(Text("Playground"))
        }
    }
}

struct DetailView: View {
    var fileName: String
    var hello: GetContent
    
    init(name: String) {
        self.fileName = name
        self.hello = GetContent(fileName: fileName)
    }
    
    var body: some View {
        Group {
            Text(hello.myData!.content)
        }.navigationBarTitle(Text("Detail"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
