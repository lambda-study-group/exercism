module GradeSchool exposing (addStudent, allStudents, empty, studentsInGrade)

import Dict exposing (Dict)


type alias Grade =
    Int


type alias Student =
    String


type alias School =
    Dict Grade (List Student)


empty : School
empty =
    Dict.empty


addStudent : Grade -> Student -> School -> School
addStudent grade student school =
    let
        students =
            Maybe.withDefault [] <|
                Dict.get grade school

        updatedStudents =
            List.sort <| student :: students
    in
    Dict.insert grade updatedStudents school


studentsInGrade : Grade -> School -> List Student
studentsInGrade grade =
    Maybe.withDefault [] << Dict.get grade


allStudents : School -> List ( Grade, List Student )
allStudents =
    Dict.toList
