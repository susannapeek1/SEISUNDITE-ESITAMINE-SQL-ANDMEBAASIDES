CREATE TABLE tootlemisel (
tellimuse_nr INTEGER NOT NULL,
algusaeg d_ajapiirang NOT NULL DEFAULT LOCALTIMESTAMP(0),
lopuaeg d_ajapiirang NULL,
CONSTRAINT PK_Tootlemisel PRIMARY KEY (tellimuse_nr)
CONSTRAINT FK_Tootlemisel_Tellimus FOREIGN KEY (tellimuse_nr) REFERENCES tellimus (tellimuse_nr) ON DELETE Cascade ON UPDATE No Action);
CREATE INDEX idx_Tootlemisel_lopuaeg ON tootlemisel(lopuaeg) 
WHERE lopuaeg IS NOT NULL;