// The code below is a stub. Just enough to satisfy the compiler.
// In order to pass the tests you can add-to or change any of this code.
use num::{complex::Complex, One};

#[derive(PartialEq, Eq, Debug)]
pub enum Direction {
    North,
    East,
    South,
    West,
}

impl Direction {
    fn from_complex(z: Complex<i32>) -> &'static Direction {
        match z {
            z if z == Complex::i() => &Self::North,
            z if z == Complex::one() => &Self::East,
            z if z == -Complex::i() => &Self::South,
            z if z == -Complex::one() => &Self::West,
            _ => panic!(""),
        }
    }
}

pub struct Robot {
    position: Complex<i32>,
    direction: Complex<i32>,
}

impl Robot {
    pub fn new(x: i32, y: i32, d: Direction) -> Self {
        Robot {
            position: Complex::new(x, y),
            direction: Complex::i().powi(1 - (d as i32)),
        }
    }

    #[must_use]
    pub fn turn_right(self) -> Self {
        Robot {
            direction: self.direction * -Complex::i(),
            ..self
        }
    }

    #[must_use]
    pub fn turn_left(self) -> Self {
        Robot {
            direction: self.direction * Complex::i(),
            ..self
        }
    }

    #[must_use]
    pub fn advance(self) -> Self {
        Robot {
            position: self.position + self.direction,
            ..self
        }
    }

    #[must_use]
    pub fn instructions(self, instructions: &str) -> Self {
        let mut n = self;
        for c in instructions.chars() {
            n = match c {
                'L' => n.turn_left(),
                'R' => n.turn_right(),
                'A' => n.advance(),
                _ => panic!("Unknown instruction: {c}"),
            };
        }
        n
    }

    pub fn position(&self) -> (i32, i32) {
        (self.position.re, self.position.im)
    }

    pub fn direction(&self) -> &Direction {
        &Direction::from_complex(self.direction)
    }
}
