\c seisundite_esitamine;

BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET tellimuse_seisundi_liik_kood = 4 WHERE tellimus.tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET tellimuse_seisundi_liik_kood = 4 WHERE tellimus.tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET tellimuse_seisundi_liik_kood = 4 WHERE tellimus.tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET tellimuse_seisundi_liik_kood = 4 WHERE tellimus.tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET tellimuse_seisundi_liik_kood = 4 WHERE tellimus.tellimuse_nr=290550;
ROLLBACK;

BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET valja_saadetud_aeg=NULL, kohale_toimetatud_aeg=LOCALTIMESTAMP(0) WHERE tellimus.tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET valja_saadetud_aeg=NULL, kohale_toimetatud_aeg=LOCALTIMESTAMP(0) WHERE tellimus.tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET valja_saadetud_aeg=NULL, kohale_toimetatud_aeg=LOCALTIMESTAMP(0) WHERE tellimus.tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET valja_saadetud_aeg=NULL, kohale_toimetatud_aeg=LOCALTIMESTAMP(0) WHERE tellimus.tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET valja_saadetud_aeg=NULL, kohale_toimetatud_aeg=LOCALTIMESTAMP(0) WHERE tellimus.tellimuse_nr=290550;
ROLLBACK;

BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET on_valja_saadetud=FALSE, on_kohale_toimetatud=TRUE WHERE tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET on_valja_saadetud=FALSE, on_kohale_toimetatud=TRUE WHERE tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET on_valja_saadetud=FALSE, on_kohale_toimetatud=TRUE WHERE tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET on_valja_saadetud=FALSE, on_kohale_toimetatud=TRUE WHERE tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET on_valja_saadetud=FALSE, on_kohale_toimetatud=TRUE WHERE tellimuse_nr=290550;
ROLLBACK;

BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET seisund='00010' WHERE tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET seisund='00010' WHERE tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET seisund='00010' WHERE tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET seisund='00010' WHERE tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE tellimus SET seisund='00010' WHERE tellimuse_nr=290550;
ROLLBACK;

BEGIN;
EXPLAIN ANALYZE UPDATE saadetis SET kliendile_uleandmise_aeg=LOCALTIMESTAMP(0) WHERE tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE saadetis SET kliendile_uleandmise_aeg=LOCALTIMESTAMP(0) WHERE tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE saadetis SET kliendile_uleandmise_aeg=LOCALTIMESTAMP(0) WHERE tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE saadetis SET kliendile_uleandmise_aeg=LOCALTIMESTAMP(0) WHERE tellimuse_nr=290550;
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE UPDATE saadetis SET kliendile_uleandmise_aeg=LOCALTIMESTAMP(0) WHERE tellimuse_nr=290550;
ROLLBACK;

BEGIN;
EXPLAIN ANALYZE DELETE FROM valja_saadetud_tellimus WHERE tellimuse_nr=290550;
EXPLAIN ANALYZE INSERT INTO kohale_toimetatud_tellimus (tellimuse_nr) VALUES (290550); 
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE DELETE FROM valja_saadetud_tellimus WHERE tellimuse_nr=290550;
EXPLAIN ANALYZE INSERT INTO kohale_toimetatud_tellimus (tellimuse_nr) VALUES (290550); 
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE DELETE FROM valja_saadetud_tellimus WHERE tellimuse_nr=290550;
EXPLAIN ANALYZE INSERT INTO kohale_toimetatud_tellimus (tellimuse_nr) VALUES (290550); 
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE DELETE FROM valja_saadetud_tellimus WHERE tellimuse_nr=290550;
EXPLAIN ANALYZE INSERT INTO kohale_toimetatud_tellimus (tellimuse_nr) VALUES (290550); 
ROLLBACK;
BEGIN;
EXPLAIN ANALYZE DELETE FROM valja_saadetud_tellimus WHERE tellimuse_nr=290550;
EXPLAIN ANALYZE INSERT INTO kohale_toimetatud_tellimus (tellimuse_nr) VALUES (290550); 
ROLLBACK;

