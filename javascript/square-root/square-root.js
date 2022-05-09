const primes = [2,3,5,7,11,13,17]

export const squareRoot = (radicand) => {
  let [remaining,factors,result] = [radicand, [], 1]

  while (remaining > 1) {
    const factor = primes.find(prime => remaining % prime === 0)
    remaining /= factor;
    if (factors.includes(factor)) {
      result *= factors.splice(factors.indexOf(factor))[0];
    } else {
      factors.push(factor);
    }
  }
  return result;
};
