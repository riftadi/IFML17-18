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
   "oid_user"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "email"  varchar(255),
   "name"  varchar(255),
   "affiliation"  varchar(255),
   "timestamp"  timestamp,
   "reputation"  float8,
  primary key ("oid_user")
);


-- Notifications [ent1]
create table "public"."notifications" (
   "notification_oid"  int4  not null,
   "timestamp"  timestamp,
   "isprocessed"  bool,
  primary key ("notification_oid")
);


-- Publications [ent2]
create table "public"."publications" (
   "oid_publication"  int4  not null,
   "title"  varchar(255),
   "venue"  varchar(255),
   "year"  text,
   "pdf_file"  varchar(255),
   "timestamp"  timestamp,
   "abstract"  text,
   "isclaimed"  bool,
  primary key ("oid_publication")
);


-- Collections [ent3]
create table "public"."collections" (
   "oid_collection"  int4  not null,
   "title"  varchar(255),
   "description"  varchar(255),
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
alter table "public"."user_group"   add constraint fk_user_group_user foreign key ("user_oid") references "public"."user" ("oid_user");
alter table "public"."user_group"   add constraint fk_user_group_group foreign key ("group_oid") references "public"."group" ("oid");


-- Notifications_User [rel1]
alter table "public"."notifications"  add column  "user_oid_user"  int4;
alter table "public"."notifications"   add constraint fk_notifications_user foreign key ("user_oid_user") references "public"."user" ("oid_user");


-- Comments_Publications [rel10]
alter table "public"."comments"  add column  "oid_publication"  int4;
alter table "public"."comments"   add constraint fk_comments_publications foreign key ("oid_publication") references "public"."publications" ("oid_publication");


-- Publications_Keywords [rel11]
create table "public"."publications_keywords" (
   "publications_oid_publication"  int4 not null,
   "keywords_oid_keyword"  int4 not null,
  primary key ("publications_oid_publication", "keywords_oid_keyword")
);
alter table "public"."publications_keywords"   add constraint fk_publications_keywords_publi foreign key ("publications_oid_publication") references "public"."publications" ("oid_publication");
alter table "public"."publications_keywords"   add constraint fk_publications_keywords_keywo foreign key ("keywords_oid_keyword") references "public"."keywords" ("oid_keyword");


-- List_of_Authors [rel12]
create table "public"."list_of_authors" (
   "publications_oid_publication"  int4 not null,
   "user_oid_user"  int4 not null,
  primary key ("publications_oid_publication", "user_oid_user")
);
alter table "public"."list_of_authors"   add constraint fk_list_of_authors_publication foreign key ("publications_oid_publication") references "public"."publications" ("oid_publication");
alter table "public"."list_of_authors"   add constraint fk_list_of_authors_user foreign key ("user_oid_user") references "public"."user" ("oid_user");


-- Own_publications [rel14]
alter table "public"."publications"  add column  "user_oid_user"  int4;
alter table "public"."publications"   add constraint fk_publications_user foreign key ("user_oid_user") references "public"."user" ("oid_user");


-- Owner_of_comment [rel15]
alter table "public"."comments"  add column  "oid_user"  int4;
alter table "public"."comments"   add constraint fk_comments_user foreign key ("oid_user") references "public"."user" ("oid_user");


-- Shared_with [rel16]
create table "public"."collections" (
   "oid_collection"  int4 not null,
   "user_oid_user"  int4 not null,
  primary key ("oid_collection", "user_oid_user")
);
alter table "public"."collections"   add constraint fk_collections_collections foreign key ("oid_collection") references "public"."collections" ("oid_collection");
alter table "public"."collections"   add constraint fk_collections_user foreign key ("user_oid_user") references "public"."user" ("oid_user");


-- Creator [rel17]
alter table "public"."collections"  add column  "oid_user"  int4;
alter table "public"."collections"   add constraint fk_collections_user_2 foreign key ("oid_user") references "public"."user" ("oid_user");


-- User_Keywords [rel18]
create table "public"."user_keywords" (
   "user_oid_user"  int4 not null,
   "keywords_oid_keyword"  int4 not null,
  primary key ("user_oid_user", "keywords_oid_keyword")
);
alter table "public"."user_keywords"   add constraint fk_user_keywords_user foreign key ("user_oid_user") references "public"."user" ("oid_user");
alter table "public"."user_keywords"   add constraint fk_user_keywords_keywords foreign key ("keywords_oid_keyword") references "public"."keywords" ("oid_keyword");


-- Notifications_Publications [rel2]
alter table "public"."notifications"  add column  "publications_oid_publication"  int4;
alter table "public"."notifications"   add constraint fk_notifications_publications foreign key ("publications_oid_publication") references "public"."publications" ("oid_publication");


-- Collections_Publications [rel4]
create table "public"."collections_publications" (
   "collections_oid_collection"  int4 not null,
   "publications_oid_publication"  int4 not null,
  primary key ("collections_oid_collection", "publications_oid_publication")
);
alter table "public"."collections_publications"   add constraint fk_collections_publications_co foreign key ("collections_oid_collection") references "public"."collections" ("oid_collection");
alter table "public"."collections_publications"   add constraint fk_collections_publications_pu foreign key ("publications_oid_publication") references "public"."publications" ("oid_publication");


-- Collections_Keywords [rel8]
create table "public"."collections_keywords" (
   "collections_oid_collection"  int4 not null,
   "keywords_oid_keyword"  int4 not null,
  primary key ("collections_oid_collection", "keywords_oid_keyword")
);
alter table "public"."collections_keywords"   add constraint fk_collections_keywords_collec foreign key ("collections_oid_collection") references "public"."collections" ("oid_collection");
alter table "public"."collections_keywords"   add constraint fk_collections_keywords_keywor foreign key ("keywords_oid_keyword") references "public"."keywords" ("oid_keyword");


