import SwiftUI

struct CalculatorView: View {
  var body: some View {
    Grid(horizontalSpacing: 30, verticalSpacing: 15) {
      GridRow {
        DisplayView()
        .gridCellColumns(5)
      }
      GridRow {
        UnaryOperatorButton(.reciprocal)
        NumberButton("7")
        NumberButton("8")
        NumberButton("9")
        BinaryOperatorButton(.divide)
      }
      GridRow {
        UnaryOperatorButton(.squareroot)
        NumberButton("4")
        NumberButton("3")
        NumberButton("2")
        BinaryOperatorButton(.multiply)
      }
      GridRow {
        UnaryOperatorButton(.square)
        NumberButton("1")
        NumberButton("2")
        NumberButton("3")
        BinaryOperatorButton(.substract)
      }
      GridRow {
        DropButton()
        NumberButton("0")
        DecimalPointButton()
        UnaryOperatorButton(.plusminus)
        BinaryOperatorButton(.add)
      }

      GridRow {
        ClearButton()
        EnterButton()
          .gridCellColumns(3)
        ClearEntryButton()

      }
    }
    .padding(.horizontal)
  }
}

#Preview {
  CalculatorView()
}
