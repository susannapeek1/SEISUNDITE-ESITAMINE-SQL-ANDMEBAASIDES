START TRANSACTION;
DROP TRIGGER t_kontroll_seisundi_vaartuse_ja_aja_muutusele ON tellimus;
CREATE TRIGGER t_kontroll_seisundi_vaartuse_ja_aja_muutusele
BEFORE UPDATE OF on_ootel,on_tootlemisel,on_valja_saadetud,on_kohale_toimetatud ON tellimus
FOR EACH ROW
WHEN (NEW.on_ootel<>OLD.on_ootel 
	  OR NEW.on_tootlemisel<>OLD.on_tootlemisel 
	  OR NEW.on_valja_saadetud<>OLD.on_valja_saadetud 
	  OR NEW.on_kohale_toimetatud<>OLD.on_kohale_toimetatud)
EXECUTE FUNCTION f_kontroll_seisundi_vaartuse_ja_aja_muutusele();
ALTER TABLE tellimus DROP CONSTRAINT CHK_Tellimus_saab_olla_maksimaalselt_uhes_seisundis, 
					 ADD CONSTRAINT CHK_Tellimus_saab_olla_maksimaalselt_uhes_seisundis CHECK (((on_ootel=true)::int + (on_tootlemisel=true)::int + (on_valja_saadetud=true)::int + (on_kohale_toimetatud=true)::int) = 1);
ALTER TABLE tellimus DROP COLUMN on_tuhistatud;
COMMIT;