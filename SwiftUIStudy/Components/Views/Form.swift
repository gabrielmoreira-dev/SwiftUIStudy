import SwiftUI

struct Form: View {
    @Binding var input: String
    let placeholder: String
    let buttonTitle: String
    let action: () -> Void

    var body: some View {
        VStack {
            TextField(placeholder, text: $input)
                .textFieldStyle(.roundedBorder)
            Button(buttonTitle, action: action)
                .padding(.bottom)
        }
    }
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        let input = Binding<String>(
            get: { String() },
            set: { _ in }
        )
        Form(
            input: input,
            placeholder: "Default title",
            buttonTitle: "OK",
            action: {}
        ).previewLayout(.sizeThatFits)
    }
}
