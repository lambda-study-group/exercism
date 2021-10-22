module ReverseString

let reverse (input: string): string = 
    let mutable acc = []
    String.iter (fun c -> acc <- c :: acc) input
    List.toArray acc |> System.String