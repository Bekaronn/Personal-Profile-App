import SwiftUI

struct HobbiesView: View {
    @State private var hobbies = DataManager.shared.getHobbies()
    @State private var newHobbyName = ""

    var body: some View {
        VStack {
            Text("Мои хобби")
                .font(.largeTitle)
                .padding()

            TextField("Добавить хобби", text: $newHobbyName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Добавить") {
                addHobby()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            List {
                ForEach(hobbies) { hobby in
                    HStack {
                        Text(hobby.icon)
                        VStack(alignment: .leading) {
                            Text(hobby.name).font(.headline)
                            Text(hobby.description).font(.subheadline).foregroundColor(.gray)
                        }
                    }
                    .padding()
                }
                .onDelete(perform: deleteHobby)
            }
        }
        .navigationTitle("Хобби")
    }

    private func addHobby() {
        guard !newHobbyName.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        withAnimation {
            let newHobby = Hobby(icon: "⭐️", name: newHobbyName, description: "Новое увлечение")
            hobbies.append(newHobby)
            DataManager.shared.saveHobbies(hobbies)
            newHobbyName = ""
        }
    }

    private func deleteHobby(at offsets: IndexSet) {
        withAnimation {
            hobbies.remove(atOffsets: offsets)
            DataManager.shared.saveHobbies(hobbies)
        }
    }
}

#Preview {
    HobbiesView()
}
