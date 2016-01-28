//
//  MarkdownTemplateTests.swift
//  PancakeTests
//
//  Created by JPMartha on 2016/01/26.
//  Copyright © 2016 JPMartha. All rights reserved.
//

import XCTest
@testable import Pancake

class TemplateTests: XCTestCase {
    func testClassTemplate() {
        if let template = MarkdownTemplate(fileName: "Class.md") {
            XCTAssertNotNil(template)
            XCTAssertTrue(template.markdownString.hasPrefix("# %name%"))
            XCTAssertTrue(template.markdownString.containsString("### Methods"))
        } else {
            XCTFail("Class Template is invalid.")
        }
    }
    
    func testMethodTemplate() {
        if let template = MarkdownTemplate(fileName: "Method.md") {
            XCTAssertNotNil(template)
            XCTAssertTrue(template.markdownString.hasPrefix("- `%name%`"))
            XCTAssertTrue(template.markdownString.containsString("%Comment.md%"))
            XCTAssertTrue(template.markdownString.containsString("%Declaration.md%"))
            XCTAssertTrue(template.markdownString.containsString("%Parameters.md%"))
            XCTAssertTrue(template.markdownString.containsString("%ReturnValue.md%"))
            XCTAssertTrue(template.markdownString.containsString("%SeeAlso.md%"))
        } else {
            XCTFail("Method Template is invalid.")
        }
    }
    
    func testCommentTemplate() {
        if let template = MarkdownTemplate(fileName: "Comment.md") {
            XCTAssertNotNil(template)
            XCTAssertTrue(template.markdownString.hasPrefix("  %doc_comment%"))
        } else {
            XCTFail("Comment Template is invalid.")
        }
    }
    
    func testDeclarationTemplate() {
        if let template = MarkdownTemplate(fileName: "Declaration.md") {
            XCTAssertNotNil(template)
            XCTAssertTrue(template.markdownString.hasPrefix("  ##### Declaration"))
            XCTAssertTrue(template.markdownString.containsString("  ```swift\n  %parsed_declaration%\n  ```"))
        } else {
            XCTFail("Declaration Template is invalid.")
        }
    }
    
    func testParametersTemplate() {
        if let template = MarkdownTemplate(fileName: "Parameters.md") {
            XCTAssertNotNil(template)
            XCTAssertTrue(template.markdownString.hasPrefix("  ##### Parameters"))
            XCTAssertTrue(template.markdownString.containsString("  %parameters%"))
        } else {
            XCTFail("Parameters Template is invalid.")
        }
    }
    
    func testParameterTemplate() {
        if let template = MarkdownTemplate(fileName: "Parameter.md") {
            XCTAssertNotNil(template)
        } else {
            XCTFail("Parameter Template is invalid.")
        }
    }
    
    func testReturnValueTemplate() {
        if let template = MarkdownTemplate(fileName: "ReturnValue.md") {
            XCTAssertNotNil(template)
            XCTAssertTrue(template.markdownString.hasPrefix("  ##### Return Value"))
            XCTAssertTrue(template.markdownString.containsString("  %returns%"))
        } else {
            XCTFail("Return Value Template is invalid.")
        }
    }
    
    func testSeeAlsoTemplate() {
        if let template = MarkdownTemplate(fileName: "SeeAlso.md") {
            XCTAssertNotNil(template)
            XCTAssertTrue(template.markdownString.hasPrefix("  ##### See Also"))
            XCTAssertTrue(template.markdownString.containsString("  %see_also%"))
        } else {
            XCTFail("See Also Template is invalid.")
        }
    }
    
    func testEnumerationTemplate() {
        if let template = MarkdownTemplate(fileName: "Enumeration.md") {
            XCTAssertNotNil(template)
        } else {
            XCTFail("Enumeration Template is invalid.")
        }
    }
}