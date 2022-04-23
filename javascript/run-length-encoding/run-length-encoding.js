export const encode = (str) => {
  if (str.length < 2) {return str}
  let encoded = '';
  let buffer = 1;
  for (let i = 0; i < str.length; i++) {
    let currentLetter = str[i];
    let nextLetter = str[i+1];
    if(currentLetter === nextLetter) {
      buffer++;
    } else if(buffer === 1) {
      encoded += currentLetter;
    } else {
      encoded += buffer + currentLetter;
      buffer = 1;
    }
  }
  return encoded;
};

export const decode = (str) => {
  if (str.length < 2) {return str}
  let decoded = '';
  let multiplier = '';
  for (let i = 0; i < str.length; i++) {
    let currentLetter = str[i];
    let nextLetter = str[i+1];
    if(currentLetter.match(/[0-9]/)) {
      multiplier += currentLetter;
    } else if(multiplier === '') {
      decoded += currentLetter;
    } else {
      decoded += currentLetter.repeat(parseInt(multiplier));
      multiplier = '';
    }
  }
  return decoded;
};
