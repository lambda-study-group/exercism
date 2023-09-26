use std::{collections::HashMap, iter::zip};

pub fn brackets_are_balanced(string: &str) -> bool {
    let opening = ['(', '[', '{'];
    let closing = [')', ']', '}'];

    let matching: HashMap<char, char> = HashMap::from_iter(zip(closing, opening));
    let mut stack: Vec<char> = vec![];
    for c in string.chars() {
        if opening.contains(&c) {
            stack.push(c)
        } else if closing.contains(&c) {
            if !stack.is_empty() && matching.get(&c).unwrap() == stack.last().unwrap() {
                stack.pop();
            } else {
                return false
            }
        }
    }
    stack.is_empty()
}
