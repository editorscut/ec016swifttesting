import SwiftUI

struct EnterButton: View {
  
  var body: some View {
    Button {
      
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
