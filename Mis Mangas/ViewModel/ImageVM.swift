//
//  ImageVM.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 14/1/25.
//

import SwiftUI

@Observable @MainActor
final class ImageVM{
    let imageDownloader = ImageDonwloader.shared
    
    var image: UIImage?
              
    func getImage(url: URL?){
        guard let url else{ return }
        let docURL = imageDownloader.urlDoc(url: url)
        if FileManager.default.fileExists(atPath: docURL.path),
           let data = try? Data(contentsOf: docURL){
            image = UIImage(data: data)
        }else{
            Task{
                await getImageAsync(url: url)
            }
        }
    }
    
    
    func getImageAsync(url: URL) async{
        do{
            let image = try await imageDownloader.image(from: url)
            self.image = image
        }catch{
            print("\(url)")
            print(error)
        }
    }
}
