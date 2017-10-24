-- Collections_Keywords [rel8]
create table "public"."collections_keywords" (
   "collections_oid_collection"  int4 not null,
   "keywords_name"  varchar(255) not null,
  primary key ("collections_oid_collection", "keywords_name")
);


