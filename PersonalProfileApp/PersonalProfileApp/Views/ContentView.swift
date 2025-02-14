import SwiftUI

struct ContentView: View {
    @State private var isDarkMode = ThemeManager.shared.isDarkMode
    @State private var user = DataManager.shared.getUser()
    @State private var showEditProfile = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .shadow(radius: 10)

                Text(user.name)
                    .font(.title)
                    .fontWeight(.bold)
                Text("\(user.age) лет, \(user.location)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Button("Редактировать профиль") {
                    showEditProfile.toggle()
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)

                HStack(spacing: 30) {
                    NavigationLink(destination: HobbiesView()) {
                        Label("Хобби", systemImage: "heart.fill")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: GoalsView()) {
                        Label("Цели", systemImage: "target")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }

                Toggle("Тёмная тема", isOn: $isDarkMode)
                    .padding()
                    .onChange(of: isDarkMode) { value in
                        ThemeManager.shared.setDarkMode(value)
                    }

                Spacer()
            }
            .padding()
            .navigationTitle("Профиль")
            .onAppear {
                user = DataManager.shared.getUser() // Обновляем данные при появлении экрана
            }
            .fullScreenCover(isPresented: $showEditProfile, onDismiss: {
                user = DataManager.shared.getUser() // Обновляем данные после закрытия редактирования
            }) {
                EditProfileView()
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    ContentView()
}
