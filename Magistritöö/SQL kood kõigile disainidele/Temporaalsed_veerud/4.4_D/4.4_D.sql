START TRANSACTION;
ALTER TABLE tellimus DROP CONSTRAINT CHK_Tellimus_saab_olla_maksimaalselt_uhes_seisundis,
                     ADD CONSTRAINT CHK_Tellimus_saab_olla_maksimaalselt_uhes_seisundis CHECK (num_nonnulls (ootel_aeg, tootlemisel_aeg, kohale_toimetatud_aeg, valja_saadetud_aeg) = 1);
ALTER TABLE tellimus DROP COLUMN tuhistatud_aeg;
COMMIT;