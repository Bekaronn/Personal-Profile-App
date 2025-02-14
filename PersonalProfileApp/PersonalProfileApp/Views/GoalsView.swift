import SwiftUI

struct GoalsView: View {
    @State private var goals: [Goal] = DataManager.shared.getGoals()
    @State private var newGoal = ""

    var body: some View {
        VStack {
            Text("Мои цели")
                .font(.largeTitle)
                .padding()

            TextField("Добавить цель", text: $newGoal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Добавить") {
                addGoal()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            List {
                ForEach(goals) { goal in
                    Text("📌 \(goal.description)")
                        .padding()
                }
                .onDelete(perform: deleteGoal)
            }
        }
        .navigationTitle("Цели")
    }

    private func addGoal() {
        guard !newGoal.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        withAnimation {
            let newGoalObject = Goal(description: newGoal)
            goals.append(newGoalObject)
            DataManager.shared.saveGoals(goals)
            newGoal = ""
        }
    }

    private func deleteGoal(at offsets: IndexSet) {
        withAnimation {
            goals.remove(atOffsets: offsets)
            DataManager.shared.saveGoals(goals)
        }
    }
}

#Preview {
    GoalsView()
}
