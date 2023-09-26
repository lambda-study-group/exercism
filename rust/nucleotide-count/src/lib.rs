use std::collections::HashMap;

pub fn count(nucleotide: char, dna: &str) -> Result<usize, char> {
    nucleotide_counts(dna).and_then(|h| {
        match h.get(&nucleotide) {
            None => Err(nucleotide),
            Some(c) => Ok(*c)
        }
    })
}

pub fn nucleotide_counts(dna: &str) -> Result<HashMap<char, usize>, char> {
    let mut count: HashMap<char, usize> = HashMap::from([('A', 0), ('C', 0), ('G', 0), ('T', 0)]);
    for c in dna.chars() {
        if count.contains_key(&c) {
            count.entry(c).and_modify(|n| *n += 1);
        } else {
            return Err(c);
        }
    }
    Ok(count)
}
