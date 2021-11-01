use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &'a str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let mut result = HashSet::<&'a str>::new();
    let mut word_chars: Vec<char> = word.to_uppercase().chars().collect();
    for possible_anagram in possible_anagrams {
        if possible_anagram.len() != word.len() {
            continue;
        }
        let mut possible_chars: Vec<char> = possible_anagram.to_uppercase().chars().collect();
        if possible_chars == word_chars {
            continue;
        }
        possible_chars.sort();
        word_chars.sort();
        if possible_chars == word_chars {
            result.insert(possible_anagram);
        }
    }
    result
}
