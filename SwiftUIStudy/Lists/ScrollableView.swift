import SwiftUI

struct ScrollableView: View {
    let guides = [
        GridItem(.fixed(75)),
        GridItem(.fixed(75)),
        GridItem(.fixed(75))
    ]

    @ViewBuilder
    var carousel: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(1...10, id: \.self) { value in
                    VStack {
                        Text("Value")
                        Text("\(value)")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }

    @ViewBuilder
    var gridView: some View {
        LazyVGrid(columns: guides) {
            ForEach(1...12, id: \.self) { value in
                Text("\(value)")
                    .font(.system(size: 24))
            }
        }
    }

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack {
                    ForEach(0...5, id: \.self) { value in
                        VStack {
                            Text("Value: \(value)")
                            Divider()
                        }
                    }
                    carousel.padding(16)
                    gridView
                    Button("Go back") {
                        proxy.scrollTo(0, anchor: .top)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct ScrollableView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableView()
    }
}
