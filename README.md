
# About

AVL tree implement in Swift, with O(logN) in insert/delete/find, translate from skywind3000's avlmini.c, test under Swift 4.0.

# Usage

```swift
// decleare
let tree = AvlTree<Int,Int>()

// insert
tree.insert(key: 666, value: 555)
tree.insert(key: 666, value: 666, replace: true) // replace

// find
let value = tree.find(key: 666)?.value ?? nil

// remove key
tree.remove(key: 444)

// remove node
tree.remove(node: tree.find(key: 666)!)

// count
print("tree count \(tree.count())")

// first node (minimal value)
let minimal = tree.first()?.value ?? nil

// last node (maxima value)
let maxima = tree.last()?.value ?? nil

// travel tree
var node = tree.first()
while let n = node {
    node = n.next()
}

// last to first
var node = tree.last()
while let n = node {
    node = n.prev()
}

// clear tree
tree.clear()
```

# Test & Performance

```bash
$ make
$ ./main
```

test and performance under

- Apple Swift version 4.0.3 (swiftlang-900.0.74.1 clang-900.0.39.2)
- Target: x86_64-apple-macosx10.9

```
0) test insert:
insert 10: (k:10 h:1),

1) test LL:
insert 8: (k:8 h:1), (k:10 h:2),
insert 6: (k:6 h:1), (k:8 h:2), (k:10 h:1),

2) test RR:
insert 13: (k:6 h:1), (k:8 h:3), (k:10 h:2), (k:13 h:1),
insert 15: (k:6 h:1), (k:8 h:3), (k:10 h:1), (k:13 h:2), (k:15 h:1),

3) test LR:
insert 4: (k:4 h:1), (k:6 h:2), (k:8 h:3), (k:10 h:1), (k:13 h:2), (k:15 h:1),
insert 5: (k:4 h:1), (k:5 h:2), (k:6 h:1), (k:8 h:3), (k:10 h:1), (k:13 h:2), (k:15 h:1),

4) test RL:
insert 17: (k:4 h:1), (k:5 h:2), (k:6 h:1), (k:8 h:4), (k:10 h:1), (k:13 h:3), (k:15 h:2), (k:17 h:1),
insert 16: (k:4 h:1), (k:5 h:2), (k:6 h:1), (k:8 h:4), (k:10 h:1), (k:13 h:3), (k:15 h:1), (k:16 h:2), (k:17 h:1),

5) count: 9

5) find 15: 150
   find 19: -1

6) delete 13, first, last:
   (k:5 h:2), (k:6 h:1), (k:8 h:3), (k:10 h:1), (k:15 h:2), (k:16 h:1),
   count: 6

7) replace 15 value -> 1500:
   find 15: 1500

8) remove first node:
   (k:6 h:1), (k:8 h:3), (k:10 h:1), (k:15 h:2), (k:16 h:1),

9) clean tree
   : (travel tree)
   count: 0

10) test performance, every round 100,000, then clear
round 1: 1180ms, avg: 1180ms
round 2: 1222ms, avg: 1201ms
round 3: 1211ms, avg: 1204ms
```


