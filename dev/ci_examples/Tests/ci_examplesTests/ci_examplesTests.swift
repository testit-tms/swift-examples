import XCTest
@testable import ci_examples
import testit_adapters_swift


// with adapterMode 2, each test class running in the separate isolated environment and produce it's own test-run.
// use adapterMode 1 or 0 with provided testRunId for populating all test classes results in one testrun

final class ci_examplesTests: TestItXCTestCase {
    // XCTest Documentation
    // https://developer.apple.com/documentation/xctest

    // Defining Test Cases and Test Methods
    // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods

    override func setUp() {
        super.setUp()
        print("User setup logic: Starting 1-second delay...")
        Thread.sleep(forTimeInterval: 1.0)
        print("User setup logic: 1-second delay completed.")
    }

    override func tearDown() {
        super.tearDown()
        print("User teardown logic: Starting 1-second delay...")
        Thread.sleep(forTimeInterval: 1.0)
        print("User teardown logic: 1-second delay completed.")
    }

    func testExampleOk() {
        print("Running testExampleOk")
        
        // attachments must be available for test bundle for read permission (add it to the test target)
        let filePath = "file.txt"

        TestItContextBuilder()
            //.ExternalId("ext-123")
            //.Name("Example1")
            .Description("ok test example")
            .WorkItems(["2689"])
            // autotest links
            .Links([LinkEntity(title: "TestLink", url: "https://test.com",
                description: "TestDescription", type: LinkEntityType.related)])
            // test result's links
            .AddLinks([LinkEntity(title: "TestLink", url: "https://test.com",
                description: "TestDescription", type: LinkEntityType.related)])
            .Parameters(["version": "1.0", "env": "staging"])
            .Labels([LabelEntity(name: "TestLabel")])
            // test result's attachments
            .Attachments([filePath])
            .build(self)
        
        XCTAssertTrue(true)
    }
    
    func testExampleFailed() {
        print("Running testExampleFailed")
        
        TestItContextBuilder()
            //.ExternalId("ext-321")
            //.Name("Example2")
            .Description("failed test example")
            .Parameters(["version": "1.0", "env": "staging"])
            .build(self)
        
        XCTAssertEqual(2 + 3, 6)
    }
    
}



