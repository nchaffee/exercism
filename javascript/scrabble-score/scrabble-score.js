const points = {
  D: 2,
  G: 2,
  B: 3,
  C: 3,
  M: 3,
  P: 3,
  F: 4,
  H: 4,
  V: 4,
  W: 4,
  Y: 4,
  K: 5,                                  
  J: 8,
  X: 8,
  Q: 10,
  Z: 10
}

const sum = (a,b) => a+b

export const score = (word) => {
  return [...(word.toUpperCase())].
    map((letter) => points[letter] || 1).
    reduce(((a,b) => sum(a,b)), 0);
};
