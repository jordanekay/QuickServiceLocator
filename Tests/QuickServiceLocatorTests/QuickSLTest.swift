//
//  File.swift
//  
//
//  Created by François Dabonot on 18/08/2024.
//

import Foundation
import XCTest
@testable import QuickServiceLocator

protocol DummyServiceProtocol {
    func dummyFunction()
}

class DummyService: DummyServiceProtocol {
    
    init() {
        print("INIT DummyService")
    }
    
    func dummyFunction() {
        print("test")
    }
}

final class QuickServiceLocatorTests: XCTestCase {
    
    @QuickSL(register: DummyService())
    var dummyTest1: DummyServiceProtocol
    
    @QuickSL(register: DummyService())
    var dummyTest2: DummyService
    
    @QuickSL(register: DummyService(), mode: .newInstance)
    var dummyTest3: DummyServiceProtocol
    
    func test1() throws {
        dummyTest1.dummyFunction()
        QuickServiceLocator.unregister(DummyServiceProtocol.self)
        dummyTest2.dummyFunction()
        QuickServiceLocator.unregister(DummyService.self)
    }
    
    
    func test2() throws {
        XCTAssertFalse(QuickServiceLocator.isRegister(DummyServiceProtocol.self))
        QuickServiceLocator.register(DummyServiceProtocol.self, DummyService())
        let _: DummyServiceProtocol = QuickServiceLocator.locate()
        XCTAssertTrue(QuickServiceLocator.isRegister(DummyServiceProtocol.self))
        QuickServiceLocator.unregister(DummyServiceProtocol.self)
        XCTAssertFalse(QuickServiceLocator.isRegister(DummyServiceProtocol.self))
    }
    
    func test3() throws {
        XCTAssertFalse(QuickServiceLocator.isRegister(DummyServiceProtocol.self))
        QuickServiceLocator.register(DummyServiceProtocol.self,
                                     mode: .newInstance,
                                     DummyService())
        let _: DummyServiceProtocol = QuickServiceLocator.locate()
        QuickServiceLocator.unregister(DummyServiceProtocol.self)
    }
}
