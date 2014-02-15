require_relative '../models/town'

A = Town.new("A", {"B" => 5, "D" => 5, "E" => 7})
B = Town.new("B", {"C" => 4})
C = Town.new("C", {"D" => 8, "E" => 2})
D = Town.new("D", {"C" => 8, "E" => 6})
E = Town.new("E", {"B" => 3})

TEST_TOWN = A
TRAIN_ROUTE = [A, B, C, D, E]