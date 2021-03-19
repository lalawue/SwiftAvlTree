//
// Created by lalawue on 2021/03/19
//
// test re-balance

import Foundation

class Test {

    let tree = AvlTree<Int,Int>()
    
    func testReBalance() {
        print("\n0) test insert:")
        tree.insert(key: 10, value: 100)
        travelTree("insert 10: ")
        
        print("\n1) test LL:")
        tree.insert(key: 8, value: 80)
        travelTree("insert 8: ")
        tree.insert(key: 6, value: 60)
        travelTree("insert 6: ")

        print("\n2) test RR:")
        tree.insert(key: 13, value: 130)
        travelTree("insert 13: ")
        tree.insert(key: 15, value: 150)
        travelTree("insert 15: ")
        
        print("\n3) test LR:")
        tree.insert(key: 4, value: 40)
        travelTree("insert 4: ")
        tree.insert(key: 5, value: 50)
        travelTree("insert 5: ")
        
        print("\n4) test RL:")
        tree.insert(key: 17, value: 170)
        travelTree("insert 17: ")
        tree.insert(key: 16, value: 160)
        travelTree("insert 16: ")
        
        print("\n5) count: \(tree.count())")
    }
    
    func testFindDeleteReplace() {
        print("\n5) find 15: \(tree.find(key: 15)?.value ?? -1)")
        print("   find 19: \(tree.find(key: 19)?.value ?? -1)")

        print("\n6) delete 13, first, last:")
        tree.remove(key: 13)
        tree.remove(node: tree.first()!)
        tree.remove(node: tree.last()!)
        travelTree("   ")
        print("   count: \(tree.count())")
        
        print("\n7) replace 15 value -> 1500:")
        tree.insert(key: 15, value: 1500, replace: true)
        print("   find 15: \(tree.find(key: 15)?.value ?? -1)")
        
        print("\n8) remove first node:")
        tree.remove(node: tree.first()!)
        travelTree("   ")
        
        print("\n9) clean tree")
        tree.clear()
        travelTree("   : (travel tree)")
        print("   count: \(tree.count())")
    }
    
    func testPerformance() {
        print("\n10) test performance, every round 100,000, then clear")
        var round = UInt64(0)
        var last = DispatchTime.now()
        var avg = UInt64(0)
        while true {
            round += 1
            var loop = Int(100000)
            while loop > 0 {
                loop -= 1
                tree.insert(key: loop, value: 0)
            }
            tree.clear()
            let now = DispatchTime.now()
            let elapsed = now.uptimeNanoseconds - last.uptimeNanoseconds
            avg += elapsed
            print("round \(round): \(elapsed/1000000)ms, avg: \(avg / round / 1000000)ms")
            last = now
        }
    }
    
    fileprivate func travelTree(_ prefix: String) {
        var node = tree.first()
        var arr = [String]()
        arr.append(prefix)
        while let n = node {
            arr.append(n.description + ", ")
            node = n.next()
        }
        print(arr.joined())
    }
}

let t = Test()
t.testReBalance()
t.testFindDeleteReplace()
t.testPerformance()


