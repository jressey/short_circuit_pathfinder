short_circuit_pathfinder
========================

<h3>RPCFN #3 Short Circuit</h3>


<p>
	Purpose of the app is to find the shortest path between two points through other points.  Each point to point connection has a 'resistence' value.  Short path is the path with the lowest total 'resistence' value
</p>


Input:

[
   [ A, B, 50],
   [ A, D, 150],
   [ B, C, 250],
   [ B, E, 250],
   [ C, E, 350],
   [ C, D, 50],
   [ C, F, 100],
   [ D, F, 400],
   [ E, G, 200],
   [ F, G, 100],
]


Expected Output:

[
  [ 'A', 'B', 50 ],
  [ 'B', 'C', 250],
  [ 'B', 'E', 250],
  [ 'C', 'E', 350],
  [ 'D', 'F', 400],
  [ 'E', 'G', 200],
]