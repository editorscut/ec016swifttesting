import Testing
@testable import RPNCalculator

@Suite("Async tests",
       .disabled())
struct AsyncTests {
  @Test
  func twoTimesANumber() async {
    let result = await timesTwo(2.3)
    #expect(result == 4.6)
  }
  
  @Test
  func twoTimesAnotherNumber() async {
    #expect(await timesTwo(7.9) == 15.8)
  }
  
  @Test(.timeLimit(.minutes(1)),
        .bug("http://example.com",
             "longTimesTwo always takes more than 60 seconds"),
        .disabled("Performance issue with longOperation()"))
  func longOperation() async {
    #expect(await longTimesTwo(4.7) == 9.4)
  }
  
  @MainActor
  @Test
  func closureAsync() async {
    let result = await withCheckedContinuation {continuation in
      closureTimesTwo(5.8, completion: {(d: Double) -> Void in
        continuation.resume(returning: d)})
    }
    #expect(result == 11.6)
  }
}

