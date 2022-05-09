const primeNumbers = [2,3,5,7,11,13,17]

export const squareRoot = (radicand) => {
  let remaining = radicand;
  let primeFactors = []
  let result = 1;

  while (remaining > 1) {
    const primeFactor = primeNumbers.find(prime => remaining % prime === 0)
    remaining /= primeFactor;
    if (primeFactors.includes(primeFactor)) {
      result *= primeFactor;
      primeFactors.splice(primeFactors.indexOf(primeFactor))
    } else {
      primeFactors.push(primeFactor);
    }
  }
  return result;
};
