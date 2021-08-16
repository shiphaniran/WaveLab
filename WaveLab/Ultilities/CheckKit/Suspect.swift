//
//  Suspect.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 14/08/2021.
//

import Foundation
import UIKit

public struct Suspect {
    fileprivate(set) public var view: UITextField
    fileprivate var trial: (_ evidence: String) -> Bool
    fileprivate(set) public var sentence: String
    
    public init(view: UITextField, sentence: String, trial: @escaping (_ evidence: String) -> Bool) {
        self.view = view
        self.trial = trial
        self.sentence = sentence
    }
    
    public init(view: UITextField, sentence: String, trial: TrialProtocol) {
        self.view = view
        self.trial = trial.trial()
        self.sentence = sentence
    }
    
    public func isGuilty() -> Bool {
        return !self.trial(self.view.text!)
    }
    
    public func verdict() -> String {
        return self.isGuilty() ? self.sentence : ""
    }
}
