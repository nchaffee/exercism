const allergens = ['eggs','peanuts','shellfish','strawberries','tomatoes','chocolate','pollen','cats']
export class Allergies {
  constructor(score){ this.score = score }

  list = () => allergens.filter(allergen => 
    ((2 ** allergens.indexOf(allergen)) & this.score) > 0
  )

  allergicTo = (allergen) => this.list().includes(allergen)
}
