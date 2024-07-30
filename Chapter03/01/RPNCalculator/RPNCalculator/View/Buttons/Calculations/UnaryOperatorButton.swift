import SwiftUI

struct UnaryOperatorButton: View {
  let unaryOperator: UnaryOperator
  
  init(_ unaryOperator: UnaryOperator) {
    self.unaryOperator = unaryOperator
  }
  
  var body: some View {
    Button {
      
    } label: {
      Text("\(unaryOperator)")
        .font(.title)
        .foregroundStyle(unaryOperator == .plusminus ? .black : .accentColor)
    }
  }
}

#Preview {
  UnaryOperatorButton(.plusminus)
}
