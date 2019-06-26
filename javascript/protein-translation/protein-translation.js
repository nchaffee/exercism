const PROTEINS = {
  'AUG':'Methionine',
  'UUU':'Phenylalanine',
  'UUC':'Phenylalanine',
  'UUA':'Leucine',
  'UUG':'Leucine',
  'UCU':'Serine',
  'UCC':'Serine',
  'UCA':'Serine',
  'UCG':'Serine',
  'UAU':'Tyrosine',
  'UAC':'Tyrosine',
  'UGU':'Cysteine',
  'UGC':'Cysteine',
  'UGG':'Tryptophan',
  'UAA':'STOP',
  'UAG':'STOP',
  'UGA':'STOP'
}

const ribosome = (codons, polypeptide = []) => {
  if (codons.length == 0) { return polypeptide; }

  let protein = PROTEINS[codons.shift()];
  switch (protein) {
    case undefined:
      throw new Error('Invalid codon');
    case 'STOP':
      return polypeptide;
    default:
      polypeptide.push(protein);
      return ribosome(codons, polypeptide);
  }
}

export const translate = (rna) => {
  let codons = rna ? rna.match(/.{3}/g) : [];
  return ribosome(codons);
}
