pub fn square(s: u32) -> u64 {
    if s < 1 || s > 64 {
        panic!("Square must be between 1 and 64");
    }
    1u64 << (s - 1)
}

pub fn total() -> u64 {
    u64::MAX
}
