import SwiftUI

struct EditProfileView: View {
    @State private var user = DataManager.shared.getUser()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("Редактировать профиль")
                .font(.largeTitle)
                .padding()

            TextField("Имя", text: $user.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Возраст", value: $user.age, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()

            TextField("Город", text: $user.location)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Сохранить") {
                DataManager.shared.saveUser(user: user)
                dismiss()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            Button("Отмена") {
                dismiss()
            }
            .foregroundColor(.red)
        }
        .padding()
    }
}

#Preview {
    EditProfileView()
}
