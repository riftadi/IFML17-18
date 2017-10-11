-- Group [Group]
create table "public"."group" (
   "oid"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid")
);


-- Module [Module]
create table "public"."module" (
   "oid"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid")
);


-- User [User]
create table "public"."user" (
   "oid"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "email"  varchar(255),
  primary key ("oid")
);


-- Researchers [ent1]
create table "public"."researchers" (
   "oid_researcher"  int4  not null,
   "name"  varchar(255),
   "affiliation"  varchar(255),
   "email"  varchar(255),
   "username"  varchar(255),
   "password"  varchar(255),
   "timestamp"  timestamp,
   "reputation"  float8,
  primary key ("oid_researcher")
);


-- Publications [ent2]
create table "public"."publications" (
   "oid_publication"  int4  not null,
   "title"  varchar(255),
   "venue"  varchar(255),
   "year"  int4,
   "pdf_file"  varchar(255),
   "timestamp"  timestamp,
  primary key ("oid_publication")
);


-- Collections [ent3]
create table "public"."collections" (
   "oid_collection"  int4  not null,
   "title"  varchar(255),
   "description"  varchar(255),
   "n_publications"  varchar(255),
   "timestamp"  timestamp,
  primary key ("oid_collection")
);


-- Keywords [ent4]
create table "public"."keywords" (
   "oid_keyword"  int4  not null,
   "name"  varchar(255),
   "timestamp"  timestamp,
  primary key ("oid_keyword")
);


-- Comments [ent5]
create table "public"."comments" (
   "oid_comment"  int4  not null,
   "title"  varchar(255),
   "content"  text,
   "timestamp"  timestamp,
  primary key ("oid_comment")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group"  add column  "module_oid"  int4;
alter table "public"."group"   add constraint fk_group_module foreign key ("module_oid") references "public"."module" ("oid");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_oid"  int4 not null,
   "module_oid"  int4 not null,
  primary key ("group_oid", "module_oid")
);
alter table "public"."group_module"   add constraint fk_group_module_group foreign key ("group_oid") references "public"."group" ("oid");
alter table "public"."group_module"   add constraint fk_group_module_module foreign key ("module_oid") references "public"."module" ("oid");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_oid"  int4;
alter table "public"."user"   add constraint fk_user_group foreign key ("group_oid") references "public"."group" ("oid");


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "user_oid"  int4 not null,
   "group_oid"  int4 not null,
  primary key ("user_oid", "group_oid")
);
alter table "public"."user_group"   add constraint fk_user_group_user foreign key ("user_oid") references "public"."user" ("oid");
alter table "public"."user_group"   add constraint fk_user_group_group foreign key ("group_oid") references "public"."group" ("oid");


-- List_of_Authors [rel1]
create table "public"."list_of_authors" (
   "publications_oid_publication"  int4 not null,
   "researchers_oid_researcher"  int4 not null,
  primary key ("publications_oid_publication", "researchers_oid_researcher")
);
alter table "public"."list_of_authors"   add constraint fk_list_of_authors_publication foreign key ("publications_oid_publication") references "public"."publications" ("oid_publication");
alter table "public"."list_of_authors"   add constraint fk_list_of_authors_researchers foreign key ("researchers_oid_researcher") references "public"."researchers" ("oid_researcher");


-- Comments_Publications [rel10]
alter table "public"."publications"  add column  "comments_oid_comment"  int4;
alter table "public"."publications"   add constraint fk_publications_comments foreign key ("comments_oid_comment") references "public"."comments" ("oid_comment");


-- Publications_Keywords [rel11]
create table "public"."publications_keywords" (
   "publications_oid_publication"  int4 not null,
   "keywords_oid_keyword"  int4 not null,
  primary key ("publications_oid_publication", "keywords_oid_keyword")
);
alter table "public"."publications_keywords"   add constraint fk_publications_keywords_publi foreign key ("publications_oid_publication") references "public"."publications" ("oid_publication");
alter table "public"."publications_keywords"   add constraint fk_publications_keywords_keywo foreign key ("keywords_oid_keyword") references "public"."keywords" ("oid_keyword");


-- Owner [rel2]
alter table "public"."researchers"  add column  "publications_oid_publication"  int4;
alter table "public"."researchers"   add constraint fk_researchers_publications foreign key ("publications_oid_publication") references "public"."publications" ("oid_publication");


-- Researchers_Keywords [rel3]
create table "public"."researchers_keywords" (
   "researchers_oid_researcher"  int4 not null,
   "keywords_oid_keyword"  int4 not null,
  primary key ("researchers_oid_researcher", "keywords_oid_keyword")
);
alter table "public"."researchers_keywords"   add constraint fk_researchers_keywords_resear foreign key ("researchers_oid_researcher") references "public"."researchers" ("oid_researcher");
alter table "public"."researchers_keywords"   add constraint fk_researchers_keywords_keywor foreign key ("keywords_oid_keyword") references "public"."keywords" ("oid_keyword");


-- Collections_Publications [rel4]
create table "public"."collections_publications" (
   "collections_oid_collection"  int4 not null,
   "publications_oid_publication"  int4 not null,
  primary key ("collections_oid_collection", "publications_oid_publication")
);
alter table "public"."collections_publications"   add constraint fk_collections_publications_co foreign key ("collections_oid_collection") references "public"."collections" ("oid_collection");
alter table "public"."collections_publications"   add constraint fk_collections_publications_pu foreign key ("publications_oid_publication") references "public"."publications" ("oid_publication");


-- Creator [rel5]
alter table "public"."researchers"  add column  "collections_oid_collection"  int4;
alter table "public"."researchers"   add constraint fk_researchers_collections foreign key ("collections_oid_collection") references "public"."collections" ("oid_collection");


-- Shared_with [rel6]
alter table "public"."collections"  add column  "researchers_oid_researcher"  int4;
alter table "public"."collections"   add constraint fk_collections_researchers foreign key ("researchers_oid_researcher") references "public"."researchers" ("oid_researcher");


-- Collections_Keywords [rel8]
create table "public"."collections_keywords" (
   "collections_oid_collection"  int4 not null,
   "keywords_oid_keyword"  int4 not null,
  primary key ("collections_oid_collection", "keywords_oid_keyword")
);
alter table "public"."collections_keywords"   add constraint fk_collections_keywords_collec foreign key ("collections_oid_collection") references "public"."collections" ("oid_collection");
alter table "public"."collections_keywords"   add constraint fk_collections_keywords_keywor foreign key ("keywords_oid_keyword") references "public"."keywords" ("oid_keyword");


-- Owner [rel9]
alter table "public"."researchers"  add column  "comments_oid_comment"  int4;
alter table "public"."researchers"   add constraint fk_researchers_comments foreign key ("comments_oid_comment") references "public"."comments" ("oid_comment");


