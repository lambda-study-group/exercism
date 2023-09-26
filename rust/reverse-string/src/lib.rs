use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
    let graphemes = input.graphemes(true);
    let mut result = String::new();
    for g in graphemes {
        result.insert_str(0, g);
    }
    result
}
