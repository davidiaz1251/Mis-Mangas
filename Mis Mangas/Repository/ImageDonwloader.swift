
//
//  AsyncImage.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 13/1/25.
//

import SwiftUI

actor ImageDonwloader{
    static let shared = ImageDonwloader()
    
    private enum ImageStatus{
        case donwloading(_ task: Task<UIImage, any Error>)
        case downloaded(_ image: UIImage)
    }
    
    private var cache: [URL: ImageStatus] = [:]
    
    private func getImage(url: URL) async throws -> UIImage{
        let (data, _) = try await URLSession.shared.data(from: url)
        return if let image = UIImage(data: data){
            image
        }else{
            throw URLError(.badURL)
        }
    }
    
    func image(from url: URL) async throws -> UIImage{
        if let status = cache[url]{    
            return switch status{
            case .donwloading(let task):
                try await task.value
            case .downloaded(let image):
                image
            }
        }
        let task = Task{ try await getImage(url: url) }
        
        cache[url] = .donwloading(task)
        
        do{
            let image = try await task.value
            cache[url] = .downloaded(image)
            try await saveimage(url: url)
            return image
        }catch{
            cache.removeValue(forKey: url)
            throw error
        }
    }
    
    private func saveimage(url: URL) async throws{
        guard let imageCache = cache[url] else{ return }
        if case .downloaded(let image) = imageCache,
           let resized = await image.resizedImage(width: 300)?.heicData(){
            try resized.write(to: urlDoc(url: url), options: .atomic)
            cache.removeValue(forKey: url)
        }
    }
    
    nonisolated func urlDoc(url: URL) -> URL{
        let path = url.deletingPathExtension().appendingPathExtension("heic").lastPathComponent
        return URL.cachesDirectory.appending(path: path)
    }
}
