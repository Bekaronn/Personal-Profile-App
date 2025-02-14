import SwiftUI

struct HobbyRowView: View {
    let hobby: Hobby

    var body: some View {
        HStack {
            Text(hobby.icon).font(.largeTitle)
            VStack(alignment: .leading) {
                Text(hobby.name).bold()
                Text(hobby.description).font(.caption)
            }
        }
        .padding(5)
    }
}
