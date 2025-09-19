DROP TABLE IF EXISTS Stats;
DROP TABLE IF EXISTS CareTakes;
DROP TABLE IF EXISTS Plants;
DROP TABLE IF EXISTS Tplant;
DROP TABLE IF EXISTS Families;

CREATE TABLE Tplant (
	TplantID SERIAL PRIMARY KEY,
	TplantName VARCHAR(32),
	TplantDescription VARCHAR(128)
);

CREATE TABLE Families (
	familyID SERIAL PRIMARY KEY,
	familyName VARCHAR(32),
	traits VARCHAR(128)
);

CREATE TABLE Plants (
	plantID SERIAL PRIMARY KEY,
	plantName VARCHAR(32),
	plantType INTEGER,
	plantFamily INTEGER,
	plantCost INTEGER,
	plantOrigin VARCHAR(32),

	CONSTRAINT plantTypeFK 
		FOREIGN KEY(plantType) 
			REFERENCES Tplant(TplantID)
			ON DELETE SET NULL
			ON UPDATE CASCADE,
			
	CONSTRAINT plantFamilyFK 
		FOREIGN KEY (plantFamily) 
			REFERENCES Families(familyID)
			ON DELETE CASCADE
			ON UPDATE CASCADE
);

CREATE TABLE Stats (
	statID SERIAL PRIMARY KEY,
	plantID INTEGER,
	stat VARCHAR(32),
	statValue VARCHAR(32),

	CONSTRAINT plantIDFK 
		FOREIGN KEY (plantID) 
			REFERENCES Plants(plantID)
			ON DELETE SET NULL
			ON UPDATE CASCADE
);

CREATE TABLE CareTakes (
	careTakeID SERIAL PRIMARY KEY,
	plantID INTEGER,
	careTakeDate DATE,
	operation VARCHAR(32),
	commentary VARCHAR(128),

	CONSTRAINT plantID
		FOREIGN KEY (plantID)
			REFERENCES Plants(plantID)
			ON DELETE CASCADE
			ON UPDATE CASCADE
);