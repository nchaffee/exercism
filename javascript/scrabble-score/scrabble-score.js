export function score(word,sc){
  word = word.toUpperCase();
  var map = { 1: 'AEIOULNRST', 2: 'DG', 3: 'BCMP', 4: 'FHVWY', 5: 'K', 8: 'JX', 10: 'QZ' };
  return word.split('').reduce((total, letter) => {
    for(let pts in map) {
      if(map[pts].indexOf(letter) > -1) { total += Number(pts) }
    }
    return total
  }, 0)
}
