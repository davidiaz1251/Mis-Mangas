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
    var genres: [GenreModel] = []
    
    var showAlert = false
    var errorMsg = ""
    var search = ""
    
    
    init(network: DataRepository = Network()) {
        self.network = network
        Task{
            await self.getBestMangas()
        }
    }
    
    
    
    func getMangaByGenre(genre: GenreModel) async{
        do{
            let mangasByGenre = try await network.getMangasByGenre(genre: genre)
            self.mangas = mangasByGenre
        }catch{
            self.errorMsg = error.localizedDescription
            showAlert.toggle()
        }
    }
    
    func getGenres() async{
        do{
            self.genres = try await network.getGenres()
        }catch{
            print(error.localizedDescription)
            self.errorMsg = error.localizedDescription
            showAlert.toggle()
        }
    }
    
    func getBestMangas() async{
        do{
            self.mangas = try await network.getBestMangas()
            print("\(self.mangas.count)")
        }catch{
            print(error.localizedDescription)
            self.errorMsg = error.localizedDescription
            showAlert.toggle()
        }
    }
}

