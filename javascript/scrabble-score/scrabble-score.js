const points = [
  [/[aeioulnrst]/gi, '+1'],
  [/[dg]/gi, '+2'],
  [/[bcmp]/gi, '+3'],
  [/[fhvwy]/gi, '+4'],
  [/[k]/gi, '+5'],
  [/[jx]/gi, '+8'],
  [/[qz]/gi, '+10'],
]

export const score = (word) => {
  let regex, pts;
  points.forEach((regexNPts) => {
    [regex, pts] = regexNPts
    word = word.replace(regex,pts)
  })
  return eval(word + '+0')
};
