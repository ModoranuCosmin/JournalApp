import SwiftUI
import Combine

class GratitudeListViewModel: ObservableObject {
    @Published var entries: [GratitudeEntryModel] = []
    private var cancellables: Set<AnyCancellable> = []
    
    func updateEntrySummary(for entry: GratitudeEntryModel, newSummary: String) {
        if let index = entries.firstIndex(where: { $0.id == entry.id }) {
            entries[index].entrySummary = newSummary
        }
    }

    func updateEntryDate(for entry: GratitudeEntryModel, newDate: Date) {
        if let index = entries.firstIndex(where: { $0.id == entry.id }) {
            entries[index].date = newDate
        }
    }
    
    func sortEntriesByDateDescending() {
        entries.sort { $0.date > $1.date }
    }
    
    func fetchEntries() {
        GratitudeEntryService.fetchGratitudeEntries()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching gratitude entries: \(error)")
                }
            } receiveValue: { [weak self] entries in
                self?.entries = entries
                self?.sortEntriesByDateDescending()
            }
            .store(in: &cancellables)
    }
}
