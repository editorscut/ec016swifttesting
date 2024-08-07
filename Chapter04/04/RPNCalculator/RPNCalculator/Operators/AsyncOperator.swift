func timesTwo(_ input: Double) async -> Double {
  try? await Task.sleep(for: .seconds(2))
  return input * 2
}

