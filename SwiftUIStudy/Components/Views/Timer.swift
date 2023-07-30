import SwiftUI

struct Timer: View {
    var body: some View {
        Text(Date(), style: .timer)
            .modifier(Title())
            .background(Color.gray)
            .border(Color.black, width: 4)
            .cornerRadius(8)
    }
}

struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        Timer().previewLayout(.sizeThatFits)
    }
}
