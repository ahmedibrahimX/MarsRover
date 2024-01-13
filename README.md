# MarsRover
![Elixir](https://img.shields.io/badge/elixir-%234B275F.svg?style=for-the-badge&logo=elixir&logoColor=white)

## Description
> Building the backend of the a multiplayer web-based game of a simple rover that receives commands to move around Mars. The rover receives the commands in the form of characters and returns its position according to the execution of the commands. You can destroy other players by crashing into their rovers.

## Rules
- You are given a starting point (x,y) of and a direction (N, S, E, W) for a rover.
- The rover receives commands in the form of characters "f"orward, "b"ackward, "l", "r".
- Planets are spheres, model that by wrapping from one edge of the grid to another.
- If the rover crashes into the rover of another player, the other player's rover is destroyed.