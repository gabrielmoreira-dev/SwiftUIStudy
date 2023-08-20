import SwiftUI

struct ListsView: View {
    @State private var selectedRows: Set<Int> = []
    @State private var editActive: Bool = false

    var body: some View {
        VStack {
            HStack {
                Button(editActive ? "Done" : "Edit") {
                    editActive.toggle()
                }
                Spacer()
                Button(action: {
                    print(selectedRows)
                }, label: {
                    Image(systemName: "trash")
                }).disabled(selectedRows.isEmpty)
            }.padding()
            PlainList(selectedRows: $selectedRows, editActive: $editActive)
        }
    }
}

struct PlainList: View {
    @Binding var selectedRows: Set<Int>
    @Binding var editActive: Bool

    var body: some View {
        List(selection: $selectedRows) {
            ForEach(0..<5) { value in
                Text("Value: \(value)")
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 10, trailing: 16))
                    .listRowSeparator(.hidden)
                    .swipeActions {
                        Button(role: .destructive, action: {
                            print("Removed")
                        }, label: {
                            Image(systemName: "trash")
                        })
                    }
            }.onDelete { value in
                print("\(value)")
            }.onMove { source, destination in
                print("\(source) \(destination)")
            }
        }.listStyle(.plain)
            .environment(\.editMode, .constant(editActive ? .active : .inactive))
            .refreshable {
                print("Loading values")
            }
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        ListsView()
    }
}
