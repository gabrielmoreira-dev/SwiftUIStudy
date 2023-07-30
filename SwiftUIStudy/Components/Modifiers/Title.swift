import SwiftUI

struct Title: ViewModifier {
    let padding: CGFloat
    
    init(padding: CGFloat = 16) {
        self.padding = padding
    }
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.heavy)
            .padding(padding)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Text("Test")
            .modifier(Title())
            .previewLayout(.sizeThatFits)
    }
}
