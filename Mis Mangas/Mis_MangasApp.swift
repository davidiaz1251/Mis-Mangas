//
//  Mis_MangasApp.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 7/12/24.
//

import SwiftUI

@main
struct Mis_MangasApp: App {
    @State var vm = MangasVM()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(vm)
        }
    }
}
