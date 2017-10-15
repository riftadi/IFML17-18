-- Owner_of_comment [rel15]
alter table "public"."comments"   drop constraint "fk_comments_user";
alter table "public"."comments"  drop column  "oid_user";
-- Own_publications [rel14]
alter table "public"."publications"   drop constraint "fk_publications_user";
alter table "public"."publications"  drop column  "user_oid_user";
-- List_of_Authors [rel12]
alter table "public"."list_of_authors"   drop constraint "fk_list_of_authors_user";
alter table "public"."list_of_authors"   drop constraint "fk_list_of_authors_publication";
drop table "public"."list_of_authors";
-- Publications_Keywords [rel11]
alter table "public"."publications_keywords"   drop constraint "fk_publications_keywords_keywo";
alter table "public"."publications_keywords"   drop constraint "fk_publications_keywords_publi";
drop table "public"."publications_keywords";
-- Comments_Publications [rel10]
alter table "public"."comments"   drop constraint "fk_comments_publications";
alter table "public"."comments"  drop column  "oid_publication";
-- Notifications_User [rel1]
alter table "public"."notifications"   drop constraint "fk_notifications_user";
alter table "public"."notifications"  drop column  "user_oid_user";
-- User_Group [User2Group_Group2User]
alter table "public"."user_group"   drop constraint "fk_user_group_group";
alter table "public"."user_group"   drop constraint "fk_user_group_user";
drop table "public"."user_group";
-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"   drop constraint "fk_user_group";
alter table "public"."user"  drop column  "group_oid";
-- Group_Module [Group2Module_Module2Group]
alter table "public"."group_module"   drop constraint "fk_group_module_module";
alter table "public"."group_module"   drop constraint "fk_group_module_group";
drop table "public"."group_module";
-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group"   drop constraint "fk_group_module";
alter table "public"."group"  drop column  "module_oid";
-- Comments [ent5]
drop table "public"."comments";
-- Keywords [ent4]
drop table "public"."keywords";
-- Collections [ent3]
drop table "public"."collections";
-- Publications [ent2]
drop table "public"."publications";
-- Notifications [ent1]
drop table "public"."notifications";
-- User [User]
drop table "public"."user";
-- Module [Module]
drop table "public"."module";
-- Group [Group]
drop table "public"."group";
