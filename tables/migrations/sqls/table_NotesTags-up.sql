CREATE TABLE IF NOT EXISTS "NotesTags" (
  "Note_id"    INTEGER   NOT NULL,
  "Tag_id"     INTEGER   NOT NULL,

  UNIQUE("Note_id", "Tag_id"),

  CONSTRAINT NotesTags_fk_Notes_id
    FOREIGN KEY ("Note_id") REFERENCES "Notes" ("id")
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT NotesTags_fk_Tags_id
    FOREIGN KEY ("Tag_id") REFERENCES "Tags" ("id")
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS "NotesTags_ix_ManyToMany"
  ON "NotesTags" ("Note_id", "Tag_id");
