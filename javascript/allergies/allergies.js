const allergens = ['eggs','peanuts','shellfish','strawberries','tomatoes','chocolate','pollen','cats']
export class Allergies {
  constructor(score){
    this.allergicTo = (allergen) => (2 ** allergens.indexOf(allergen) & score) > 0
    this.list = () => allergens.filter(this.allergicTo)
  }
}
