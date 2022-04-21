const rnaComplement = {
  'G': 'C',
  'C': 'G',
  'T': 'A',
  'A': 'U',
}

export const toRna = (dnaStrand) => {
  const rnaStrand = dnaStrand.split("").map(
      nucleotide => rnaComplement[nucleotide]
    ).join("");
  return rnaStrand;
};
