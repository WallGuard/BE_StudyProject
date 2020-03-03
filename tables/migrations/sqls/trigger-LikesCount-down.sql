DROP TRIGGER IF EXISTS "Notes_incr_LikesCount";

DROP TRIGGER IF EXISTS "Notes_decr_LikesCount";

PRAGMA foreign_keys = OFF;

BEGIN TRANSACTION;

ALTER TABLE "Notes" RENAME TO "Notes_backup" ;

CREATE TABLE IF NOT EXISTS "Notes" (
  "id"        INTEGER   PRIMARY KEY,
  "title"     TEXT      NOT NULL,
  "text"      TEXT      NOT NULL,
  "Users_id"  INTEGER   NOT NULL,

  CONSTRAINT "Notes_fk_Users_id"
    FOREIGN KEY ("Users_id") REFERENCES "Users" ("id")
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS "Notes_ix_Users_id"
  ON "Notes" ("Users_id");

INSERT INTO "Notes" ("id", "title", "text", "Users_id")
  SELECT "id", "title", "text", "Users_id"
  FROM "Notes_backup";

DROP TABLE "Notes_backup";

COMMIT;

PRAGMA foreign_keys = ON;
