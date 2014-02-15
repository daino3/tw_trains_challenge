require_relative 'config/route_map'
require_relative 'models/shortest_path'
require_relative 'models/train_route'

# puts ShortestPath.new(TRAIN_ROUTE, A, C)
# puts ShortestPath.new(TRAIN_ROUTE, A, D)

$route = TrainRoute.new(*TRAIN_ROUTE)

def printer(num, expression)
  print "OUTPUT #{num}: ", eval(expression), "\n"
end

# The distance of the route A-B-C.
printer(1, "$route.travel(A, B, C) == 9") 

# The distance of the route A-D.
printer(2, '$route.travel(A, D) == 5')

# The distance of the route A-D-C.
printer(3, '$route.travel(A, D, C) == 13')

# The distance of the route A-E-B-C-D.
printer(4, '$route.travel(A, E, B, C, D) == 22') 

# The distance of the route A-E-D.
printer(5, "$route.travel(A, E, D) == 'NO SUCH ROUTE'")

# The number of trips starting at C and ending at C with a maximum of 3 stops. In the sample data below, there are two such trips: C-D-C (2 stops). and C-E-B-C (3 stops).
# printer(6, "$route.number_of_trips(C, C, <=3) == 2")

# The number of trips starting at A and ending at C with exactly 4 stops. In the sample data below, there are three such trips: A to C (via B,C,D); A to C (via D,C,D); and A to C (via D,E,B).
# printer(7, "$route.number_of_trips(A, C, ==4) == 3")

# The length of the shortest route (in terms of distance to travel) from A to C.
printer(8, "$route.shortest_route(A, C) == 9")

# The length of the shortest route (in terms of distance to travel) from B to B.
printer(9, "$route.shortest_route(B, B) == 9")

# The number of different routes from C to C with a distance of less than 30. In the sample data, the trips are: CDC, CEBC, CEBCDC, CDCEBC, CDEBC, CEBCEBC, CEBCEBCEBC.
# printer(10, "$route.number_of_routes(C, C) == 7")