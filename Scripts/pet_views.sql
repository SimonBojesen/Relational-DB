CREATE OR REPLACE VIEW Cat
 AS
 SELECT p.id,
    p.name,
    p.age,
    c.life_count
   FROM public."Pet" p
     JOIN public."Cat" c ON p.id = c.pet_id
     order by p.id;
     
CREATE OR REPLACE VIEW Dog 
 AS
 SELECT p.id,
    p.name,
    p.age,
    d.barkpitch
   FROM public."Pet" p
     JOIN public."Dog" d ON p.id = d.pet_id
     order by p.id;
     
CREATE OR REPLACE VIEW Pets
 AS
 SELECT p.id,
    p.name,
    p.age,
    c.life_count,
    d.barkpitch
   FROM public."Pet" p    
     LEFT JOIN public."Cat" c ON p.id = c.pet_id
     LEFT JOIN public."Dog" d ON p.id = d.pet_id
     order by p.id;
     
