/// Check a Luhn checksum.

pub fn is_valid(code: &str) -> bool {
    let mut sum = 0;
    let mut i = 0;
    for c in code.chars().rev() {
        if c.is_whitespace() {
            continue;
        }
        match c.to_digit(10) {
            None => return false,
            Some(d) if i % 2 == 0 => sum += d,
            Some(d) => {
                sum += 2 * d;
                if 2 * d > 9 {
                    sum -= 9
                }
            }
        }
        i += 1
    }
    i > 1 && sum % 10 == 0
}
