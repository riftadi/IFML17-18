-- Notifications [ent1]
create table "public"."notifications" (
   "notification_oid"  int4  not null,
   "timestamp"  timestamp,
   "isprocessed"  bool,
  primary key ("notification_oid")
);


-- Publications [ent2]
alter table "public"."publications"  add column  "isclaimed"  bool;
alter table "public"."publications"  add column  "abstract"  text;


-- Notifications_User [rel1]
alter table "public"."notifications"  add column  "user_oid_user"  int4;
alter table "public"."notifications"   add constraint fk_notifications_user foreign key ("user_oid_user") references "public"."user" ("oid_user");


-- Notifications_Publications [rel2]
alter table "public"."notifications"  add column  "publications_oid_publication"  int4;
alter table "public"."notifications"   add constraint fk_notifications_publications foreign key ("publications_oid_publication") references "public"."publications" ("oid_publication");


-- REL FK: PublicationsToKeywords [rel11#role21]
alter table "public"."publications_keywords"   add constraint fk_publications_keywords_publi foreign key ("publications_oid_publication") references "public"."publications" ("oid_publication");


-- REL FK: PublicationAuthor [rel12#role23]
alter table "public"."list_of_authors"   add constraint fk_list_of_authors_publication foreign key ("publications_oid_publication") references "public"."publications" ("oid_publication");


-- REL FK: PublicationsToCollections [rel4#role8]
alter table "public"."collections_publications"   add constraint fk_collections_publications_pu foreign key ("publications_oid_publication") references "public"."publications" ("oid_publication");


