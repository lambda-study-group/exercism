pub fn expected_minutes_in_oven() -> i32 {
    return 49;
}

pub fn remaining_minutes_in_oven(actual_minutes_in_oven: i32) -> i32 {
    return expected_minutes_in_oven() - actual_minutes_in_oven;
}

pub fn preparation_time_in_minutes(number_of_layers: i32) -> i32 {
    return number_of_layers * 2;
}

pub fn elapsed_time_in_minutes(number_of_layers: i32, actual_minutes_in_oven: i32) -> i32 {
    return actual_minutes_in_oven + preparation_time_in_minutes(number_of_layers);
}
