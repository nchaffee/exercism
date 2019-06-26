export class Triangle {
  constructor() {
    this.sides = [...arguments].sort((a,b) => a - b);
    this.unique_sides = new Set(this.sides).size;
  }

  static invalid({ sides }) {
    return (
      sides.some(s => s <= 0) ||
      sides.pop() > sides.pop() + sides.pop()
    )
  }

  kind() {
    if (Triangle.invalid(this)) { throw new Error('illegal'); }
    return ['hi mom', 'equilateral', 'isosceles', 'scalene'][this.unique_sides];
  }
}
