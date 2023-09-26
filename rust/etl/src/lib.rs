use std::collections::BTreeMap;

pub fn transform(h: &BTreeMap<i32, Vec<char>>) -> BTreeMap<char, i32> {
    let mut map = BTreeMap::new();
    h.iter().for_each(|(points, chars)| {
        chars.iter().for_each(|c| {
            map.insert(c.to_ascii_lowercase(), *points);
        })
    });
    map
}
