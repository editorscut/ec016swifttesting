import Testing
@testable import Sample

@Suite
struct SampleTests {
    @Test("SampleTests tests")
    func example() {
        #expect(isConnected == true)
    }
}
