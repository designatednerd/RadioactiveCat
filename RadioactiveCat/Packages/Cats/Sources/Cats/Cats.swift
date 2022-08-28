import Foundation
import SwiftUI
import DatedImage

// An actual cat!
public struct Cat: Identifiable, Hashable {
    public static func == (lhs: Cat, rhs: Cat) -> Bool {
        lhs.id == rhs.id
    }
    
    public var id: UUID
    public let name: String
    public let radioactiveDateInterval: DateInterval?
    public let datedImages: [DatedImage]
    
    public init(name: String,
                radioactiveDateInterval: DateInterval? = nil,
                datedImages: [DatedImage]) {
        self.name = name
        self.radioactiveDateInterval = radioactiveDateInterval
        self.datedImages = datedImages
        self.id = UUID()
    }
    
    public func isRadioactiveForImage(image: DatedImage) -> Bool {
        guard let interval = self.radioactiveDateInterval else {
            return false
        }
        
        return interval.contains(image.dateTaken)
    }
}

public struct Cats {
    private static var GMRadioactivityInterval: DateInterval {
        let startDate = Calendar.current.date(from: DateComponents(year: 2022, month: 6, day: 13, hour: 0, minute: 0, second: 0))!
        let endDate = Calendar.current.date(byAdding: .day, value: 80, to: startDate)!
        return DateInterval(start: startDate, end: endDate)
    }
    
    public static let all = [
        Cat(name: "Klaus",
            datedImages: [AssetCatalogImages.klaus]),
        Cat(name: "Chaplin",
            datedImages:  [AssetCatalogImages.chaplin]),
        Cat(name: "Sophie",
            datedImages: [AssetCatalogImages.sophie]),
        Cat(name: "Hank",
            datedImages: [
                AssetCatalogImages.hank_1,
                AssetCatalogImages.hank_2,
                AssetCatalogImages.hank_3
            ]),
        Cat(name: "George Michael",
            radioactiveDateInterval: GMRadioactivityInterval,
            datedImages: [
                AssetCatalogImages.georgie_1,
                AssetCatalogImages.georgie_2,
                AssetCatalogImages.georgie_3,
                AssetCatalogImages.georgie_4,
            ])
    ]
}
