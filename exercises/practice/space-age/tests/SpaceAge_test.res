open Test
open SpaceAge

let assertEqual = (~message=?, a: 'a, b: 'a) => assertion(~message?, ~operator="assertEqual", (a, b) => a == b, a, b)

test("age on Earth", () => {
  assertEqual(~message="age on Earth", age(Earth, 1000000000), 31.69)
})

test("age on Mercury", () => {
  assertEqual(~message="age on Mercury", age(Mercury, 2134835688), 280.88)
})

test("age on Venus", () => {
  assertEqual(~message="age on Venus", age(Venus, 189839836), 9.78)
})

test("age on Mars", () => {
  assertEqual(~message="age on Mars", age(Mars, 2129871239), 35.88)
})

test("age on Jupiter", () => {
  assertEqual(~message="age on Jupiter", age(Jupiter, 901876382), 2.41)
})

test("age on Saturn", () => {
  assertEqual(~message="age on Saturn", age(Saturn, 2000000000), 2.15)
})

test("age on Uranus", () => {
  assertEqual(~message="age on Uranus", age(Uranus, 1210123456), 0.46)
})

test("age on Neptune", () => {
  assertEqual(~message="age on Neptune", age(Neptune, 1821023456), 0.35)
})
