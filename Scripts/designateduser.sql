create role Consumer with LOGIN password '1234';
REVOKE ALL
ON ALL TABLES IN SCHEMA public
FROM Consumer;
GRANT SELECT ON "pets" TO Consumer;
GRANT SELECT ON "cats" TO Consumer;
GRANT SELECT ON "dogs" TO Consumer;
GRANT ALL on procedure create_cat TO Consumer;
GRANT ALL on procedure create_dog TO Consumer;
