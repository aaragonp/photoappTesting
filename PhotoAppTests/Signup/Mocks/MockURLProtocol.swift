//
//  MockURLProtocol.swift
//  PhotoAppTests
//
//  Created by Alberto Aragón Peci on 12/1/25.
//

import Foundation

class MockURLProtocol: URLProtocol {
    static var stubResponseData: Data?
    static var error: Error?

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        if let signupError = MockURLProtocol.error {
            self.client?.urlProtocol(self, didFailWithError:  signupError)
        } else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
