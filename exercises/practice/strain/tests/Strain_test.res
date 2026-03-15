open Test
open Strain

let assertEqual = (~message=?, a: 'a, b: 'a) => assertion(~message?, ~operator="assertEqual", (a, b) => a == b, a, b)

test("keep on empty list returns empty list", () => {
  let list = []
  let predicate = _ => true
  let expected = []
  assertEqual(~message="keep on empty list returns empty list", keep(list, predicate), expected)
})

test("keeps everything", () => {
  let list = [1, 3, 5]
  let predicate = _ => true
  let expected = [1, 3, 5]
  assertEqual(~message="keeps everything", keep(list, predicate), expected)
})

test("keeps nothing", () => {
  assertEqual(~message="keeps nothing", keep([1, 3, 5], _ => false), [])
})

test("keeps first and last", () => {
  let list = [1, 2, 3]
  let predicate = x => mod(x, 2) == 1
  let expected = [1, 3]
  assertEqual(~message="keeps first and last", keep(list, predicate), expected)
})

test("keeps neither first nor last", () => {
  let list = [1, 2, 3]
  let predicate = x => mod(x, 2) == 0
  let expected = [2]
  assertEqual(~message="keeps neither first nor last", keep(list, predicate), expected)
})

test("keeps strings", () => {
  let list = ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
  let predicate = x => String.startsWith(x, "z")
  let expected = ["zebra", "zombies", "zealot"]
  assertEqual(~message="keeps strings", keep(list, predicate), expected)
})

test("keeps lists", () => {
  let list = [
    [1, 2, 3],
    [5, 5, 5],
    [5, 1, 2],
    [2, 1, 2],
    [1, 5, 2],
    [2, 2, 1],
    [1, 2, 5],
  ]
  let predicate = x => Array.includes(x, 5)
  let expected = [[5, 5, 5], [5, 1, 2], [1, 5, 2], [1, 2, 5]]
  assertEqual(~message="keeps lists", keep(list, predicate), expected)
})

test("discard on empty list returns empty list", () => {
  let list = []
  let predicate = _ => true
  let expected = []
  assertEqual(~message="discard on empty list returns empty list", discard(list, predicate), expected)
})

test("discards everything", () => {
  assertEqual(~message="discards everything", discard([1, 3, 5], _ => true), [])
})

test("discards nothing", () => {
  let list = [1, 3, 5]
  let predicate = _ => false
  let expected = [1, 3, 5]
  assertEqual(~message="discards nothing", discard(list, predicate), expected)
})

test("discards first and last", () => {
  let list = [1, 2, 3]
  let predicate = x => mod(x, 2) == 1
  let expected = [2]
  assertEqual(~message="discards first and last", discard(list, predicate), expected)
})

test("discards neither first nor last", () => {
  let list = [1, 2, 3]
  let predicate = x => mod(x, 2) == 0
  let expected = [1, 3]
  assertEqual(~message="discards neither first nor last", discard(list, predicate), expected)
})

test("discards strings", () => {
  let list = ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
  let predicate = x => String.startsWith(x, "z")
  let expected = ["apple", "banana", "cherimoya"]
  assertEqual(~message="discards strings", discard(list, predicate), expected)
})

test("discards lists", () => {
  let list = [
    [1, 2, 3],
    [5, 5, 5],
    [5, 1, 2],
    [2, 1, 2],
    [1, 5, 2],
    [2, 2, 1],
    [1, 2, 5],
  ]
  let predicate = x => Array.includes(x, 5)
  let expected = [[1, 2, 3], [2, 1, 2], [2, 2, 1]]
  assertEqual(~message="discards lists", discard(list, predicate), expected)
})
