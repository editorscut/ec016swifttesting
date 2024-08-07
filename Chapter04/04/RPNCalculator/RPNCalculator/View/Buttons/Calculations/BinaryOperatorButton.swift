import SwiftUI

struct BinaryOperatorButton: View {
  let binaryOperator: BinaryOperator
  
  init(_ binaryOperator: BinaryOperator) {
    self.binaryOperator = binaryOperator
  }
  
  var body: some View {
    Button {
      
    } label: {
      Text("\(binaryOperator)")
        .font(.title)
    }
  }
}

#Preview {
  BinaryOperatorButton(.divide)
}
