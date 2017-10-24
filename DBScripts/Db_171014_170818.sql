-- Notifications [ent1]
create table "public"."notifications" (
   "notification_oid"  int4  not null,
   "timestamp"  timestamp,
   "isprocessed"  bool,
  primary key ("notification_oid")
);


-- User [User]
alter table "public"."user"  add column  "oid_user"  int4  not null;
alter table "public"."user"  add column  "name"  varchar(255);
alter table "public"."user"  add column  "affiliation"  varchar(255);
alter table "public"."user"  add column  "timestamp"  timestamp;
alter table "public"."user"  add column  "reputation"  float8;


-- Publications [ent2]
alter table "public"."publications"  add column  "isclaimed"  bool;
alter table "public"."publications"  add column  "abstract"  text;


-- Notifications_User [rel1]
alter table "public"."notifications"  add column  "user_oid_user"  int4;
alter table "public"."notifications"   add constraint fk_notifications_user foreign key ("user_oid_user") references "public"."user" ("oid_user");


-- Comments_Publications [rel10]
alter table "public"."comments"  add column  "oid_publication"  int4;
alter table "public"."comments"   add constraint fk_comments_publications foreign key ("oid_publication") references "public"."publications" ("oid_publication");


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


