//
//  CatDetail.swift
//  RadioactiveCat
//
//  Created by Ellen Shapiro on 8/28/22.
//

import SwiftUI
import Cats
import DatedImage

struct CatDetail: View {
    let cat: Cat
    let datedImage: DatedImage
    
    init(cat: Cat) {
        self.cat = cat
        self.datedImage = cat.datedImages.randomElement()!
    }
    
    var body: some View {
        VStack(spacing: 4) {
            Text(cat.name)
                .font(.headline)
            datedImage.assetsImage
                .resizable()
                .scaledToFit()
            VStack(spacing: 8) {
                Text("Image taken \(SharedFormatters.date.string(from: datedImage.dateTaken))")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
                Text(self.radioactiveText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(self.radioactiveColor)
                    .font(.headline)
            }.padding()
        }
    }

    var radioactiveText: String {
        if cat.isRadioactiveForImage(image: self.datedImage) {
            return "☢️ \(cat.name) was radioactive when this photo was taken! ☢️ "
        } else {
            return "\(cat.name) was not radioactive when this photo was taken"
        }
    }
    
    var radioactiveColor: Color {
        if cat.isRadioactiveForImage(image: self.datedImage) {
            return .red
        } else {
            return .green
        }
    }
}

struct CatDetail_Previews: PreviewProvider {
    static var previews: some View {
        CatDetail(cat: Cats.all.randomElement()!)
    }
}
