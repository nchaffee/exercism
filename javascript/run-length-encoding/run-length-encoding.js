export const encode = (str) => {
  return str.replace(/(\w|\s)\1+/g, (match, parenSubmatch) => {
    return `${match.length}${parenSubmatch}`
  });
};

export const decode = (str) => {
  return str.replace(/(\d+)(\w|\s)/g, (_match, paren1, paren2) => {
    return paren2.repeat(parseInt(paren1));
  });
};
