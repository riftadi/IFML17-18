-- Keywords [ent4]
create table "public"."keywords" (
   "name"  varchar(255)  not null,
   "timestamp"  timestamp,
  primary key ("name")
);


-- Publications_Keywords [rel11]
create table "public"."publications_keywords" (
   "publications_oid_publication"  int4 not null,
   "keywords_name"  varchar(255) not null,
  primary key ("publications_oid_publication", "keywords_name")
);


-- User_Keywords [rel18]
create table "public"."user_keywords" (
   "user_oid_user"  int4 not null,
   "keywords_name"  varchar(255) not null,
  primary key ("user_oid_user", "keywords_name")
);


-- Keywords_Collections [rel3]
create table "public"."keywords_collections" (
   "keywords_name"  varchar(255) not null,
   "collections_oid_collection"  int4 not null,
  primary key ("keywords_name", "collections_oid_collection")
);


