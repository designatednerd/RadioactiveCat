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
            datedImages: [Assets.klaus]),
        Cat(name: "Chaplin",
            datedImages:  [Assets.chaplin]),
        Cat(name: "Sophie",
            datedImages: [Assets.sophie]),
        Cat(name: "Hank",
            datedImages: [
                Assets.hank_1,
                Assets.hank_2,
                Assets.hank_3
            ]),
        Cat(name: "George Michael",
            radioactiveDateInterval: GMRadioactivityInterval,
            datedImages: [
                Assets.georgie_1,
                Assets.georgie_2,
                Assets.georgie_3,
                Assets.georgie_4,
            ])
    ]
}
