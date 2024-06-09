BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "todos" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "content" text NOT NULL,
    "created_at" timestamp without time zone NOT NULL,
    "updated_at" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR todos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('todos', '20240609213317179', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240609213317179', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
