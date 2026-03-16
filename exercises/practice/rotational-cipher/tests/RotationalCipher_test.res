open Test
open RotationalCipher

let assertEqual = (~message=?, a: 'a, b: 'a) => assertion(~message?, ~operator="assertEqual", (a, b) => a == b, a, b)

test("rotate a by 0, same output as input", () => {
  assertEqual(
    ~message="rotate a by 0, same output as input",
    rotate("a", 0),
    "a"
  )
})

test("rotate a by 1", () => {
  assertEqual(~message="rotate a by 1", rotate("a", 1), "b")
})

test("rotate a by 26, same output as input", () => {
  assertEqual(
    ~message="rotate a by 26, same output as input",
    rotate("a", 26),
    "a"
  )
})

test("rotate m by 13", () => {
  assertEqual(~message="rotate m by 13", rotate("m", 13), "z")
})

test("rotate n by 13 with wrap around alphabet", () => {
  assertEqual(
    ~message="rotate n by 13 with wrap around alphabet",
    rotate("n", 13),
    "a"
  )
})

test("rotate capital letters", () => {
  assertEqual(~message="rotate capital letters", rotate("OMG", 5), "TRL")
})

test("rotate spaces", () => {
  assertEqual(~message="rotate spaces", rotate("O M G", 5), "T R L")
})

test("rotate numbers", () => {
  assertEqual(
    ~message="rotate numbers",
    rotate("Testing 1 2 3 testing", 4),
    "Xiwxmrk 1 2 3 xiwxmrk"
  )
})

test("rotate punctuation", () => {
  assertEqual(
    ~message="rotate punctuation",
    rotate("Let's eat, Grandma!", 21),
    "Gzo'n zvo, Bmviyhv!"
  )
})

test("rotate all letters", () => {
  assertEqual(
    ~message="rotate all letters",
    rotate("The quick brown fox jumps over the lazy dog.", 13),
    "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
  )
})
