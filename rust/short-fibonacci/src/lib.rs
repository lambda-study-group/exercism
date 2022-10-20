 
pub fn create_empty() -> Vec<u8> {
    return Vec::new();
}

 
pub fn create_buffer(count: usize) -> Vec<u8> {
    let mut v: Vec<u8> = Vec::new();

    for _i in 0..count {
        v.push(0);
    }

    return v;
}

 
pub fn fibonacci() -> Vec<u8> {
    let mut v = create_buffer(5);

    v[0] = 1;
    v[1] = 1;
    v[2] = v[1] + v[0];
    v[3] = v[2] + v[1];
    v[4] = v[3] + v[2];

    return v;
}