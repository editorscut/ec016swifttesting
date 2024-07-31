import Observation

@MainActor
@Observable
class CurrentValue {
  static let shared = CurrentValue()
  var displayedValue: String = ""
}
