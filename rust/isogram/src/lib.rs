use std::collections::HashSet;

// pub fn check(candidate: &str) -> bool {
//     let mut seen = HashSet::new();
//     for c in candidate.chars() {
//         if c.is_alphabetic() {
//             let c = c.to_ascii_lowercase();
//             if seen.contains(&c) {
//                 return false;
//             }
//             seen.insert(c);
//         }
//     }
//     return true;
// }

pub fn check(candidate: &str) -> bool {
    let mut seen = HashSet::new();
    candidate.chars().for_each(|c| 
        if c.is_alphabetic() {
            let c = c.to_ascii_lowercase();
            if seen.contains(&c) {
                return false;
            }
            seen.insert(c);
        });
    return true;
}