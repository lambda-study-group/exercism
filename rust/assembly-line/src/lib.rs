#![allow(unused)]

const HOURLY_RATE: u32 = 221;

fn success_rate(speed: u8) -> f64 {
    match speed {
        0..=4 => 1.0,
        5..=8 => 0.9,
        _ => 0.77,
    }
}

pub fn production_rate_per_hour(speed: u8) -> f64 {
    return ((speed as u32 * HOURLY_RATE) as f64) * success_rate(speed);
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    return (production_rate_per_hour(speed) / 60.0) as u32;
}
