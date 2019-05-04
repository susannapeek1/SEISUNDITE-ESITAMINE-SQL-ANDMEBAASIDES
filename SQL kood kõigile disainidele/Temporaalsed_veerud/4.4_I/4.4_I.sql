START TRANSACTION;
ALTER TABLE tellimus ADD makstud_aeg TIMESTAMP WITHOUT TIME ZONE NULL;
ALTER TABLE tellimus DROP CONSTRAINT chk_tellimus_saab_olla_maksimaalselt_uhes_seisundis,
                     ADD CONSTRAINT chk_tellimus_saab_olla_maksimaalselt_uhes_seisundis CHECK (num_nonnulls(ootel_aeg, tootlemisel_aeg, kohale_toimetatud_aeg, valja_saadetud_aeg, tuhistatud_aeg, makstud_aeg)=1);
CREATE INDEX idx_tellimus_makstud ON tellimus (makstud_aeg)
WHERE makstud_aeg IS NOT NULL;
COMMIT;