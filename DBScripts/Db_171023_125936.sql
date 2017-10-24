-- Keywords_Collections [rel3]
create table "public"."keywords_collections" (
   "keywords_name"  varchar(255) not null,
   "collections_oid_collection"  int4 not null,
  primary key ("keywords_name", "collections_oid_collection")
);


