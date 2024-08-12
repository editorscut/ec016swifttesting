func timesTwo(_ input: Double) async -> Double {
  try? await Task.sleep(for: .seconds(2))
  return input * 2
}

func longTimesTwo(_ input: Double) async -> Double {
  try? await Task.sleep(for: .seconds(90))
  return input * 2
}

@MainActor
func closureTimesTwo(_ input: Double,
                     completion: @escaping (Double) -> Void) {
  Task {
    let result = await timesTwo(input)
    completion(result)
  }
}

