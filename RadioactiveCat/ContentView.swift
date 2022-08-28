//
//  ContentView.swift
//  RadioactiveCat
//
//  Created by Ellen Shapiro on 8/28/22.
//

import SwiftUI
import Cats

struct ContentView: View {
    var body: some View {
        NavigationStack {
            LazyVStack(spacing: 20) {
                ForEach(Cats.all) { cat in
                    NavigationLink(value: cat) {
                        Text(cat.name)
                    }
                }
            }.navigationDestination(for: Cat.self) { cat in
                CatDetail(cat: cat)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
