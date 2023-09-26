use std::{char::from_digit, cmp, collections::HashMap};

pub fn annotate(minefield: &[&str]) -> Vec<String> {
    let neighborhood = find_neighborhoods(minefield);
    minefield
        .iter()
        .enumerate()
        .map(|(i, row)| {
            row.chars()
                .enumerate()
                .map(|(j, c)| {
                    if c == '*' {
                        '*'
                    } else {
                        let neighbor_count = *neighborhood.get(&(i, j)).unwrap_or(&0);
                        if neighbor_count == 0 {
                            ' '
                        } else {
                            from_digit(neighbor_count, 10).unwrap()
                        }
                    }
                })
                .collect()
        })
        .collect()
}

fn find_neighborhoods(minefield: &[&str]) -> HashMap<(usize, usize), u32> {
    let mut neighbors: HashMap<(usize, usize), u32> = HashMap::new();
    for (i, row) in minefield.iter().enumerate() {
        for (j, c) in row.chars().enumerate() {
            if c == '*' {
                // Row above
                if i > 0 {
                    for k in j.saturating_sub(1)..=cmp::min(j + 1, row.len() - 1) {
                        neighbors
                            .entry((i - 1, k))
                            .and_modify(|c: &mut u32| *c += 1)
                            .or_insert(1);
                    }
                }
                // Current row
                if j > 0 {
                    neighbors
                        .entry((i, j - 1))
                        .and_modify(|c| *c += 1)
                        .or_insert(1);
                }
                if j < row.len() - 1 {
                    neighbors
                        .entry((i, j + 1))
                        .and_modify(|c| *c += 1)
                        .or_insert(1);
                }
                // Row below
                if i < minefield.len() - 1 {
                    for k in j.saturating_sub(1)..=cmp::min(j + 1, row.len() - 1) {
                        neighbors
                            .entry((i + 1, k))
                            .and_modify(|c: &mut u32| *c += 1)
                            .or_insert(1);
                    }
                }
            }
        }
    }
    neighbors
}
