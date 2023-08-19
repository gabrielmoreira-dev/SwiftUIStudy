import SwiftUI

struct HeaderView: View {
    @Binding var title: String

    var body: some View {
        Text(title)
            .padding(10)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let value = Binding<String>(
            get: { "Title" },
            set: { _ in }
        )
        HeaderView(title: value)
            .previewLayout(.sizeThatFits)
    }
}
