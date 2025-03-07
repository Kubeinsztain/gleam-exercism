import exercism/etl
import gleam/dict
import gleam/io

pub fn main() {
  let input =
    dict.from_list([
      #(1, ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]),
      #(10, ["Q", "Z"]),
      #(2, ["D", "G"]),
      #(3, ["B", "C", "M", "P"]),
      #(4, ["F", "H", "V", "W", "Y"]),
      #(5, ["K"]),
      #(8, ["J", "X"]),
    ])

  etl.transform(input) |> io.debug
}
