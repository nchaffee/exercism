export const steps = (initial_number) => {
  if (initial_number < 1) {
    throw new Error('Only positive numbers are allowed');
  }

  let steps = [initial_number];
  const last = (ary) => ary[(ary.length - 1)];
  const isEven = (num) => num % 2 == 0;
  const collatz = (num) => isEven(num) ? num / 2 : num * 3 + 1;

  while (last(steps) > 1) {steps.push(collatz(last(steps)));}
  return steps.length - 1;
};
