BEGIN;

TRUNCATE
  "word",
  "language",
  "user";

INSERT INTO "user" ("id", "username", "name", "password")
VALUES
  (
    1,
    "admin",
    "Dunder Mifflin Admin",
    -- password = "pass"
    "$2a$10$fCWkaGbt7ZErxaxclioLteLUgg4Q3Rp09WW0s/wSLxDKYsaGYUpjG"
  ),
  (
    2,
    "user",
    "spaced",
    "pap"
  );

INSERT INTO "language" ("id", "name", "user_id")
VALUES
  (1, 'French', 1),
  (2, 'German', 2);

INSERT INTO "word" ("id", "language_id", "original", "translation", "next")
VALUES
  (1, 1, 'entraine toi', 'practice', 2),
  (2, 1, 'bonjour', 'hello', 3),
  (3, 1, 'maison', 'house', 4),
  (4, 1, 'développeur', 'developer', 5),
  (5, 1, 'traduire', 'translate', 6),
  (6, 1, 'incroyable', 'amazing', 7),
  (7, 1, 'chien', 'dog', 8),
  (8, 1, 'tiger', 'tiger', null),
  (9, 2, 'die berge', 'the mountains', 10),
  (10, 2, 'hallo', 'hello', 11),
  (11, 2, 'schloss', 'castle', 12),
  (12, 2, 'gut', 'good', 13),
  (13, 2, 'sprechen', 'speak', 14),
  (14, 2, 'ja', 'yes', 15),
  (15, 2, 'die sterne', 'the stars', 16),
  (16, 2, 'alt', 'old', null);

UPDATE "language" SET head = 1 WHERE id = 1;

-- because we explicitly set the id fields
-- update the sequencer for future automatic id setting
SELECT setval('word_id_seq', (SELECT MAX(id) from "word"));
SELECT setval('language_id_seq', (SELECT MAX(id) from "language"));
SELECT setval('user_id_seq', (SELECT MAX(id) from "user"));

COMMIT;
