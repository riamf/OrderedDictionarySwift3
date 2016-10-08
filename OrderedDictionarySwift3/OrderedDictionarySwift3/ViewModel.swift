//
//  ViewModel.swift
//  OrderedDictionarySwift3
//
//  Created by Pawel Kowalczuk on 08/10/16.
//  Copyright © 2016 Pawel Kowalczuk. All rights reserved.
//

import Foundation

struct ViewModel: Hashable {
    var title: String
    init(title: String) {
        self.title = title
    }
    
    var hashValue: Int {
        return title.hash
    }
    
    public static func ==(lhs: ViewModel, rhs: ViewModel) -> Bool {
        return lhs.title == rhs.title
    }
}
