const toS = num => num.toString()
const toA = str => Array.from(str)
const size = num => toS(num).length
const toI = str => parseInt(str)

const armstrongNumber = (number) => {
  return toA(toS(number)).
         map(s => toI(s)).
         map(n => Math.pow(n, size(number))).
         reduce((acc, n) => acc + n)
}

export const validate = (number) => {
  return number == armstrongNumber(number)
};
