open Test
open Anagram

let assertEqual = (~message=?, a: 'a, b: 'a) => assertion(~message?, ~operator="assertEqual", (a, b) => a == b, a, b)

test("no matches", () => {
  assertEqual(~message="no matches", findAnagrams("diaper", ["hello","world","zombies","pants"]), None)
})

test("detects two anagrams", () => {
  assertEqual(~message="detects two anagrams", findAnagrams("solemn", ["lemons","cherry","melons"]), Some(["lemons","melons"]))
})

test("does not detect anagram subsets", () => {
  assertEqual(~message="does not detect anagram subsets", findAnagrams("good", ["dog","goody"]), None)
})

test("detects anagram", () => {
  assertEqual(~message="detects anagram", findAnagrams("listen", ["enlists","google","inlets","banana"]), Some(["inlets"]))
})

test("detects three anagrams", () => {
  assertEqual(~message="detects three anagrams", findAnagrams("allergy", ["gallery","ballerina","regally","clergy","largely","leading"]), Some(["gallery","regally","largely"]))
})

test("detects multiple anagrams with different case", () => {
  assertEqual(~message="detects multiple anagrams with different case", findAnagrams("nose", ["Eons","ONES"]), Some(["Eons","ONES"]))
})

test("does not detect non-anagrams with identical checksum", () => {
  assertEqual(~message="does not detect non-anagrams with identical checksum", findAnagrams("mass", ["last"]), None)
})

test("detects anagrams case-insensitively", () => {
  assertEqual(~message="detects anagrams case-insensitively", findAnagrams("Orchestra", ["cashregister","Carthorse","radishes"]), Some(["Carthorse"]))
})

test("detects anagrams using case-insensitive subject", () => {
  assertEqual(~message="detects anagrams using case-insensitive subject", findAnagrams("Orchestra", ["cashregister","carthorse","radishes"]), Some(["carthorse"]))
})

test("detects anagrams using case-insensitive possible matches", () => {
  assertEqual(~message="detects anagrams using case-insensitive possible matches", findAnagrams("orchestra", ["cashregister","Carthorse","radishes"]), Some(["Carthorse"]))
})

test("does not detect an anagram if the original word is repeated", () => {
  assertEqual(~message="does not detect an anagram if the original word is repeated", findAnagrams("go", ["goGoGO"]), None)
})

test("anagrams must use all letters exactly once", () => {
  assertEqual(~message="anagrams must use all letters exactly once", findAnagrams("tapper", ["patter"]), None)
})

test("words are not anagrams of themselves", () => {
  assertEqual(~message="words are not anagrams of themselves", findAnagrams("BANANA", ["BANANA"]), None)
})

test("words are not anagrams of themselves even if letter case is partially different", () => {
  assertEqual(~message="words are not anagrams of themselves even if letter case is partially different", findAnagrams("BANANA", ["Banana"]), None)
})

test("words are not anagrams of themselves even if letter case is completely different", () => {
  assertEqual(~message="words are not anagrams of themselves even if letter case is completely different", findAnagrams("BANANA", ["banana"]), None)
})

test("words other than themselves can be anagrams", () => {
  assertEqual(~message="words other than themselves can be anagrams", findAnagrams("LISTEN", ["LISTEN","Silent"]), Some(["Silent"]))
})

test("handles case of greek letters", () => {
  assertEqual(~message="handles case of greek letters", findAnagrams("ΑΒΓ", ["ΒΓΑ","ΒΓΔ","γβα","αβγ"]), Some(["ΒΓΑ","γβα"]))
})

test("different characters may have the same bytes", () => {
  assertEqual(~message="different characters may have the same bytes", findAnagrams("a⬂", ["€a"]), None)
})
