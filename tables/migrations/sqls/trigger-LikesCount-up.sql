ALTER TABLE "Notes"
  ADD COLUMN likes_count INTEGER DEFAULT 0;

CREATE TRIGGER IF NOT EXISTS "Notes_incr_LikesCount"
  AFTER INSERT ON "Likes"
  FOR EACH ROW BEGIN

    UPDATE "Notes"
    SET likes_count = likes_count + 1
    WHERE id = NEW.Notes_id;

  END;

CREATE TRIGGER IF NOT EXISTS "Notes_decr_LikesCount"
  AFTER DELETE ON "Likes"
  FOR EACH ROW BEGIN

    UPDATE "Notes"
    SET likes_count = likes_count - 1
    WHERE id = OLD.Notes_id;

  END;
