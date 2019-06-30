import { isUndefined } from "util";

export const convert = (bits, inputBase, outputBase) => {
  validateBase(inputBase, 'Wrong input base');
  validateBase(outputBase, 'Wrong output base');
  validateInput(bits, inputBase);

  let total = toBaseTen(bits, inputBase);
  return fromBaseTen(total, outputBase);
};

const validateBase = (inputOrOutputBase, errorMsg) => {
  if (
    inputOrOutputBase <= 1 ||
    isUndefined(inputOrOutputBase) ||
    !Number.isInteger(inputOrOutputBase)
    ) { throw new Error(errorMsg) }
}

const validateInput = (bits, inputBase) => {
  if (
    bits.length == 0 ||
    (bits.length > 1 && bits[0] == 0) ||
    bits.some(b => b < 0) ||
    bits.some(b => b >= inputBase)
  ) { throw new Error('Input has wrong format') }
}

const toBaseTen = (bits, base, total = 0) => {
  if (bits.length == 0) {
    return total;
  } else {
    let bit = bits.shift();
    let new_total = total + (bit * Math.pow(base, bits.length));
    return toBaseTen(bits, base, new_total);
  }
}

const fromBaseTen = (totalRemaining, outputBase) => {
  let exponent = highestDivisibleExponent(totalRemaining, outputBase);

  let bits = [];
  while (exponent > 0) {
    let digitValue = Math.pow(outputBase, exponent);
    let bitValue = Math.floor(totalRemaining / digitValue);

    bits = appendBit(bits, bitValue);
    totalRemaining = totalRemaining % digitValue;
    exponent--;
  }
  bits.push(totalRemaining);
  return bits;
}

const highestDivisibleExponent = (total, outputBase) => {
  let exponent = 0;
  while (Math.floor(total / Math.pow(outputBase, exponent)) > 1) { exponent++ }
  return exponent;
}

const appendBit = (bits, bitValue) => {
  if (bitValue > 0) {
    bits.push(bitValue)
  } else if (bits.length > 0) {
    bits.push(0)
  }
  return bits;
}
