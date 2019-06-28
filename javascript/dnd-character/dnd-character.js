export const abilityModifier = (score) => {
  if (score < 3) { throw new Error('Ability scores must be at least 3')}
  if (score > 18) { throw new Error('Ability scores can be at most 18')}
  return Math.floor((score - 10) / 2);
};

const rollDie = () => {
  return parseInt(Math.random()*6) + 1;
};

export class Character {
  constructor() {
    this.strength = Character.rollAbility();
    this.constitution = Character.rollAbility();
    this.dexterity = Character.rollAbility();
    this.intelligence = Character.rollAbility();
    this.wisdom = Character.rollAbility();
    this.charisma = Character.rollAbility();
    this.hitpoints = 10 + abilityModifier(this.constitution);
  }

  static rollAbility() {
    let scores = [rollDie(), rollDie(), rollDie(), rollDie()].sort();
    scores.shift();
    return scores.reduce((acc,score) => acc + score)
  }
}
