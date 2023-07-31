import SwiftUI

final class ApplicationData: ObservableObject {
    @Published var title: String = "Default title"
    @StateObject static var shared = ApplicationData()
    
    private init() {}
}
