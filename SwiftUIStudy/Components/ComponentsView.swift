import SwiftUI

struct ComponentsView: View {
    @ScaledMetric var cardHeight = 200
    let showInfoIcon = true

    @ViewBuilder
    var infoView: some View {
        if showInfoIcon {
            Image(systemName: "info.circle")
                .font(.system(size: 36))
                .symbolVariant(.fill)
        } else {
            Text("Information")
        }
    }

    @ViewBuilder
    var cardView: some View {
        Card(height: cardHeight) {
            VStack {
                infoView
                Text((2.56756).formatted(.currency(code: "BRL")))
                Text(Date().formatted(date: .complete, time: .omitted))
                Timer()
            }
        }
    }

    var body: some View {
        ZStack {
            Image("beach")
                .resizable()
                .blur(radius: 4)
                .ignoresSafeArea()
            cardView
        }
        .onAppear {
            print("View loaded!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentsView()
    }
}
