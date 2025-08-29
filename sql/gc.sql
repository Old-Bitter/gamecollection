CREATE SCHEMA IF NOT EXISTS gc DEFAULT CHARACTER SET utf8mb4 ;
USE gc ;

CREATE TABLE IF NOT EXISTS gc.Games (
  GameID 			INT NOT NULL AUTO_INCREMENT,
  Title 			VARCHAR(100) NOT NULL,
  ReleaseDate 		DATE NOT NULL,
  PRIMARY KEY (GameID),
  UNIQUE INDEX idx_games_gameid_unique (GameID ASC) VISIBLE);

CREATE TABLE IF NOT EXISTS gc.Platform (
  PlatformID 		INT NOT NULL AUTO_INCREMENT,
  PlatformName 	VARCHAR(45) NOT NULL,
  PRIMARY KEY (PlatformID),
  UNIQUE INDEX idx_platform_platformid_unique (PlatformID ASC) VISIBLE,
  UNIQUE INDEX idx_platform_name_unique (PlatformName ASC) VISIBLE);

CREATE TABLE IF NOT EXISTS gc.Genres (
  GenreID 		INT NOT NULL AUTO_INCREMENT,
  Genre 			VARCHAR(45) NOT NULL,
  PRIMARY KEY (GenreID),
  UNIQUE INDEX idx_genres_genreid_unique (GenreID ASC) VISIBLE);

CREATE TABLE IF NOT EXISTS gc.Collection (
  CollectionID 	INT NOT NULL AUTO_INCREMENT,
  GameID 			INT NOT NULL,
  PlatformID 		INT NOT NULL,
  isPhysical 		TINYINT NOT NULL,
  Status 			ENUM('Completed', 'Backlog', 'Abandoned', 'On Hold') NOT NULL,
  PRIMARY KEY (GameID, PlatformID, isPhysical),
  UNIQUE INDEX idx_collection_id_unique (CollectionID ASC) INVISIBLE,
  CONSTRAINT fk_collection_game
    FOREIGN KEY (GameID)
    REFERENCES gc.Games (GameID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_collection_platform
    FOREIGN KEY (PlatformID)
    REFERENCES gc.Platform (PlatformID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS gc.GameGenreJunc (
  GameID 		INT NOT NULL,
  GenreID 	INT NOT NULL,
  PRIMARY KEY (GameID, GenreID),
  INDEX idx_gamegenre_genre_id (GenreID ASC) VISIBLE,
  CONSTRAINT fk_gamegenre_game
    FOREIGN KEY (GameID)
    REFERENCES gc.Games (GameID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_gamegenre_genre
    FOREIGN KEY (GenreID)
    REFERENCES gc.Genres (GenreID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS gc.Developer (
  DeveloperID 			INT NOT NULL AUTO_INCREMENT,
  DeveloperName 			VARCHAR(45) NOT NULL,
  DeveloperActive 		TINYINT NULL,
  DeveloperFoundedYear 	YEAR NULL,
  PRIMARY KEY (DeveloperID),
  UNIQUE INDEX idx_developer_id_unique (DeveloperID ASC) VISIBLE);

CREATE TABLE IF NOT EXISTS gc.Publisher (
  PublisherID 			INT NOT NULL AUTO_INCREMENT,
  PublisherName 			VARCHAR(45) NOT NULL,
  PublisherActive 		TINYINT NULL,
  PublisherFoundedYear 	YEAR NULL,
  PRIMARY KEY (PublisherID),
  UNIQUE INDEX idx_publisher_id_unique (PublisherID ASC) VISIBLE);

CREATE TABLE IF NOT EXISTS gc.GameDevJunc (
  GameID 			INT NOT NULL,
  DeveloperID 	INT NOT NULL,
  PRIMARY KEY (GameID, DeveloperID),
  INDEX idx_gamedev_developer_id (DeveloperID ASC) VISIBLE,
  CONSTRAINT fk_gamedev_developer
    FOREIGN KEY (DeveloperID)
    REFERENCES gc.Developer (DeveloperID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_gamedev_game
    FOREIGN KEY (GameID)
    REFERENCES gc.Games (GameID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS gc.GamePubJunc (
  GameID 			INT NOT NULL,
  PublisherID 	INT NOT NULL,
  PRIMARY KEY (GameID, PublisherID),
  CONSTRAINT fk_gamepub_game
    FOREIGN KEY (GameID)
    REFERENCES gc.Games (GameID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_gamepub_publisher
    FOREIGN KEY (PublisherID)
    REFERENCES gc.Publisher (PublisherID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
INSERT INTO Games (Title, ReleaseDate)
VALUES
('7 Days to Die', '2024-07-25'),
('Agony', '2018-05-29'),
('Alan Wake', '2010-05-18'),
('Avowed', '2025-02-18'),
('Back 4 Blood', '2021-10-12'),
('Batman: Arkham Asylum', '2009-08-25'),
('Batman: Arkham Asylum', '2009-09-15'),
('Batman: Arkham Asylum (Japanese)', '2010-01-14'),
('Batman: Arkham Asylum GOTY', '2010-05-11'),
('Batman: Return to Arkham - Arkham Asylum', '2016-10-18'),
('BioShock', '2007-08-21'),
('BioShock (German)', '2007-08-24'),
('Bioshock (Japanese)', '2008-02-21'),
('BioShock Remastered', '2016-09-13'),
('Hunter: The Reckoning: Wayward', '2003-09-09'),
('Gauntlet: Dark Legacy', '2001-05-01'),
('Cool Spot', '1993-04-01'),
('ClayFighter', '1993-11-30'),
('DOOM', '2006-09-27'),
('DOOM', '2019-07-26'),
('DOOM', '2016-05-13'),
('DOOM + DOOM II', '2024-08-08'),
('DuckTales', '1990-11-01'),
('Krusty''s Fun House', '1993-01-01'),
('Teenage Mutant Ninja Turtles: Fall of the Foot Clan', '1990-08-01'),
('WarioWare: Smooth Moves', '2007-01-15'),
('Fallout', '1997-10-10'),
('Fallout 2', '1998-10-29'),
('Fallout 3', '2008-10-28'),
('Wasteland 3', '2020-08-28'),
('Wasteland 3', '2020-08-08'),
('Wasteland 2: Director''s Cut', '2015-10-15'),
('Wasteland 2: Director''s Cut', '2016-11-10'),
('Borderlands', '2009-10-20'),
('Borderlands (Japanese)', '2010-02-25'),
('Borderlands: Game of the Year Edition', '2019-04-03'),
('DOOM', '1993-12-10'),
('Borderlands 2', '2012-09-18'),
('Borderlands 2', '2015-03-24');

INSERT INTO Platform (PlatformName)
VALUES
('Gameboy'),
('Xbox 360'),
('Playstation 2'),
('Xbox'),
('Xbox One'),
('Xbox Series X|S'),
('Playstation'),
('Playstation 3'),
('Playstation 4'),
('Playstation 5'),
('Sega Genesis'),
('Atari 2600'),
('Super Nintendo'),
('Nintendo 64'),
('Nintendo Wii'),
('PC');

INSERT INTO Genres (Genre)
VALUES
('Action'),
('Adventure'),
('Role-Playing Game'),
('Strategy'),
('Simulation'),
('Sports'),
('Puzzle'),
('Racing'),
('Survival'),
('Horror'),
('Platformer'),
('Fighting'),
('Party');

INSERT INTO Developer (DeveloperName)
VALUES
('The Fun Pimps'),
('Madmind Studio'),
('Remedy Entertainment'),
('Obsidian Entertainment'),
('Turtle Rock Studios'),
('Rocksteady Studios'),
('Virtuous'),
('Irrational Games'),
('Blind Squirrel Games'),
('High Voltage Software'),
('Midway Games'),
('Midway Games West'),
('Virgin Games'),
('Interplay Entertainment'),
('Visual Concepts'),
('Bethesda Softworks'),
('id Software'),
('Nerve Software'),
('Nightdive Studios'),
('MachineGames'),
('Capcom'),
('Audiogenic'),
('Konami'),
('Nintendo SPD'),
('Intelligent Systems'),
('Interplay Productions'),
('Black Isle Studios'),
('Bethesda Game Studios'),
('InXile Entertainment'),
('Gearbox Software');

INSERT INTO Publisher (PublisherName)
VALUES
('The Fun Pimps'),
('Ravenscourt'),
('Maximum Entertainment'),
('Xbox Game Studios'),
('Warner Bros. Games'),
('Eidos'),
('Square Enix'),
('2K Games'),
('Vivendi Universal Games'),
('Midway Games'),
('Virgin Games'),
('Interplay Entertainment'),
('Bethesda Softworks'),
('Nerve Software'),
('Capcom'),
('Acclaim'),
('Ultra Games'),
('Nintendo'),
('Interplay Productions'),
('Deep Silver'),
('Gearbox Software');

INSERT INTO GameDevJunc (GameID, DeveloperID)
SELECT games.GameID, developer.DeveloperID
FROM games
JOIN developer ON developer.developerName IN ('The Fun Pimps', 'Madmind Studio', 'Remedy Entertainment', 'Obsidian Entertainment', 'Turtle Rock Studios', 'Rocksteady Studios', 'Virtuous', 'Irrational Games', 'Blind Squirrel Games', 'High Voltage Software', 'Midway Games', 'Midway Games West', 'Virgin Games', 'Interplay Entertainment', 'Visual Concepts', 'Bethesda Softworks', 'id Software', 'Nerve Software', 'Nightdive Studios', 'MachineGames', 'Capcom', 'Audiogenic', 'Konami', 'Nintendo SPD', 'Intelligent Systems', 'Interplay Productions', 'Black Isle Studios', 'Bethesda Game Studios', 'InXile Entertainment', 'Gearbox Software')
WHERE
(games.Title = '7 Days to Die' AND developer.DeveloperName = 'The Fun Pimps') OR
(games.Title = 'Agony' AND developer.DeveloperName = 'Madmind Studio') OR
(games.Title = 'Alan Wake' AND developer.DeveloperName = 'Remedy Entertainment') OR
(games.Title = 'Avowed' AND developer.DeveloperName = 'Obsidian Entertainment') OR
(games.Title = 'Back 4 Blood' AND developer.DeveloperName = 'Turtle Rock Studios') OR
(games.Title LIKE 'Batman: Arkham Asylum%' AND developer.DeveloperName IN ('Rocksteady Studios', 'Virtuous')) OR
(games.Title LIKE 'BioShock%' AND developer.DeveloperName IN ('Irrational Games', 'Blind Squirrel Games')) OR
(games.Title = 'Hunter: The Reckoning: Wayward' AND developer.DeveloperName = 'High Voltage Software') OR
(games.Title = 'Gauntlet: Dark Legacy' AND developer.DeveloperName IN ('Midway Games', 'Midway Games West')) OR
(games.Title = 'Cool Spot' AND developer.DeveloperName = 'Virgin Games') OR
(games.Title = 'ClayFighter' AND developer.DeveloperName IN ('Interplay Entertainment', 'Visual Concepts')) OR
(games.Title LIKE 'DOOM%' AND developer.DeveloperName IN ('Bethesda Softworks', 'id Software', 'Nerve Software', 'Nightdive Studios', 'MachineGames')) OR
(games.Title = 'DuckTales' AND developer.DeveloperName = 'Capcom') OR
(games.Title = 'Krusty''s Fun House' AND developer.DeveloperName = 'Audiogenic') OR
(games.Title = 'Teenage Mutant Ninja Turtles: Fall of the Foot Clan' AND developer.DeveloperName = 'Konami') OR
(games.Title = 'WarioWare: Smooth Moves' AND developer.DeveloperName IN ('Nintendo SPD', 'Intelligent Systems')) OR
(games.Title LIKE 'Fallout%' AND developer.DeveloperName IN ('Interplay Productions', 'Black Isle Studios', 'Bethesda Game Studios')) OR
(games.Title LIKE 'Wasteland%' AND developer.DeveloperName = 'InXile Entertainment') OR
(games.Title LIKE 'Borderlands%' AND developer.DeveloperName IN ('Gearbox Software', 'Blind Squirrel Games'));
    
INSERT INTO GamePubJunc (GameID, PublisherID)
SELECT games.GameID, publisher.PublisherID
FROM games
JOIN publisher ON publisher.PublisherName IN ('The Fun Pimps', 'Ravenscourt', 'Maximum Entertainment', 'Xbox Game Studios', 'Warner Bros. Games', 'Eidos', 'Square Enix', '2K Games', 'Vivendi Universal Games', 'Midway Games', 'Virgin Games', 'Interplay Entertainment', 'Bethesda Softworks', 'Nerve Software', 'Capcom', 'Acclaim', 'Ultra Games', 'Nintendo', 'Interplay Productions', 'Deep Silver', 'Gearbox Software')
WHERE
(games.Title = '7 Days to Die' AND publisher.PublisherName = 'The Fun Pimps') OR
(games.Title = 'Agony' AND publisher.PublisherName IN ('Ravenscourt', 'Maximum Entertainment')) OR
(games.Title = 'Alan Wake' AND publisher.PublisherName = 'Xbox Game Studios') OR
(games.Title = 'Avowed' AND publisher.PublisherName = 'Xbox Game Studios') OR
(games.Title = 'Back 4 Blood' AND publisher.PublisherName = 'Warner Bros. Games') OR
(games.Title LIKE 'Batman: Arkham Asylum%' AND publisher.PublisherName IN ('Eidos', 'Square Enix', 'Warner Bros. Games')) OR
(games.Title LIKE 'BioShock%' AND publisher.PublisherName = '2K Games') OR
(games.Title = 'Hunter: The Reckoning: Wayward' AND publisher.PublisherName = 'Vivendi Universal Games') OR
(games.Title = 'Gauntlet: Dark Legacy' AND publisher.PublisherName = 'Midway Games') OR
(games.Title = 'Cool Spot' AND publisher.PublisherName = 'Virgin Games') OR
(games.Title = 'ClayFighter' AND publisher.PublisherName = 'Interplay Entertainment') OR
(games.Title LIKE 'DOOM%' AND publisher.PublisherName IN ('Bethesda Softworks', 'Nerve Software', 'id Software')) OR
(games.Title = 'DuckTales' AND publisher.PublisherName = 'Capcom') OR
(games.Title = 'Krusty''s Fun House' AND publisher.PublisherName = 'Acclaim') OR
(games.Title = 'Teenage Mutant Ninja Turtles: Fall of the Foot Clan' AND publisher.PublisherName = 'Ultra Games') OR
(games.Title = 'WarioWare: Smooth Moves' AND publisher.PublisherName = 'Nintendo') OR
(games.Title LIKE 'Fallout%' AND publisher.PublisherName IN ('Interplay Productions', 'Bethesda Softworks')) OR
(games.Title LIKE 'Wasteland%' AND publisher.PublisherName IN ('Deep Silver', 'InXile Entertainment')) OR
(games.Title LIKE 'Borderlands%' AND publisher.PublisherName = '2K Games');

INSERT INTO GameGenreJunc (GameID, GenreID)
SELECT games.GameID, genres.GenreID FROM games JOIN genres
WHERE (games.Title = '7 Days to Die' AND genres.Genre = 'Survival') OR
(games.Title = 'Agony' AND genres.Genre = 'Horror') OR
(games.Title = 'Alan Wake' AND genres.Genre IN ('Action', 'Adventure')) OR
(games.Title = 'Avowed' AND genres.Genre = 'Role-Playing Game') OR
(games.Title = 'Back 4 Blood' AND genres.Genre = 'Action') OR
(games.Title LIKE 'Batman: Arkham Asylum%' AND genres.Genre IN ('Action', 'Adventure')) OR
(games.Title LIKE 'BioShock%' AND genres.Genre = 'Role-Playing Game') OR
(games.Title = 'Hunter: The Reckoning: Wayward' AND genres.Genre = 'Action') OR
(games.Title = 'Gauntlet: Dark Legacy' AND genres.Genre IN ('Action', 'Role-Playing Game')) OR
(games.Title = 'Cool Spot' AND genres.Genre = 'Platformer') OR
(games.Title = 'ClayFighter' AND genres.Genre = 'Fighting') OR
(games.Title LIKE 'DOOM%' AND genres.Genre = 'Action') OR
(games.Title = 'DuckTales' AND genres.Genre = 'Platformer') OR
(games.Title = 'Krusty''s Fun House' AND genres.Genre = 'Puzzle') OR
(games.Title = 'Teenage Mutant Ninja Turtles: Fall of the Foot Clan' AND genres.Genre = 'Action') OR
(games.Title = 'WarioWare: Smooth Moves' AND genres.Genre = 'Party') OR
(games.Title LIKE 'Fallout%' AND genres.Genre = 'Role-Playing Game') OR
(games.Title LIKE 'Wasteland%' AND genres.Genre IN ('Role-Playing Game', 'Strategy')) OR
(games.Title LIKE 'Borderlands%' AND genres.Genre IN ('Action', 'Role-Playing Game'));