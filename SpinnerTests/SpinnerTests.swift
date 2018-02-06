//
//  SpinnerTests.swift
//  SpinnerTests
//
//  Created by Jakob Mygind on 29/09/16.
//  Copyright © 2016 Nodes. All rights reserved.
//

import XCTest
@testable import Spinner

class SpinnerTests: XCTestCase {
    
    var view = UIView()
    var button = UIButton()
    var globalSpinner: SpinnerView?
    
    override func setUp() {
        super.setUp()
        view = UIView()
        button = UIButton()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShowSpinnerInButton() {
        button.isUserInteractionEnabled = true
        let spinnerView = SpinnerView()//.showSpinner(inButton: button)
        spinnerView.show(in: button)
        let hasSpinner = button.subviews.contains {$0 is SpinnerView}
        XCTAssert(hasSpinner && !button.isUserInteractionEnabled)
        XCTAssert(spinnerView.isKind(of: SpinnerView.classForCoder()))
    }
    
    func testDismissSpinnerInButton() {
        button.setTitleColor(UIColor.red, for: UIControlState.normal)
        let spinner = SpinnerView()//.showSpinner(inButton: button)
        spinner.show(in: button)
        spinner.dismiss()
        let hasSpinner = button.subviews.contains {$0 is SpinnerView}
        XCTAssertFalse(hasSpinner)
        XCTAssertTrue(button.isUserInteractionEnabled)
        let titleColorRed = button.titleColor(for: UIControlState.normal) == UIColor.red
        XCTAssertTrue(titleColorRed)
    }
    
    func testDismissSpinnerInButtonWithChangedColor() {
        button.setTitleColor(UIColor.red, for: UIControlState.normal)
        let spinner = SpinnerView()//.showSpinner(inButton: button)
        spinner.show(in: button)
        button.setTitleColor(UIColor.blue, for: UIControlState.normal)
        spinner.dismiss()
        let hasSpinner = button.subviews.contains {$0 is SpinnerView}
        XCTAssertFalse(hasSpinner)
        XCTAssertTrue(button.isUserInteractionEnabled)
        let titleColorBlue = button.titleColor(for: UIControlState.normal) == UIColor.blue
        XCTAssertTrue(titleColorBlue)
    }
    
    func testShowSpinnerInDisabledButton() {
        button.isUserInteractionEnabled = false
        let spinner = SpinnerView()//.showSpinner(inButton: button)
        spinner.show(in: button)
        let hasSpinner = button.subviews.contains {$0 is SpinnerView}
        XCTAssert(hasSpinner && !button.isUserInteractionEnabled)
    }
    
    func testDismissSpinnerInDisabledButton() {
        button.isUserInteractionEnabled = false
        let spinner = SpinnerView()//.showSpinner(inButton: button)
        spinner.show(in: button)
        spinner.dismiss()
        let hasSpinner = button.subviews.contains {$0 is SpinnerView}
        XCTAssertFalse(hasSpinner)
        XCTAssertTrue(!button.isUserInteractionEnabled)
    }
    
    func testShowSpinnerInView() {
        view.isUserInteractionEnabled = true
        let spinner = SpinnerView()//.showSpinner(inView: view)
        spinner.show(in: view)
        let hasSpinner = view.subviews.contains {$0 is SpinnerView}
        XCTAssert(hasSpinner && !view.isUserInteractionEnabled)
    }
    
    func testDismissSpinnerInView() {
        let spinner = SpinnerView()//.showSpinner(inView: view)
        spinner.show(in: view)
        spinner.dismiss()
        let hasSpinner = view.subviews.contains {$0 is SpinnerView}
        XCTAssertFalse(hasSpinner)
        XCTAssertTrue(view.isUserInteractionEnabled)
    }
    
    func testDismissMultipleAddedGlobalSpinnersInView() {
        globalSpinner = SpinnerView()//.showSpinner(inView: view)
        globalSpinner = SpinnerView()//.showSpinner(inView: view)
        globalSpinner = SpinnerView()//.showSpinner(inView: view)
        globalSpinner?.show(in: view)
        globalSpinner?.show(in: view)
        globalSpinner?.show(in: view)
        let spinners = view.subviews.filter({ $0 is SpinnerView })
        XCTAssertTrue(spinners.count == 1)
        globalSpinner?.dismiss()
        let hasSpinner = view.subviews.contains {$0 is SpinnerView}
        XCTAssertFalse(hasSpinner)
        XCTAssertTrue(view.isUserInteractionEnabled)
    }
    
    func testShowSpinnerInViewDimBackground() {
        view.isUserInteractionEnabled = true
        let spinner = SpinnerView()//.showSpinner(inView: view, dimBackground: true)
        spinner.show(in: view, dimBackground: true)
        let hasSpinner = view.subviews.contains {$0 is SpinnerView}
        let dimmedBackground = view.subviews.count == 2
        XCTAssert(hasSpinner && dimmedBackground && !view.isUserInteractionEnabled)
    }
    
    func testDismissSpinnerInViewDimBackground() {
        let spinner = SpinnerView()//.showSpinner(inView: view, dimBackground: true)
        spinner.show(in: view, dimBackground: true)
        spinner.dismiss()
        let hasSpinner = view.subviews.contains {$0 is SpinnerView}
        XCTAssertFalse(hasSpinner)
        XCTAssertTrue(view.isUserInteractionEnabled)
        XCTAssert(view.subviews.count == 0)
    }
    
    func testShowCustomSpinnerInView() {
        view.isUserInteractionEnabled = true
        let spinner = SpinnerView()//.showCustomSpinner(inView: view)
        spinner.showCustom(in: view)
        let hasSpinner = view.subviews.contains {$0 is SpinnerView}
        XCTAssert(hasSpinner && !view.isUserInteractionEnabled)
    }
    
    func testDismissCustomSpinnerInView() {
        let spinner = SpinnerView()//.showCustomSpinner(inView: view)
        spinner.showCustom(in: view)
        spinner.dismiss()
        let hasSpinner = view.subviews.contains {$0 is SpinnerView}
        XCTAssertFalse(hasSpinner)
        XCTAssertTrue(view.isUserInteractionEnabled)
    }
    
    func testShowCustomSpinnerInButton() {
        //_ = SpinnerView.showCustomSpinner(inButton: button, disablesUserInteraction: true)
        let spinner1 = SpinnerView()
        spinner1.showCustom(in: button, disablesUserInteraction: true)
        var hasSpinner = button.subviews.contains {$0 is SpinnerView}
        XCTAssert(hasSpinner && !button.isUserInteractionEnabled)
        
        //_ = SpinnerView.showCustomSpinner(inButton: button, disablesUserInteraction: false)
        let spinner2 = SpinnerView()
        spinner2.showCustom(in: button, disablesUserInteraction: false)
        hasSpinner = button.subviews.contains {$0 is SpinnerView}
        XCTAssert(hasSpinner && button.isUserInteractionEnabled)
    }
    
    func testDismissCustomSpinnerInButton() {
        let spinner = SpinnerView()//.showCustomSpinner(inButton: button, disablesUserInteraction: true)
        spinner.showCustom(in: button, disablesUserInteraction: true)
        spinner.dismiss()
        let hasSpinner = button.subviews.contains {$0 is SpinnerView}
        XCTAssertFalse(hasSpinner)
        XCTAssertTrue(view.isUserInteractionEnabled)
    }
    
    func testShowSpinnerInButtonWithAttributedSting() {
        button.isUserInteractionEnabled = true
        
        let attributedString = NSAttributedString(string: "title", attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 19)])
        button.setAttributedTitle(attributedString, for: .normal)
        
        let spinnerView = SpinnerView()//.showSpinner(inButton: button)
        spinnerView.show(in: button)
        XCTAssertNil(button.attributedTitle(for: .normal))
        spinnerView.dismiss()
        XCTAssertNotNil(button.attributedTitle(for: .normal))
    }
}
