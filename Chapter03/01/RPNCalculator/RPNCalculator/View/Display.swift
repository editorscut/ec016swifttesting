import SwiftUI

struct Display: View {
  private var displayedValue = CurrentValue.shared.displayedValue
  
  var body: some View {
    HStack {
      Spacer()
      Text(displayedValue)
        .multilineTextAlignment(.trailing)
        .font(.title)
        .padding(10)
    }
    .frame(height: 50)
    .background(Color.green.opacity(0.4))
  }
}

#Preview {
  Display()
}
