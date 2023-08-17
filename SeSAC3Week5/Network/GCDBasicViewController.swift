//
//  GCDBasicViewController.swift
//  SeSAC3Week5
//
//  Created by jack on 2023/08/14.
//

import UIKit

class GCDBasicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
//        serialSync()
//        serialAsync()
//        globalSync()
//        globalAsync()
        globalAsyncTwo()
    }
    
    func serialSync() {
        print("Start")
        
        for i in 1...10 {
            sleep(1)
            print(i, terminator: " ")
        } 
        
        // 무한 대기 상태 가능성(Dead Lock)
//        DispatchQueue.main.sync {
//            for i in 101...200 {
//                sleep(1)
//                print(i, terminator: " ")
//            }
//        }
                        print("End")
    }
    
    func globalSync() {
        print("Start")
        
        DispatchQueue.global().sync {
            for i in 1...5 {
                sleep(1)
                print(i, terminator: " ")
            }
        }
        
        for i in 5...10 {
            sleep(1)
            print(i, terminator: " ")
        }
        
        print("End")
    }
    
    func serialAsync() {
        print("Start")
        
        DispatchQueue.main.async {
            for i in 1...5 {
                sleep(1)
                print(i, terminator: " ")
            }
        }
        
        for i in 5...10 {
            sleep(1)
            print(i, terminator: " ")
        }
        
        print("End")
    }
    
    func globalAsync() {
        print("Start")
        
        DispatchQueue.global().async { // 오래걸리는 네트워크 작업은 뒤에서
            for i in 1...5 {
                print(Thread.current)
                sleep(1)
                print(i, terminator: " ")
            }
        }
        
        print(Thread.current)
        for i in 6...11 {
            sleep(1)
            print(i, terminator: " ")
        }
        
        print("End")
    }
    
    func globalAsyncTwo() {
        print("Start")
        
        for i in 1...50 {
            DispatchQueue.global().async {
                print(Thread.current)
                sleep(1)
                print(i, terminator: " ")
            }
        }
        
        print(Thread.current)
        for i in 6...11 {
            sleep(1)
            print(i, terminator: " ")
        }
        
        print("End")
    }
}
