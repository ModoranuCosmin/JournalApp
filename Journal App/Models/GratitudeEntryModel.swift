import Foundation
import SwiftUI

struct GratitudeEntryModel: Identifiable {
    let id: String = UUID().uuidString
    var date: Date
    var entrySummary: String
    let photo: UIImage?
    let tags: [String]?
    }
