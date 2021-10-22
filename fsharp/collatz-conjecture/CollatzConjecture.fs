module CollatzConjecture

let steps (number: int): int option = 
    let rec tailSteps (number: int) (acc: int) =
        if number = 1 then Some acc
        elif number % 2 = 0 then (tailSteps (number/2) (acc+1))
        else (tailSteps (3*number + 1) (acc+1))
    if number <= 0 then None
    else tailSteps number 0