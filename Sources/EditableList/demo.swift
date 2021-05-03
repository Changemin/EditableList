struct ContentView: View {
    var cells: [Cell] = generateRandomCells(size: 10)
    
    var body: some View {
        ScrollView {
            ForEach(cells, id: \.self) { cell in
                CellView(cell: cell)
            }
        }
    }
}

struct Cell: Hashable {
//    var image: Image
    var title: String
    var subTitle: String
}

struct CellView: View {
    @State var isActive: Bool = false
    var cell: Cell
    var body: some View {
        HStack {
            Rectangle().frame(width: 50, height: 50)
                .foregroundColor(colors.randomElement())
                .cornerRadius(3).padding(.trailing, 5)
            
            VStack(alignment: .leading) {
                Text(cell.title).font(.headline)
                Text(cell.subTitle).font(.callout).foregroundColor(Color.black.opacity(0.5))
            }
            Spacer()
            Image(systemName: "line.horizontal.3")
                .font(.headline)
                .gesture(
                    LongPressGesture(minimumDuration: 1)
                        .onEnded { _ in
                            self.isActive.toggle()
                        }
                )
        }.padding(.horizontal)
        .background(Color.white.shadow(radius: isActive ? 10 : 0))
    }
}

func generateRandomCells(size: Int) -> [Cell] {
    var cells: [Cell] = []
    for i in 0..<size {
        cells.append(Cell(title: "test\(i+1)", subTitle: "subtitle"))
    }
    return cells
}

let colors: [Color] = [.red, .black, .blue, .green, .pink, .orange]

