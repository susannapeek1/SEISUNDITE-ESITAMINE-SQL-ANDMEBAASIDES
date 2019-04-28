CREATE TABLE Tootlemisel (
tellimuse_nr integer NOT NULL,
algusaeg D_ajapiirang NOT NULL DEFAULT LOCALTIMESTAMP(0),
lopuaeg D_ajapiirang NULL,
CONSTRAINT PK_Tootlemisel PRIMARY KEY (tellimuse_nr)
CONSTRAINT FK_Tootlemisel_Tellimus FOREIGN KEY (tellimuse_nr) REFERENCES Tellimus (tellimuse_nr) ON DELETE Cascade ON UPDATE No Action);
CREATE INDEX IDX_Tootlemisel_lopuaeg ON Tootlemisel(lopuaeg) 
WHERE lopuaeg IS NOT NULL;