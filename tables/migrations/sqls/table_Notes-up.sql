CREATE TABLE IF NOT EXISTS "Notes" (
  "id"        INTEGER   PRIMARY KEY,
  "title"     TEXT      NOT NULL,
  "text"      TEXT      NOT NULL,
  "Users_id"  INTEGER   NOT NULL,

  CONSTRAINT "Notes_fk_Users_id"
    FOREIGN KEY ("User_id") REFERENCES "Users" ("id")
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX "Notes_ix_User_id" ON "Notes" ("User_id");
