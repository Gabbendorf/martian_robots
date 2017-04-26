
# Problem: Martian Robots

### The Problem

The surface of Mars can be modelled by a rectangular grid around which robots are able to move according to instructions provided from Earth. You are to write a program that determines each sequence of robot positions and reports the final position of the robot.
A robot position consists of a grid coordinate (a pair of integers: x-coordinate followed by y-coordinate) and an orientation (N, S, E, W for north, south, east, and west).
A robot instruction is a string of the letters “L”, “R”, and “F” which represent, respectively, the instructions:
Left : the robot turns left 90 degrees and remains on the current grid point.
Right : the robot turns right 90 degrees and remains on the current grid point.
Forward : the robot moves forward one grid point in the direction of the current orientation and maintains the same orientation.
The direction North corresponds to the direction from grid point (x, y) to grid point (x, y+1).
Since the grid is square and bounded, a robot that moves “off” an edge of the grid is lost forever.
However, lost robots leave a robot “scent” that prohibits future robots from dropping off the world at the same grid point. The scent is left at the last grid position the robot occupied before disappearing over the edge. An instruction to move “off” the world from a grid point from which a robot has been previously lost is simply ignored by the current robot. A robot will stop at the point where a previous robot that had disappeared has left its scent regardless of its current orientation.

## How to run the tests:
From main directory: `rspec spec`, to run all tests inside `spec` directory
From `spec` directory: `rspec <file_name_spec.rb>`

## How to include color when running the tests:
To add color from the command line: `rspec spec --color`
