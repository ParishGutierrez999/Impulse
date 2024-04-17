//
//  Extensions.swift
//  Impulse
//
//  Created by Parish Gutierrez on 4/13/24.
//

import Foundation

extension Encodable {
    func asDicionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
