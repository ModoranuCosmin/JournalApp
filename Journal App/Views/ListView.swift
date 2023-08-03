import SwiftUI

struct ListView: View {
    
    @StateObject private var viewModel = GratitudeListViewModel()
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                Text("Daily Gratitude")
                    .font(.title
                        .bold())
                Spacer()
                Button{
                    print("save")
                } label: {
                    Image(systemName: "clock")
                        .font(.system(size: 20))
                }
                NavigationLink(
                    destination: GratitudeDetailsView(),
                    label: {
                        Image(systemName: "plus")
                            .font(.system(size: 20))
                    }
                )
            }
            .padding()
            List{
                ForEach(viewModel.entries) { item in
                    NavigationLink(destination: GratitudeDetailsView(gratitudeEntry: item,updateEntryDate: { newDate in
                        viewModel.updateEntryDate(for: item, newDate: newDate)
                    },
                                                                 updateEntrySummary: { newSummary in
                        viewModel.updateEntrySummary(for: item, newSummary: newSummary)
                    }), label:{
                        ListRowView(
                            gratitudeEntry: item
                        )
                    }
                    )
                }
            }
            .onAppear {
                viewModel.fetchEntries()
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .accentColor(Color(red: 0.3, green: 0.3, blue: 0.3))
    }
}
