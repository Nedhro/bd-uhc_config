-- sajida config
update idgen_identifier_source set name="SHK", description="ID sequence source for patients in Keraniganj" where name="BDH";
select @identier_id := id from idgen_identifier_source where name="SHK";
update idgen_seq_id_gen set prefix="SHK" where id=@identier_id;