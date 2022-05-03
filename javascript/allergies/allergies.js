const allergens = ['eggs','peanuts','shellfish','strawberries','tomatoes','chocolate','pollen','cats']
export class Allergies {
  constructor(score){
    this.list = () => allergens.filter(allergen => 
      (2 ** allergens.indexOf(allergen) & score) > 0)
    this.allergicTo = (allergen) => this.list().includes(allergen)
  }
}
