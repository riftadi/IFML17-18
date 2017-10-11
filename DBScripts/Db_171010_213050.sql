-- Publications [ent2]
create table "public"."publications" (
   "oid_publication"  int4  not null,
   "title"  varchar(255),
   "venue"  varchar(255),
   "year"  text,
   "pdf_file"  varchar(255),
   "timestamp"  timestamp,
  primary key ("oid_publication")
);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_oid"  int4;
alter table "public"."user"   add constraint fk_user_group_2 foreign key ("group_oid") references "public"."group" ("oid");


-- Comments_Publications [rel10]
alter table "public"."publications"  add column  "comments_oid_comment"  int4;
alter table "public"."publications"   add constraint fk_publications_comments foreign key ("comments_oid_comment") references "public"."comments" ("oid_comment");


-- Own_publications [rel14]
alter table "public"."publications"  add column  "user_oid_user"  int4;
alter table "public"."publications"   add constraint fk_publications_user foreign key ("user_oid_user") references "public"."user" ("oid_user");


