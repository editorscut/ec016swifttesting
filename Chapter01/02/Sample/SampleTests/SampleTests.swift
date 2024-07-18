import Testing
@testable import Sample

struct SampleTests {
  
  @Test func example() async throws {
    #expect(isConnected == true)
  }
}
