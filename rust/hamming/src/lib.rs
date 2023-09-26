pub fn hamming_distance(s1: &str, s2: &str) -> Option<usize> {
    (s1.len() == s2.len()).then(|| {
        s1.chars()
            .zip(s2.chars())
            .fold(0, |acc, (c1, c2)| acc + if c1 == c2 { 0 } else { 1 })
    })
}
