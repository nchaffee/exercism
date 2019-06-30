import { isUndefined } from "util";

export const convert = (bits, inputBase, outputBase) => {
  validateBase(inputBase, 'Wrong input base');
  validateBase(outputBase, 'Wrong output base');
  validateInput(bits, inputBase);

  let total = toBaseTen(bits, inputBase);
  return fromBaseTen([], outputBase, total);
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
    bits.some(b => b < 0 || b >= inputBase)
  ) { throw new Error('Input has wrong format') }
}

const toBaseTen = (bits, base, total = 0) => {
  if (bits.length == 0) {
    return total;
  } else {
    let totalAccrued = total + (bits.shift() * Math.pow(base, bits.length));
    return toBaseTen(bits, base, totalAccrued);
  }
}

const fromBaseTen = (bits = [], outputBase, totalRemaining) => {
  if (totalRemaining == 0) {
    if (bits.length == 0) { bits.unshift(0) }
    return bits;
  } else {
    bits.unshift(totalRemaining % outputBase);
    totalRemaining = Math.floor(totalRemaining / outputBase);
    return fromBaseTen(bits, outputBase, totalRemaining)
  }
}
