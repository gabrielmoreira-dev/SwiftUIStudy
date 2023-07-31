import SwiftUI

struct PropertyWrappersView: View {
    @ClampedValue private var value: Int = 0
    @ObservedObject var appData: ApplicationData
    @State private var titleInput: String = String()
    @Environment(\.colorScheme) var mode
    
    var body: some View {
        VStack {
            HeaderView(title: $appData.title)
            Form(
                input: $titleInput,
                placeholder: "Insert title",
                buttonTitle: "Change title",
                action: updateTitle
            )
            Image(systemName: "trash")
                .font(.system(size: 50))
                .foregroundColor(mode == .dark ? .yellow : .blue)
                .symbolVariant(mode == .dark ? .fill : .circle)
            Spacer()
        }
        .padding()
    }
    
    private func updateTitle() {
        if !titleInput.isEmpty {
            appData.title = titleInput
            titleInput = String()
        }
    }
}

struct PropertyWrappersView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrappersView(appData: .shared)
    }
}
