//
//  MangasVM.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 4/1/25.
//

import SwiftUI

@Observable @MainActor
final class MangasVM {
    let network: DataRepository
    var mangas: [Manga] = []
    
    var showAlert = false
    var errorMsg = ""
     
    init(network: DataRepository = Network()) {
        self.network = network
        Task{
            await self.getMangas()
        }
    }
    
    func getMangas() async{
        do{
            self.mangas = try await network.getMangas()
        }catch{
            self.errorMsg = error.localizedDescription
            showAlert.toggle()
        }
    }
}

