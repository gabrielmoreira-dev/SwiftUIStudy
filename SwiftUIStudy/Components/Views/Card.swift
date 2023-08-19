import SwiftUI

struct Card<Content: View>: View {
    let height: CGFloat
    @ViewBuilder var content: () -> Content

    var body: some View {
        ZStack {
            Color(red: 0.9, green: 0.9, blue: 0.9)
                .frame(height: height)
                .opacity(0.7)
                .cornerRadius(20)
                .padding([.leading, .trailing], 16)
                .shadow(radius: 5, x: 5, y: 5)
            content()
                .padding([.leading, .trailing], 16)
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(height: 100) {
            Text("Test")
        }
        .previewLayout(.sizeThatFits)
    }
}
