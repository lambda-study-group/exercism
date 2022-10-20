
pub fn production_rate_per_hour(speed: u8) -> f64 {
     

    let mut rate = 0.0;
    if speed <= 4 {rate = 1.0;}
    else if speed <= 8 {rate = 0.9;}
    else {rate = 0.77;}
    
    return (speed as f64) * (221 as f64) * rate;
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    

   return  ((production_rate_per_hour(speed) / (60 as f64)) as u32);
}