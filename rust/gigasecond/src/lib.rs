use time::{Duration, PrimitiveDateTime as DateTime};

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    start
        .checked_add(Duration::seconds(1_000_000_000))
        .expect("Cannot perform DateTime arithmetic")
}
