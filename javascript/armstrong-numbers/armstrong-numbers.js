const armstrongNumber = (number) => {
  const num_str = number.toString()
  return num_str.
         split('').
         map(n => Math.pow(parseInt(n), num_str.length)).
         reduce((acc, num) => acc + num)
}

export const validate = (number) => {
  return number == armstrongNumber(number)
};
