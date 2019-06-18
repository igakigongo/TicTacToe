## TicTacToe

### Introduction (Background)
TicTacToe is a board game that is played by a maximum of 2 players. This project entails building this game using Ruby programming language. For details of how to play the game, kindly visit this [wikipedia article](https://en.wikipedia.org/wiki/Tic-tac-toe).

### Project Design
This repository contains two sub-directories 
* /lib - has all entities used in the program
* /bin - contains the executable for running the game (console based UI)

### Entities
* Player - is a player in the game
* Board - holds information about the board being used
* Game - cordinates players on a board, during play

### Design Decisions
Although we have designed a board whose dimensions are 3 rows by 3 columns, it's possible to design the same game but with a higher number of rows and columns.

### Observations
By building the game we learnt that the winning moves for any TicTacToe game with a squared board, i.e number of rows equal to number of columns,
the winning moves, can be derived from this formula

```
moves = 2(k + 1)
```

where k = number of columns/rows 

### Contributors
* [Moses Ogwo](https://github.com/mosesogwo)
* [Edward Iga Kigongo](https://github.com/igakigongo)
