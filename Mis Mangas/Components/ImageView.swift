//
//  ImageView.swift
//  Mis Mangas
//
//  Created by luis david diaz ramirez on 14/1/25.
//

import SwiftUI

struct ImageView: View {
    @State private var vm = ImageVM()
    let url: URL?
    var body: some View {
        VStack{
            if let image = vm.image{
                Image(uiImage: image)
                    .resizable()
            }else{
                ProgressView()
            }
        }
        .onAppear{
            vm.getImage(url: url)
        }
    }
}

#Preview {
    ImageView(url: URL(string: "https://cdn.myanimelist.net/images/manga/1/277301l.jpg"))
}
