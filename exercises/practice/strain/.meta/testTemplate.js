import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { assertEqual } from "../../../../test_generator/assertions.js";
import { generateTests } from '../../../../test_generator/testGenerator.js';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const slug = path.basename(path.resolve(__dirname, '..'))

const serializeValue = (v) => {
  if (Array.isArray(v)) {
    return `[${v.map(serializeValue).join(', ')}]`;
  } else if (typeof v === 'string') {
    return `"${v}"`;
  } else {
    return String(v);
  }
};

const serializeMultiLineArray = (arr, indent) => {
  const innerIndent = indent + '  ';
  const items = arr.map(v => `${innerIndent}${serializeValue(v)},`).join('\n');
  return `[\n${items}\n${indent}]`;
};

const predicateMap = {
  'fn(x) -> true': '_ => true',
  'fn(x) -> false': '_ => false',
  'fn(x) -> x % 2 == 1': 'x => mod(x, 2) == 1',
  'fn(x) -> x % 2 == 0': 'x => mod(x, 2) == 0',
  "fn(x) -> starts_with(x, 'z')": 'x => String.startsWith(x, "z")',
  'fn(x) -> contains(x, 5)': 'x => Array.includes(x, 5)',
};

// EDIT THIS WITH YOUR ASSERTIONS
export const assertionFunctions = [ assertEqual ]


// EDIT THIS WITH YOUR TEST TEMPLATES
export const template = (c) => {
  const values = serializeValue(c.input.list);
  const predicate = predicateMap[c.input.predicate];
  const expected = serializeValue(c.expected);

  const call = `${c.property}(${values}, ${predicate})`;
  const singleLine = `assertEqual(~message="${c.description}", ${call}, ${expected})`;
  if (2 + singleLine.length <= 80) {
    return singleLine;
  }

  // Extract and format list, predicate, and expected
  const list = (`  let list = ${values}`).length > 80
    ? serializeMultiLineArray(c.input.list, '  ')
    : values;

  return `let list = ${list}
  let predicate = ${predicate}
  let expected = ${expected}
  assertEqual(~message="${c.description}", ${c.property}(list, predicate), expected)`;
}

generateTests(__dirname, slug, assertionFunctions, template)
