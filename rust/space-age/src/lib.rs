// The code below is a stub. Just enough to satisfy the compiler.
// In order to pass the tests you can add-to or change any of this code.

#[derive(Debug)]
pub struct Duration {
    earth_years: f64,
}

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Self {
            earth_years: s as f64 / 31557600.0,
        }
    }
}

pub trait Planet {
    fn years_during(d: &Duration) -> f64 {
        unimplemented!(
            "convert a duration ({d:?}) to the number of years on this planet for that duration"
        );
    }
}

macro_rules! generate_planets {
    ($($t:ident => $e:expr),+) => {
        $(
            pub struct $t;

            impl Planet for $t {
                fn years_during(d: &Duration) -> f64 {
                    d.earth_years / $e
                }
            }
        )*
    };
}

generate_planets!(
    Mercury => 0.2408467,
    Venus => 0.61519726,
    Earth => 1.0,
    Mars => 1.8808158,
    Jupiter => 11.862615,
    Saturn => 29.447498,
    Uranus => 84.016846,
    Neptune => 164.79132
);
