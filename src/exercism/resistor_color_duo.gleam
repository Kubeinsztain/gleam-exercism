pub type Color {
  Black
  Brown
  Red
  Orange
  Yellow
  Green
  Blue
  Violet
  Grey
  White
}

pub fn value(colors: List(Color)) -> Result(Int, Nil) {
  case colors {
    [first, second, ..] -> {
      Ok(color_to_value(first) * 10 + color_to_value(second))
    }
    _ -> Error(Nil)
  }
}

fn color_to_value(color: Color) -> Int {
  case color {
    Black -> 0
    Brown -> 1
    Red -> 2
    Orange -> 3
    Yellow -> 4
    Green -> 5
    Blue -> 6
    Violet -> 7
    Grey -> 8
    White -> 9
  }
}
