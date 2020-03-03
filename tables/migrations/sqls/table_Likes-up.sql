CREATE TABLE IF NOT EXISTS "Likes" (
  "Note_id"    INTEGER   NOT NULL,
  "User_id"    INTEGER   NOT NULL,

  UNIQUE("Note_id", "User_id"),

  CONSTRAINT Likes_fk_Notes_id
    FOREIGN KEY ("Note_id") REFERENCES "Notes" ("id")
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Likes_fk_Users_id
    FOREIGN KEY ("User_id") REFERENCES "Users" ("id")
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS "Likes_ix_ManyToMany"
  ON "Likes" ("Note_id", "User_id");
