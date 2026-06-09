# WORLD CUP DATABASE 
___

* This repo is for a certification task that I did on the FreeCodeCamp website. 

___
## FILES
___
### SQL FILE
* The first is the worldcup.sql file: This is a PostgreSQL database created in the Bash terminal. It includes SQL statements such as CREATE, JOIN, SELECT, DROP, ALTER, and INSERT.
It also includes constraints such as UNIQUE, FOREIGN KEY, PRIMARY KEY, NULL, VARCHAR, etc.
* The tables in this database are games and teams.
* Both tables have primary IDs that were created with an automatically increasing order (SERIAL). The primary IDs are saved with the names of the tables with "id" at the end.
  eg (game_id).
* The teams table also has the names column for the names of the teams that participated in the 2014 and 2018 World Cups.
* The games table contains the "opponent_id" and the "winner_id" as well. These IDs are also foreign keys for the teams table, both referencing the games table. These columns are also UNIQUE and NOT NULL.
* The games table also includes the year and round, which were evident in both World Cups.
___
### BASH FILES
The bash files in this repo are insert_data.sh and queries.sh files. 
The insert_data.sh file, when run, instructs the IDE to skip the header of the row matching layout and insert the data from the data file provided by freecodecamp into the database, ie, into the games table.
The queries.sh file, when run, returns all the queries fed into it. Therefore, there is no need to query the database one after the other. Example: (echo "$($PSQL "SELECT SUM(winner_goals + opponent_goals) FROM games")"
___
