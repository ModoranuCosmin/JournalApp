import Foundation
import SwiftUI
import Combine

class GratitudeEntryService {
    static func fetchGratitudeEntries() -> Future<[GratitudeEntryModel], Error> {
        let mockData: [GratitudeEntryModel] = [
            GratitudeEntryModel(date: Date(), entrySummary: "Today, I am grateful for the beautiful weather!", photo: UIImage(named: "image1"), tags: ["nature", "weather"]),
            GratitudeEntryModel(date: Date().addingTimeInterval(-86400), entrySummary: "Had a delicious meal with friends.", photo: nil, tags: ["food", "friends"]),
            GratitudeEntryModel(date: Date().addingTimeInterval(-54800), entrySummary: "Received a thoughtful gift from my sister.", photo: UIImage(named: "image2"), tags: ["gifts", "family"]),
        ]
        return Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                promise(.success(mockData))
            }
        }
    }
}
