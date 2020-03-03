DROP TRIGGER IF EXISTS "Users_incr_NotesCount";

DROP TRIGGER IF EXISTS "Users_decr_NotesCount";

PRAGMA foreign_keys = OFF;

BEGIN TRANSACTION;

ALTER TABLE "Users" RENAME TO "Users_backup" ;

CREATE TABLE IF NOT EXISTS "Users" (
  "id"          INTEGER   PRIMARY KEY,
  "name"        TEXT      NOT NULL      UNIQUE,
  "birthdate"   DATE,
  "email"       TEXT      NOT NULL      UNIQUE,
  "phone"       TEXT                    UNIQUE,
  "password"    TEXT      NOT NULL
);

INSERT INTO "Users" ("id", "name", "birthdate", "email", "phone", "password")
  SELECT "id", "name", "birthdate", "email", "phone", "password"
  FROM "Users_backup";

DROP TABLE "Users_backup";

COMMIT;

PRAGMA foreign_keys = ON;
