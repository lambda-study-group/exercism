use sublist::Comparison;



fn main() {
    // Comparison::Equal;
    let arr = &[1,2,3,4,5];
    let subarr = &arr[1..3];
    dbg!("Array: {}", &arr);
    dbg!("Subarray: {}", &subarr);
    println!("Well, hello!");
}