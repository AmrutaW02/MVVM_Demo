//
//  LogHelper.swift
//  Assignment
//
//  Created by Amruta Warankar on 25/01/22.
//

import Foundation

final class log {
    
    enum logType {
        case network(_ strMsg: String)
        case notif(_ obj: Any)
        case ln(_ line: String)
        case api(_ url: String)
        case apiObj(_ obj: Any)
        case obj(_ any: Any)
        case location(_ loc: Any)
        case removed(_ any: Any)
        case error(_ any: Any)
        case apiError(code: Int, _ strErr: String)
    }
    
    private init() {}
    
    @discardableResult init(_ object: Any) {
        self.localPrint(object: object)
    }
    
    @discardableResult init(_ emoji: String, _ object: Any) {
        self.localPrint(emoji: emoji, object: object)
    }
    
    @discardableResult init(_ type: logType) {
        switch type {
        case .network(let strMsg):
            self.localPrint(emoji: "🗼⚡️⚡️", object: "\(strMsg) ⚡️⚡️🗼")
        case .notif(let object):
            self.localPrint(emoji: "🔔 ", object: object)
        case .ln(let line):
            self.localPrint(emoji: "✏️ ", object: line)
        case .api(let url):
            self.localPrint(emoji: "🌏 ", object: url)
        case .apiObj(let object):
            self.localPrint(emoji: "🌏 ", object: object)
        case .obj(let object):
            self.localPrint(emoji: "🔹 ", object: object)
        case .location(let object):
            self.localPrint(emoji: "📌 ", object: object)
        case .removed(let object):
            self.localPrint(emoji: "🗑 ", object: object)
        case .error(let object):
            self.localPrint(emoji: "⚠️ ", object: object)
        case .apiError(let code, let object):
            self.localPrint(emoji: "❗️", object: "\(code): \(object)")
        }
    }
    
    private func localPrint(emoji: String = "", object: Any) {
        #if DEBUG
        if emoji.isEmpty {
            print(object)
        } else {
            print(emoji + " ",  object)
        }
        //#else
        #endif
    }
    
} //class
