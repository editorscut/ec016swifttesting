import Testing
@testable import RPNCalculator

@Suite("Async tests for fake code")
struct AsyncTests {
  @Test
  func twoTimesANumber()  throws {
    Task {
      let result = await timesTwo(2.3)
      #expect(result == 4)
    }
  }
  
  @Test
  func twoTimesANumberB() async throws {
    #expect(await timesTwo(2.3) == 4.6)
  }
}

