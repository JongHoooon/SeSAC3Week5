//
//  Endpoint.swift
//  SeSAC3Week5
//
//  Created by jack on 2023/08/14.
//

import Foundation
    
// 열거형은 저장 프로퍼티 포함할 수 없다. -> 열거형은 인스턴스 생성 불가!
enum Nasa: String, CaseIterable {
    
    static let baseURL = "https://apod.nasa.gov/apod/image/"
    
    case one = "2308/sombrero_spitzer_3000.jpg"
    case two = "2212/NGC1365-CDK24-CDK17.jpg"
    case three = "2307/M64Hubble.jpg"
    case four = "2306/BeyondEarth_Unknown_3000.jpg"
    case five = "2307/NGC6559_Block_1311.jpg"
    case six = "2304/OlympusMons_MarsExpress_6000.jpg"
    case seven = "2305/pia23122c-16.jpg"
    case eight = "2308/SunMonster_Wenz_960.jpg"
    case nine = "2307/AldrinVisor_Apollo11_4096.jpg"
    
    // test 인스턴스 연산 프로퍼티 -> 값을 저장하고 있지는 않고, 값을 사용할 수 있는 통로로서의 역할만 담당
    var test: URL {
        return URL(string: "test")!
    }
    
    // 인스턴스는 인스턴스끼리, 타입은 타입 끼리
    static var photo: URL {
        return URL(string: baseURL + allCases.randomElement()!.rawValue)!
    }
}
