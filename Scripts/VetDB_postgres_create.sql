CREATE TABLE IF NOT EXISTS "City" (
	"zipcode" character varying(10) NOT NULL,
	"name" character varying(100) NOT NULL,
	CONSTRAINT "City_pk" PRIMARY KEY ("zipcode")
) WITH (
  OIDS=FALSE
);

CREATE TABLE IF NOT EXISTS "Address" (
	"id" serial NOT NULL,
	"street" character varying(100) NOT NULL,
	"city_zipcode" character varying(10) NOT NULL,
	CONSTRAINT "Address_pk" PRIMARY KEY ("id"),
	CONSTRAINT "Address_fk0" FOREIGN KEY ("city_zipcode") REFERENCES "City"("zipcode")
) WITH (
  OIDS=FALSE
);


CREATE TABLE IF NOT EXISTS "Vet" (
	"cvr" char(8) NOT NULL,
	"name" character varying(100) NOT NULL,
	"phone" character varying(100) NOT NULL,
	"address_id" int NOT NULL,
	CONSTRAINT "Vet_pk" PRIMARY KEY ("cvr"),
	CONSTRAINT "Vet_fk0" FOREIGN KEY ("address_id") REFERENCES "Address"("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE IF NOT EXISTS "Caretaker" (
	"id" serial NOT NULL,
	"name" character varying(100) NOT NULL,
	"phone" character varying(100) NOT NULL,
	"address_id" int NOT NULL,
	CONSTRAINT "Caretaker_pk" PRIMARY KEY ("id"),
	CONSTRAINT "Caretaker_fk0" FOREIGN KEY ("address_id") REFERENCES "Address"("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE IF NOT EXISTS "Pet" (
	"id" serial NOT NULL,
	"name" character varying(100) NOT NULL,
	"age" int NOT NULL,
	"vet_cvr" char(8) NOT NULL,
	CONSTRAINT "Pet_pk" PRIMARY KEY ("id"),
	CONSTRAINT "Pet_fk0" FOREIGN KEY ("vet_cvr") REFERENCES "Vet"("cvr")
) WITH (
  OIDS=FALSE
);


CREATE TABLE IF NOT EXISTS "PetCaretaker" (
	"caretaker_id" int NOT NULL,
	"pet_id" int NOT NULL,
	CONSTRAINT "PetCaretaker_pk" PRIMARY KEY ("caretaker_id","pet_id"),
	CONSTRAINT "PetCaretaker_fk0" FOREIGN KEY ("caretaker_id") REFERENCES "Caretaker"("id"),
	CONSTRAINT "PetCaretaker_fk1" FOREIGN KEY ("pet_id") REFERENCES "Pet"("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE IF NOT EXISTS "Cat" (
	"pet_id" serial NOT NULL,
	"life_count" int NOT NULL,
	CONSTRAINT "Cat_pk" PRIMARY KEY ("pet_id"),
	CONSTRAINT "Cat_fk0" FOREIGN KEY ("pet_id") REFERENCES "Pet"("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE IF NOT EXISTS "Dog" (
	"pet_id" serial NOT NULL,
	"barkpitch" character(2) NOT NULL,
	CONSTRAINT "Dog_pk" PRIMARY KEY ("pet_id"),
	CONSTRAINT "Dog_fk0" FOREIGN KEY ("pet_id") REFERENCES "Pet"("id")
) WITH (
  OIDS=FALSE
);

