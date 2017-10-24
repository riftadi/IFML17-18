-- REL FK: KeywordsToPublications [rel3#role5]
alter table "public"."keywords_publications"   add constraint fk_keywords_publications_keywo foreign key ("keywords_name") references "public"."keywords" ("name");


-- REL FK: PublicationsToKeywords [rel3#role6]
alter table "public"."keywords_publications"   add constraint fk_keywords_publications_publi foreign key ("publications_oid_publication") references "public"."publications" ("oid_publication");


-- REL FK: KeywordsToUser [rel7#role13]
alter table "public"."keywords_user"   add constraint fk_keywords_user_keywords foreign key ("keywords_name") references "public"."keywords" ("name");


-- REL FK: UserToKeywords [rel7#role14]
alter table "public"."keywords_user"   add constraint fk_keywords_user_user foreign key ("user_oid_user") references "public"."user" ("oid_user");


