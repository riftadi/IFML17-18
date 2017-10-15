-- Notifications [ent1]
alter table "public"."notifications"  add column  "content"  text;


-- Comments_Publications [rel10]
alter table "public"."comments"  add column  "oid_publication"  int4;
alter table "public"."comments"   add constraint fk_comments_publications_2 foreign key ("oid_publication") references "public"."publications" ("oid_publication");


-- Owner_of_comment [rel15]
alter table "public"."comments"  add column  "oid_user"  int4;
alter table "public"."comments"   add constraint fk_comments_user_2 foreign key ("oid_user") references "public"."user" ("oid_user");


