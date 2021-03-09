CREATE OR REPLACE VIEW Cats
 AS
 SELECT p.id,
    p.name,
    p.age,
    p.vet_cvr,
    c.life_count
   FROM public."Pet" p
     JOIN public."Cat" c ON p.id = c.pet_id
     order by p.id;
     
CREATE OR REPLACE VIEW Dogs 
 AS
 SELECT p.id,
    p.name,
    p.age,
    p.vet_cvr,
    d.barkpitch
   FROM public."Pet" p
     JOIN public."Dog" d ON p.id = d.pet_id
     order by p.id;
     
CREATE OR REPLACE VIEW Pets
 AS
 SELECT p.id,
    p.name,
    p.age,
    p.vet_cvr,
    c.life_count,
    d.barkpitch
   FROM public."Pet" p    
     LEFT JOIN public."Cat" c ON p.id = c.pet_id
     LEFT JOIN public."Dog" d ON p.id = d.pet_id
     order by p.id;
     
