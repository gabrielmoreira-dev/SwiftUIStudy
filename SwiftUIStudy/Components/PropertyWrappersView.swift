import SwiftUI

struct PropertyWrappersView: View {
    @State @ClampedValue private var value = 0
    @ObservedObject var appData: ApplicationData
    @State private var titleInput: String = String()
    @State private var toggleState: Bool = true
    @State private var sliderValue: Float = 5
    @State private var stepperValue: Int = 0
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
            Button("Value: \(value)", action: updateValue)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            Toggle(isOn: $toggleState) { Text(toggleState ? "On" : "Off") }
            ProgressView(value: sliderValue, total: 10)
            Slider(value: $sliderValue, in: 0...10)
            Stepper("Counter: \(stepperValue)", value: $stepperValue, in: 0...10)
            Spacer()
        }.padding()
    }
    
    private func updateTitle() {
        if !titleInput.isEmpty {
            appData.title = titleInput
            titleInput = String()
        }
    }
    
    private func updateValue() {
        self.value += 1
    }
}

struct PropertyWrappersView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrappersView(appData: .shared)
    }
}
