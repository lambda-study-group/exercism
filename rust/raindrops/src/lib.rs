use std::collections::HashMap;

use string_builder::Builder;

pub fn raindrops(n: u32) -> String {
    let sounds = HashMap::from([(3, "Pling"), (5, "Plang"), (7, "Plong")]);
    let mut s = Builder::default();
    for (i, snd) in sounds {
        if n % i == 0 {
            s.append(snd);
        }
    }
    if s.len() == 0 {
        s.append(n.to_string());
    }
    return s.string().unwrap();
}
