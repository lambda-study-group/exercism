use std::collections::HashMap;
use rayon::prelude::*;

pub fn seq_frequency(text: &str) -> HashMap<char, usize> {
    let mut map = HashMap::new();

    for chr in text.chars().filter(|c| c.is_alphabetic()) {
        if let Some(c) = chr.to_lowercase().next() {
            (*map.entry(c).or_insert(0)) += 1;
        }
    }

    map
}

pub fn frequency(input: &[&str], _worker_count: usize) -> HashMap<char, usize> {
    let maps: Vec<_> = input.par_iter()
        .map(|s| seq_frequency(s))
        .collect();

    let mut result: HashMap<char, usize> = HashMap::new();
    for map in maps {
        for (k, v) in map {
            *result.entry(k).or_insert(0) += v;
        }
    }

    result
}