CREATE TABLE "Vet" (
	"cvr" char(8) NOT NULL,
	"name" character varying(100) NOT NULL,
	"phone" character varying(100) NOT NULL,
	"address_id" int NOT NULL,
	CONSTRAINT "Vet_pk" PRIMARY KEY ("cvr")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "City" (
	"zipcode" character varying(10) NOT NULL,
	"name" character varying(100) NOT NULL,
	CONSTRAINT "City_pk" PRIMARY KEY ("zipcode")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Address" (
	"id" serial NOT NULL,
	"street" character varying(100) NOT NULL,
	"city_zipcode" character varying(10) NOT NULL,
	CONSTRAINT "Address_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Caretaker" (
	"id" serial NOT NULL,
	"name" character varying(100) NOT NULL,
	"phone" character varying(100) NOT NULL,
	"address_id" int NOT NULL,
	CONSTRAINT "Caretaker_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Pet" (
	"id" serial NOT NULL,
	"name" character varying(100) NOT NULL,
	"age" int NOT NULL,
	"vet_cvr" char(8) NOT NULL,
	CONSTRAINT "Pet_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "PetCaretaker" (
	"caretaker_id" int NOT NULL,
	"pet_id" int NOT NULL,
	CONSTRAINT "PetCaretaker_pk" PRIMARY KEY ("caretaker_id","pet_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Cat" (
	"pet_id" serial NOT NULL,
	"life_count" int NOT NULL,
	CONSTRAINT "Cat_pk" PRIMARY KEY ("pet_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dog" (
	"pet_id" serial NOT NULL,
	"barkpitch" character(2) NOT NULL,
	CONSTRAINT "Dog_pk" PRIMARY KEY ("pet_id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Vet" ADD CONSTRAINT "Vet_fk0" FOREIGN KEY ("address_id") REFERENCES "Address"("id");


ALTER TABLE "Address" ADD CONSTRAINT "Address_fk0" FOREIGN KEY ("city_zipcode") REFERENCES "City"("zipcode");

ALTER TABLE "Caretaker" ADD CONSTRAINT "Caretaker_fk0" FOREIGN KEY ("address_id") REFERENCES "Address"("id");

ALTER TABLE "Pet" ADD CONSTRAINT "Pet_fk0" FOREIGN KEY ("vet_cvr") REFERENCES "Vet"("cvr");

ALTER TABLE "PetCaretaker" ADD CONSTRAINT "PetCaretaker_fk0" FOREIGN KEY ("caretaker_id") REFERENCES "Caretaker"("id");
ALTER TABLE "PetCaretaker" ADD CONSTRAINT "PetCaretaker_fk1" FOREIGN KEY ("pet_id") REFERENCES "Pet"("id");

ALTER TABLE "Cat" ADD CONSTRAINT "Cat_fk0" FOREIGN KEY ("pet_id") REFERENCES "Pet"("id");

ALTER TABLE "Dog" ADD CONSTRAINT "Dog_fk0" FOREIGN KEY ("pet_id") REFERENCES "Pet"("id");

