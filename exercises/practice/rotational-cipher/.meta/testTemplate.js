import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { assertEqual } from "../../../../test_generator/assertions.js";
import { generateTests } from '../../../../test_generator/testGenerator.js';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const slug = path.basename(path.resolve(__dirname, '..'))

// EDIT THIS WITH YOUR ASSERTIONS
export const assertionFunctions = [ assertEqual ]

// EDIT THIS WITH YOUR TEST TEMPLATES
export const template = (c) => {
  const singleLine = `assertEqual(~message="${c.description}", rotate("${c.input.text}", ${c.input.shiftKey}), "${c.expected}")`;
  if (2 + singleLine.length <= 80) {
    return singleLine;
  }

  return `assertEqual(
    ~message="${c.description}",
    rotate("${c.input.text}", ${c.input.shiftKey}),
    "${c.expected}"
  )`;
}

generateTests(__dirname, slug, assertionFunctions, template)
