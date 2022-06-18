BEGIN;

DROP TABLE IF EXISTS "adress", "city", "country", "deathplace", "birthplace", "photographer", "photographer_has_adress", "photographer as city";

CREATE TABLE "adress" (
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
    "way" VARCHAR(255),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE "city"(
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "town" VARCHAR (30),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE "country"(
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "state" VARCHAR (30),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE "deathplace"(
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "city" VARCHAR (30),
    "department" VARCHAR (30),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ,
    "country_id" INTEGER NOT NULL REFERENCES "country"("id") ON DELETE CASCADE
);

CREATE TABLE "birthplace"(
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "city" VARCHAR (30),
    "department" VARCHAR (30),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ,
    "country_id" INTEGER NOT NULL REFERENCES "country"("id") ON DELETE CASCADE
);

CREATE TABLE "photographer"(
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
    "firstname" VARCHAR(30) NOT NULL,
    "lastname" VARCHAR(30) NOT NULL,
    "birthdate" DATE,
    "deathdate" DATE,
    "activityperiode" VARCHAR (30), 
    "biography" TEXT,
    "portraiting" TEXT,
    "signature" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ
    "birthplace_id" INTEGER REFERENCES "birthplace"("id") ON DELETE CASCADE
    "deathplace_id" INTEGER REFERENCES "deathplace"("id") ON DELETE CASCADE
);

CREATE TABLE "photographer_has_adress"(
    "photographer_id" INTEGER NOT NULL REFERENCES "photographer"("id") ON DELETE CASCADE,
    "adress_id" INTEGER NOT NULL REFERENCES "adress"("id") ON DELETE CASCADE,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY ("photographer_id", "adress_id")
);

CREATE TABLE "photographer as city"(
    "photographer_id" INTEGER NOT NULL REFERENCES "photographer"("id") ON DELETE CASCADE,
    "city_id" INTEGER NOT NULL REFERENCES "city"("id") ON DELETE CASCADE,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY ("photographer_id", "city_id")
);

COMMIT;