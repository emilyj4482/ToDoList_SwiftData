//
//  Trim.swift
//  ToDoList_SwiftData
//
//  Created by EMILY on 04/11/2023.
//

import Foundation

// 문자열 앞뒤 공백 삭제 메소드 정의
extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
