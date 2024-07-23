import SwiftUI
import TemperatureCalculations

struct ContentView: View {
  @Bindable private var temperature = Temperature()
  
  var body: some View {
    VStack {
      Text(temperature.descriptionInC)
      Slider(value: $temperature.inCelsius,
             in: 0...100)
      Text(temperature.descriptionInF)
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
