import SwiftUI

struct ProfileImageView: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .shadow(radius: 5)
    }
}
