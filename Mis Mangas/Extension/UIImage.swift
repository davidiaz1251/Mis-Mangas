//
//  UIImage.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 14/1/25.
//

import UIKit

extension UIImage{
    func resizedImage(width: CGFloat) async -> UIImage? {
        let scale = width / self.size.width
        let height = self.size.height * scale
        let size = CGSize(width: width, height: height)
        return await byPreparingThumbnail(ofSize: size)
    }
    
    func resizedImage(width: CGFloat)  -> UIImage? {
        let scale = width / self.size.width
        let height = self.size.height * scale
        let size = CGSize(width: width, height: height)
        return preparingThumbnail(of: size)
    }
}
