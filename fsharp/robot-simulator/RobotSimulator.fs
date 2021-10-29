module RobotSimulator

open System.Numerics

let Direction =
    {| North = Complex.ImaginaryOne
       East = Complex.One
       South = -Complex.ImaginaryOne
       West = -Complex.One |}

type Direction = Complex

type Position = Complex

type Robot =
    { direction: Direction
      position: Position }

let create direction (real, imag) =
    { direction = direction
      position = Complex((float)real, (float)imag) }

let move instructions robot =
    Seq.fold (fun r i ->
        match i with
        | 'R' -> { r with direction = r.direction * -Complex.ImaginaryOne }
        | 'L' -> { r with direction = r.direction * Complex.ImaginaryOne }
        | 'A' -> { r with position = r.position + r.direction }
        | _ -> failwith "Unrecognized instruction") robot instructions
