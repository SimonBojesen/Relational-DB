
insert into "City" values (2300, 'Amager'), (2600, 'Glostrup'), (2700, 'Brønshøj') on conflict do nothing;
insert into "Address" values (1, 'Amagerbrogade 2', 2300), (2, 'Solsortevej 4', 2600), (3, 'Frederikssundsvej 136', 2700), (4, 'C. F. Møllers Allé 31', 2300), (5, 'Gadeager 15', 2600), (6, 'Håbets Allé 7', 2700), (7, 'Hyttehusvej 7', 2300)  on conflict do nothing;
insert into "Vet" values (12345678, 'Dyreklinikken', '+4512345678', 1), (87654321, 'Dyrenes ven', '+4587654321', 2) on conflict do nothing;
insert into "Caretaker" values (1, 'Henrik', '+4511111111', 3), (2, 'Amalie', '+4522222222', 3), 
								(3, 'John', '+4533333333', 4), (4, 'Malene', '+4544444444', 4),
								(5, 'Kurt', '+4555555555', 5), (6, 'Astrid', '+4566666666', 5), 
								(7, 'Allan', '+4577777777', 6), (8, 'Anna', '+4588888888', 6),
								(9, 'Tobias', '+4599999999', 7), (10, 'Heidi', '+4510101010', 7) on conflict do nothing;
insert into "Pet" values (1, 'Snebold1', 1, 12345678), (2, 'Snebold2', 2, 12345678), 
						 (3, 'Snebold3', 3, 12345678), (4, 'Snebold4', 4, 12345678),
						 (5, 'Snebold5', 5, 12345678), (6, 'Snebold6', 6, 12345678), 
						 (7, 'Snebold7', 7, 12345678), (8, 'Snebold8', 8, 12345678),
						 (9, 'Snebold9', 9, 12345678), (10, 'Snebold10', 10, 12345678),
						 (11, 'ScoobyDoo1', 1, 87654321), (12, 'ScoobyDoo2', 2, 87654321),
						 (13, 'ScoobyDoo3', 3, 87654321), (14, 'ScoobyDoo4', 4, 87654321),
						 (15, 'ScoobyDoo5', 5, 87654321), (16, 'ScoobyDoo6', 6, 87654321),
						 (17, 'ScoobyDoo7', 7, 87654321), (18, 'ScoobyDoo8', 8, 87654321),
						 (19, 'ScoobyDoo9', 9, 87654321), (20, 'ScoobyDoo10', 10, 87654321) on conflict do nothing;
						 
insert into "PetCaretaker" values (1, 1), (1, 11),
								  (2, 2), (2, 12), 
								  (3, 3), (3, 13), 
								  (4, 4), (4, 14), 
								  (5, 5), (5, 15), 
								  (6, 6), (6, 16), 
								  (7, 7), (7, 17), 
								  (8, 8), (8, 18), 
								  (9, 9), (9, 19), 
								  (10, 10), (10, 20) on conflict do nothing;
								  
insert into "Cat" values (1, 9), (5, 4), (12, 1) on conflict do nothing;
insert into "Dog" values (2, 'E2'), (20, 'C4'), (17, 'D5') on conflict do nothing;

SELECT setval(pg_get_serial_sequence('"Pet"', 'id'), (SELECT max(id) FROM "Pet"));
SELECT setval(pg_get_serial_sequence('"Caretaker"', 'id'), (SELECT max(id) FROM "Caretaker"));
SELECT setval(pg_get_serial_sequence('"Address"', 'id'), (SELECT max(id) FROM "Address"));

