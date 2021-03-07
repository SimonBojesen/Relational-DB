drop procedure if exists public.create_cat;
drop procedure if exists public.create_dog;
CREATE OR REPLACE PROCEDURE public.create_cat(
    name character varying,
    age integer,
    life_count integer,
    vet_cvr char(8))
LANGUAGE 'plpgsql' security definer 
AS $$
DECLARE
  newid integer;
BEGIN
    INSERT INTO "Pet" (name, age, vet_cvr)
    VALUES (name, age, vet_cvr)
    RETURNING id INTO newid;

    INSERT INTO "Cat" (pet_id, life_count)
    values (newid, life_count);
END;
$$;

CREATE OR REPLACE PROCEDURE public.create_dog(
    name character varying,
    age integer,
    barkpitch char(2),
    vet_cvr char(8))
LANGUAGE 'plpgsql' security definer 
AS $$
DECLARE
  newid integer;
BEGIN
    INSERT INTO "Pet" (name, age, vet_cvr)
    VALUES (name, age, vet_cvr)
    RETURNING id INTO newid;

    INSERT INTO "Dog" (pet_id, barkpitch)
    values (newid, barkpitch);
END;
$$;

