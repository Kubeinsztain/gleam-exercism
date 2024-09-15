import gleam/int
import gleam/io
import gleam/list

pub fn main() {
  let books_1 = [1, 1, 2, 2, 3, 3, 4, 5]
  // let books_2 = [1, 2, 3, 5]
  // let books_3 = [1, 2]
  // let books_4 = [4, 4, 1, 2]
  // let books_5 = [1, 5, 2, 3, 2]

  list.sort(books_1, int.compare)
  |> unique_books_count
  |> list.sort(int.compare)
  |> fill_set
  |> io.debug
  |> calculate_price
  |> io.debug
}

fn unique_books_count(books: List(Int)) -> List(Int) {
  // list.unique(books) |> list.length
  use counts, book <- list.fold(over: books, from: [])
  case book - list.length(counts) {
    0 -> {
      let assert [head, ..tail] = counts
      [head + 1, ..tail]
    }
    n -> list.concat([[1], list.repeat(0, n - 1), counts])
  }
}

fn fill_set(counts: List(Int)) -> List(Int) {
  case list.length(counts) {
    5 -> counts
    _ ->
      [0, ..counts]
      |> fill_set
  }
}

// Calculate the price of the provided counts of unique books
fn calculate_price(counts: List(Int)) -> Int {
  // Helper function to calculate the price of a given set of books
  let price_of_set = fn(set: List(Int), price: Int) -> Int {
    counts
    |> take(set)
    |> list.sort(int.compare)
    |> calculate_price()
    |> int.add(price)
  }

  case counts {
    [0, 0, 0, 0, count] -> 800 * count
    [0, 0, 0, _, _] -> price_of_set([0, 0, 0, 1, 1], 1520)
    [0, 0, _, _, _] -> price_of_set([0, 0, 1, 1, 1], 2160)
    [0, _, _, _, _] -> price_of_set([0, 1, 1, 1, 1], 2560)
    [_, _, _, _, _] -> {
      let set_of_5 = price_of_set([1, 1, 1, 1, 1], 3000)
      let set_of_4 = price_of_set([0, 1, 1, 1, 1], 2560)
      int.min(set_of_5, set_of_4)
    }
    _ -> panic
  }
}

// Map over provided count of unique books ("from")
// and return the count of unique books
// reduced by the pattern given in "set"
fn take(from: List(Int), set: List(Int)) -> List(Int) {
  use n, count <- list.map2(set, from)
  count - n
}
