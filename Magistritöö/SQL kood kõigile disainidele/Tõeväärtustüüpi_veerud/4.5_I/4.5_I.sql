ALTER TABLE tellimus ADD on_makstud boolean NOT NULL;
ALTER TABLE tellimus DROP CONSTRAINT CHK_Tellimus_saab_olla_maksimaalselt_uhes_seisundis, 
					 ADD CONSTRAINT CHK_Tellimus_saab_olla_maksimaalselt_uhes_seisundis CHECK (((on_ootel=true)::int + (on_tootlemisel=true)::int + (on_valja_saadetud=true)::int + (on_kohale_toimetatud=true)::int + (on_tuhistatud=true)::int + (on_makstud)::int )=1);
DROP TRIGGER t_kontroll_seisundi_vaartuse_ja_aja_muutusele ON tellimus;
CREATE TRIGGER T_kontroll_seisundi_vaartuse_ja_aja_muutusele
BEFORE UPDATE OF on_ootel,on_tootlemisel,on_valja_saadetud,on_kohale_toimetatud,on_tuhistatud, on_makstud ON Tellimus
FOR EACH ROW
WHEN (NEW.on_ootel<>OLD.on_ootel OR NEW.on_tootlemisel<>OLD.on_tootlemisel OR NEW.on_valja_saadetud<>OLD.on_valja_saadetud OR NEW.on_kohale_toimetatud<>OLD.on_kohale_toimetatud OR NEW.on_tuhistatud<>OLD.on_tuhistatud OR NEW.on_makstud<>OLD.on_makstud)
EXECUTE FUNCTION F_kontroll_seisundi_vaartuse_ja_aja_muutusele();
CREATE INDEX IDX_Tellimus_makstud ON Tellimus(on_makstud) 
WHERE on_makstud = TRUE;