ALTER TABLE "Users"
  ADD COLUMN notes_count INTEGER DEFAULT 0;

CREATE TRIGGER IF NOT EXISTS "Users_incr_NotesCount"
  AFTER INSERT ON "Notes"
  FOR EACH ROW BEGIN

    UPDATE "Users"
    SET notes_count = notes_count + 1
    WHERE id = NEW.Users_id;

  END;

CREATE TRIGGER IF NOT EXISTS "Users_decr_NotesCount"
  AFTER DELETE ON "Notes"
  FOR EACH ROW BEGIN

    UPDATE "Users"
    SET notes_count = notes_count - 1
    WHERE id = OLD.Users_id;

  END;
