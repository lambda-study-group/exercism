pub fn is_armstrong_number(num: u32) -> bool {
    to_digits(num.into())
        .iter()
        .fold(0, |acc, el| acc + el.pow(num.to_string().len() as u32))
        == num.into()
}

fn to_digits(num: u64) -> Vec<u64> {
    if num > 0 {
        let mut digits = vec![];
        let mut n = num;
        while n > 0 {
            digits.push(n % 10);
            n = n / 10;
        }
        digits.reverse();
        digits
    } else {
        return vec![0];
    }
}
