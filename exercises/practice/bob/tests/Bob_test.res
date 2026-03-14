open Test
open Bob

let assertEqual = (~message=?, a: 'a, b: 'a) => assertion(~message?, ~operator="assertEqual", (a, b) => a == b, a, b)

test("stating something", () => {
  assertEqual(~message="stating something", response("Tom-ay-to, tom-aaaah-to."), "Whatever.")
})

test("shouting", () => {
  assertEqual(~message="shouting", response("WATCH OUT!"), "Whoa, chill out!")
})

test("shouting gibberish", () => {
  assertEqual(~message="shouting gibberish", response("FCECDFCAAB"), "Whoa, chill out!")
})

test("asking a question", () => {
  assertEqual(~message="asking a question", response("Does this cryogenic chamber make me look fat?"), "Sure.")
})

test("asking a numeric question", () => {
  assertEqual(~message="asking a numeric question", response("You are, what, like 15?"), "Sure.")
})

test("asking gibberish", () => {
  assertEqual(~message="asking gibberish", response("fffbbcbeab?"), "Sure.")
})

test("talking forcefully", () => {
  assertEqual(~message="talking forcefully", response("Hi there!"), "Whatever.")
})

test("using acronyms in regular speech", () => {
  assertEqual(~message="using acronyms in regular speech", response("It's OK if you don't want to go work for NASA."), "Whatever.")
})

test("forceful question", () => {
  assertEqual(~message="forceful question", response("WHAT'S GOING ON?"), "Calm down, I know what I'm doing!")
})

test("shouting numbers", () => {
  assertEqual(~message="shouting numbers", response("1, 2, 3 GO!"), "Whoa, chill out!")
})

test("no letters", () => {
  assertEqual(~message="no letters", response("1, 2, 3"), "Whatever.")
})

test("question with no letters", () => {
  assertEqual(~message="question with no letters", response("4?"), "Sure.")
})

test("shouting with special characters", () => {
  assertEqual(~message="shouting with special characters", response("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"), "Whoa, chill out!")
})

test("shouting with no exclamation mark", () => {
  assertEqual(~message="shouting with no exclamation mark", response("I HATE THE DENTIST"), "Whoa, chill out!")
})

test("statement containing question mark", () => {
  assertEqual(~message="statement containing question mark", response("Ending with ? means a question."), "Whatever.")
})

test("non-letters with question", () => {
  assertEqual(~message="non-letters with question", response(":) ?"), "Sure.")
})

test("prattling on", () => {
  assertEqual(~message="prattling on", response("Wait! Hang on. Are you going to be OK?"), "Sure.")
})

test("silence", () => {
  assertEqual(~message="silence", response(""), "Fine. Be that way!")
})

test("prolonged silence", () => {
  assertEqual(~message="prolonged silence", response("          "), "Fine. Be that way!")
})

test("alternate silence", () => {
  assertEqual(~message="alternate silence", response("										"), "Fine. Be that way!")
})

test("starting with whitespace", () => {
  assertEqual(~message="starting with whitespace", response("         hmmmmmmm..."), "Whatever.")
})

test("ending with whitespace", () => {
  assertEqual(~message="ending with whitespace", response("Okay if like my  spacebar  quite a bit?   "), "Sure.")
})

test("other whitespace", () => {
  assertEqual(~message="other whitespace", response("
 	"), "Fine. Be that way!")
})

test("non-question ending with whitespace", () => {
  assertEqual(~message="non-question ending with whitespace", response("This is a statement ending with whitespace      "), "Whatever.")
})

test("multiple line question", () => {
  assertEqual(~message="multiple line question", response("
Does this cryogenic chamber make
 me look fat?"), "Sure.")
})
