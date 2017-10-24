-- Keywords_Publications [rel3]
create table "public"."keywords_publications" (
   "keywords_name"  varchar(255) not null,
   "publications_oid_publication"  int4 not null,
  primary key ("keywords_name", "publications_oid_publication")
);


-- Keywords_User [rel7]
create table "public"."keywords_user" (
   "keywords_name"  varchar(255) not null,
   "user_oid_user"  int4 not null,
  primary key ("keywords_name", "user_oid_user")
);


