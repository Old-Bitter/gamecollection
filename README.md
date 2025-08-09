  ____                         ____      _ _           _   _             
 / ___| __ _ _ __ ___   ___   / ___|___ | | | ___  ___| |_(_) ___  _ __  
| |  _ / _` | '_ ` _ \ / _ \ | |   / _ \| | |/ _ \/ __| __| |/ _ \| '_ \ 
| |_| | (_| | | | | | |  __/ | |__| (_) | | |  __/ (__| |_| | (_) | | | |
 \____|\__,_|_| |_| |_|\___|  \____\___/|_|_|\___|\___|\__|_|\___/|_| |_|

-------------------------------------------------------------------------

This is a test version of my game collection database project. I decided 
to remove ESRB ratings, because I'm old and decrepit and they don't matter
to me. I also removed developers and publishers from being their own table,
which may come to bite me later on, as a game can have many different devs
and pubs. I removed the status table, as it seemed frivolous. I included it
in the collection table instead. I tried to implement a variety of games 
that I own that can help me with testing. Some games I own in multiple 
different regions or platforms. Also a few games, I could not find an 
actual release date for, which will prove interesting. I could not get my 
ER Diagram to accept a boolean data type and had to settle for TINYINT, 
0 being false. Maybe someone can suggest a fix? If not, I can just code 
it out in the database creation.




