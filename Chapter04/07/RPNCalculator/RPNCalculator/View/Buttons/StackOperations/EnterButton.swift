import SwiftUI

struct EnterButton: View {
  let currentValue = CurrentValue.shared
  
  var body: some View {
    Button {
      currentValue.enter()
    } label: {
      HStack {
        Spacer()
        
        Text("enter")
          .font(.title)
        Spacer()
      }
    }
    .buttonStyle(.borderedProminent)
  }
}

#Preview {
  EnterButton()
}
