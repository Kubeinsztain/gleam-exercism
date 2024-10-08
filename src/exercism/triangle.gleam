pub fn is_triangle(a: Float, b: Float, c: Float) -> Bool {
  a +. b >=. c && a +. c >=. b && b +. c >=. a
}

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  a == b && b == c && is_triangle(a, b, c)
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  { a == b || b == c || a == c } && is_triangle(a, b, c)
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  { a != b && b != c && a != c } && is_triangle(a, b, c)
}
