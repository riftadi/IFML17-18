PGDMP     8    9            	    u           ifml1718    9.6.5    10.0 O    �	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �	           1262    17835    ifml1718    DATABASE     z   CREATE DATABASE ifml1718 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE ifml1718;
             riftadi    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12655    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    18015    collections    TABLE     �   CREATE TABLE collections (
    oid_collection integer NOT NULL,
    title character varying(255),
    description character varying(255),
    "timestamp" timestamp without time zone,
    user_oid_user integer
);
    DROP TABLE public.collections;
       public         riftadi    false    3            �            1259    18181    collections_keywords    TABLE     �   CREATE TABLE collections_keywords (
    collections_oid_collection integer NOT NULL,
    keywords_oid_keyword integer NOT NULL
);
 (   DROP TABLE public.collections_keywords;
       public         riftadi    false    3            �            1259    18166    collections_publications    TABLE     �   CREATE TABLE collections_publications (
    collections_oid_collection integer NOT NULL,
    publications_oid_publication integer NOT NULL
);
 ,   DROP TABLE public.collections_publications;
       public         riftadi    false    3            �            1259    18146    collections_user    TABLE     w   CREATE TABLE collections_user (
    collections_oid_collection integer NOT NULL,
    user_oid_user integer NOT NULL
);
 $   DROP TABLE public.collections_user;
       public         riftadi    false    3            �            1259    18028    comments    TABLE     �   CREATE TABLE comments (
    oid_comment integer NOT NULL,
    title character varying(255),
    content text,
    "timestamp" timestamp without time zone,
    oid_publication integer,
    oid_user integer
);
    DROP TABLE public.comments;
       public         riftadi    false    3            �            1259    17981    group    TABLE     q   CREATE TABLE "group" (
    oid integer NOT NULL,
    groupname character varying(255),
    module_oid integer
);
    DROP TABLE public."group";
       public         riftadi    false    3            �            1259    18041    group_module    TABLE     _   CREATE TABLE group_module (
    group_oid integer NOT NULL,
    module_oid integer NOT NULL
);
     DROP TABLE public.group_module;
       public         riftadi    false    3            �            1259    18023    keywords    TABLE     �   CREATE TABLE keywords (
    oid_keyword integer NOT NULL,
    name character varying(255),
    "timestamp" timestamp without time zone
);
    DROP TABLE public.keywords;
       public         riftadi    false    3            �            1259    18101    list_of_authors    TABLE     x   CREATE TABLE list_of_authors (
    publications_oid_publication integer NOT NULL,
    user_oid_user integer NOT NULL
);
 #   DROP TABLE public.list_of_authors;
       public         riftadi    false    3            �            1259    17986    module    TABLE     ~   CREATE TABLE module (
    oid integer NOT NULL,
    moduleid character varying(255),
    modulename character varying(255)
);
    DROP TABLE public.module;
       public         riftadi    false    3            �            1259    18002    notifications    TABLE     �   CREATE TABLE notifications (
    notification_oid integer NOT NULL,
    "timestamp" timestamp without time zone,
    isprocessed boolean,
    user_oid_user integer,
    publications_oid_publication integer,
    content text
);
 !   DROP TABLE public.notifications;
       public         riftadi    false    3            �            1259    18007    publications    TABLE     .  CREATE TABLE publications (
    oid_publication integer NOT NULL,
    title character varying(255),
    venue character varying(255),
    year text,
    pdf_file character varying(255),
    "timestamp" timestamp without time zone,
    abstract text,
    isclaimed boolean,
    user_oid_user integer
);
     DROP TABLE public.publications;
       public         riftadi    false    3            �            1259    18086    publications_keywords    TABLE     �   CREATE TABLE publications_keywords (
    publications_oid_publication integer NOT NULL,
    keywords_oid_keyword integer NOT NULL
);
 )   DROP TABLE public.publications_keywords;
       public         riftadi    false    3            �            1259    17994    user    TABLE     i  CREATE TABLE "user" (
    oid_user integer NOT NULL,
    username character varying(255),
    password character varying(255),
    email character varying(255),
    name character varying(255),
    affiliation character varying(255),
    "timestamp" timestamp without time zone,
    reputation double precision,
    group_oid integer,
    isexternal integer
);
    DROP TABLE public."user";
       public         riftadi    false    3            �            1259    18061 
   user_group    TABLE     [   CREATE TABLE user_group (
    user_oid integer NOT NULL,
    group_oid integer NOT NULL
);
    DROP TABLE public.user_group;
       public         riftadi    false    3            �            1259    18126    user_keywords    TABLE     n   CREATE TABLE user_keywords (
    user_oid_user integer NOT NULL,
    keywords_oid_keyword integer NOT NULL
);
 !   DROP TABLE public.user_keywords;
       public         riftadi    false    3            �	          0    18015    collections 
   TABLE DATA               ^   COPY collections (oid_collection, title, description, "timestamp", user_oid_user) FROM stdin;
    public       riftadi    false    190   �c       �	          0    18181    collections_keywords 
   TABLE DATA               Y   COPY collections_keywords (collections_oid_collection, keywords_oid_keyword) FROM stdin;
    public       riftadi    false    200   xd       �	          0    18166    collections_publications 
   TABLE DATA               e   COPY collections_publications (collections_oid_collection, publications_oid_publication) FROM stdin;
    public       riftadi    false    199   �d       �	          0    18146    collections_user 
   TABLE DATA               N   COPY collections_user (collections_oid_collection, user_oid_user) FROM stdin;
    public       riftadi    false    198   �d       �	          0    18028    comments 
   TABLE DATA               `   COPY comments (oid_comment, title, content, "timestamp", oid_publication, oid_user) FROM stdin;
    public       riftadi    false    192   �d       �	          0    17981    group 
   TABLE DATA               6   COPY "group" (oid, groupname, module_oid) FROM stdin;
    public       riftadi    false    185   �e       �	          0    18041    group_module 
   TABLE DATA               6   COPY group_module (group_oid, module_oid) FROM stdin;
    public       riftadi    false    193   �e       �	          0    18023    keywords 
   TABLE DATA               ;   COPY keywords (oid_keyword, name, "timestamp") FROM stdin;
    public       riftadi    false    191   �e       �	          0    18101    list_of_authors 
   TABLE DATA               O   COPY list_of_authors (publications_oid_publication, user_oid_user) FROM stdin;
    public       riftadi    false    196   vf       �	          0    17986    module 
   TABLE DATA               4   COPY module (oid, moduleid, modulename) FROM stdin;
    public       riftadi    false    186   �f       �	          0    18002    notifications 
   TABLE DATA               �   COPY notifications (notification_oid, "timestamp", isprocessed, user_oid_user, publications_oid_publication, content) FROM stdin;
    public       riftadi    false    188   g       �	          0    18007    publications 
   TABLE DATA                  COPY publications (oid_publication, title, venue, year, pdf_file, "timestamp", abstract, isclaimed, user_oid_user) FROM stdin;
    public       riftadi    false    189   �g       �	          0    18086    publications_keywords 
   TABLE DATA               \   COPY publications_keywords (publications_oid_publication, keywords_oid_keyword) FROM stdin;
    public       riftadi    false    195   �h       �	          0    17994    user 
   TABLE DATA               �   COPY "user" (oid_user, username, password, email, name, affiliation, "timestamp", reputation, group_oid, isexternal) FROM stdin;
    public       riftadi    false    187   )i       �	          0    18061 
   user_group 
   TABLE DATA               2   COPY user_group (user_oid, group_oid) FROM stdin;
    public       riftadi    false    194   �i       �	          0    18126    user_keywords 
   TABLE DATA               E   COPY user_keywords (user_oid_user, keywords_oid_keyword) FROM stdin;
    public       riftadi    false    197   j       :	           2606    18185 .   collections_keywords collections_keywords_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY collections_keywords
    ADD CONSTRAINT collections_keywords_pkey PRIMARY KEY (collections_oid_collection, keywords_oid_keyword);
 X   ALTER TABLE ONLY public.collections_keywords DROP CONSTRAINT collections_keywords_pkey;
       public         riftadi    false    200    200            &	           2606    18022    collections collections_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (oid_collection);
 F   ALTER TABLE ONLY public.collections DROP CONSTRAINT collections_pkey;
       public         riftadi    false    190            8	           2606    18170 6   collections_publications collections_publications_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY collections_publications
    ADD CONSTRAINT collections_publications_pkey PRIMARY KEY (collections_oid_collection, publications_oid_publication);
 `   ALTER TABLE ONLY public.collections_publications DROP CONSTRAINT collections_publications_pkey;
       public         riftadi    false    199    199            6	           2606    18150 &   collections_user collections_user_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY collections_user
    ADD CONSTRAINT collections_user_pkey PRIMARY KEY (collections_oid_collection, user_oid_user);
 P   ALTER TABLE ONLY public.collections_user DROP CONSTRAINT collections_user_pkey;
       public         riftadi    false    198    198            *	           2606    18035    comments comments_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (oid_comment);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public         riftadi    false    192            ,	           2606    18045    group_module group_module_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY group_module
    ADD CONSTRAINT group_module_pkey PRIMARY KEY (group_oid, module_oid);
 H   ALTER TABLE ONLY public.group_module DROP CONSTRAINT group_module_pkey;
       public         riftadi    false    193    193            	           2606    17985    group group_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY "group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (oid);
 <   ALTER TABLE ONLY public."group" DROP CONSTRAINT group_pkey;
       public         riftadi    false    185            (	           2606    18027    keywords keywords_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY keywords
    ADD CONSTRAINT keywords_pkey PRIMARY KEY (oid_keyword);
 @   ALTER TABLE ONLY public.keywords DROP CONSTRAINT keywords_pkey;
       public         riftadi    false    191            2	           2606    18105 $   list_of_authors list_of_authors_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY list_of_authors
    ADD CONSTRAINT list_of_authors_pkey PRIMARY KEY (publications_oid_publication, user_oid_user);
 N   ALTER TABLE ONLY public.list_of_authors DROP CONSTRAINT list_of_authors_pkey;
       public         riftadi    false    196    196            	           2606    17993    module module_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY module
    ADD CONSTRAINT module_pkey PRIMARY KEY (oid);
 <   ALTER TABLE ONLY public.module DROP CONSTRAINT module_pkey;
       public         riftadi    false    186            "	           2606    18006     notifications notifications_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_oid);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public         riftadi    false    188            0	           2606    18090 0   publications_keywords publications_keywords_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY publications_keywords
    ADD CONSTRAINT publications_keywords_pkey PRIMARY KEY (publications_oid_publication, keywords_oid_keyword);
 Z   ALTER TABLE ONLY public.publications_keywords DROP CONSTRAINT publications_keywords_pkey;
       public         riftadi    false    195    195            $	           2606    18014    publications publications_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (oid_publication);
 H   ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_pkey;
       public         riftadi    false    189            .	           2606    18065    user_group user_group_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (user_oid, group_oid);
 D   ALTER TABLE ONLY public.user_group DROP CONSTRAINT user_group_pkey;
       public         riftadi    false    194    194            4	           2606    18130     user_keywords user_keywords_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY user_keywords
    ADD CONSTRAINT user_keywords_pkey PRIMARY KEY (user_oid_user, keywords_oid_keyword);
 J   ALTER TABLE ONLY public.user_keywords DROP CONSTRAINT user_keywords_pkey;
       public         riftadi    false    197    197             	           2606    18001    user user_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (oid_user);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         riftadi    false    187            Q	           2606    18186 3   collections_keywords fk_collections_keywords_collec    FK CONSTRAINT     �   ALTER TABLE ONLY collections_keywords
    ADD CONSTRAINT fk_collections_keywords_collec FOREIGN KEY (collections_oid_collection) REFERENCES collections(oid_collection);
 ]   ALTER TABLE ONLY public.collections_keywords DROP CONSTRAINT fk_collections_keywords_collec;
       public       riftadi    false    200    190    2342            R	           2606    18191 3   collections_keywords fk_collections_keywords_keywor    FK CONSTRAINT     �   ALTER TABLE ONLY collections_keywords
    ADD CONSTRAINT fk_collections_keywords_keywor FOREIGN KEY (keywords_oid_keyword) REFERENCES keywords(oid_keyword);
 ]   ALTER TABLE ONLY public.collections_keywords DROP CONSTRAINT fk_collections_keywords_keywor;
       public       riftadi    false    2344    191    200            O	           2606    18171 7   collections_publications fk_collections_publications_co    FK CONSTRAINT     �   ALTER TABLE ONLY collections_publications
    ADD CONSTRAINT fk_collections_publications_co FOREIGN KEY (collections_oid_collection) REFERENCES collections(oid_collection);
 a   ALTER TABLE ONLY public.collections_publications DROP CONSTRAINT fk_collections_publications_co;
       public       riftadi    false    199    190    2342            P	           2606    18176 7   collections_publications fk_collections_publications_pu    FK CONSTRAINT     �   ALTER TABLE ONLY collections_publications
    ADD CONSTRAINT fk_collections_publications_pu FOREIGN KEY (publications_oid_publication) REFERENCES publications(oid_publication);
 a   ALTER TABLE ONLY public.collections_publications DROP CONSTRAINT fk_collections_publications_pu;
       public       riftadi    false    199    189    2340            @	           2606    18161    collections fk_collections_user    FK CONSTRAINT     }   ALTER TABLE ONLY collections
    ADD CONSTRAINT fk_collections_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);
 I   ALTER TABLE ONLY public.collections DROP CONSTRAINT fk_collections_user;
       public       riftadi    false    190    187    2336            M	           2606    18151 /   collections_user fk_collections_user_collection    FK CONSTRAINT     �   ALTER TABLE ONLY collections_user
    ADD CONSTRAINT fk_collections_user_collection FOREIGN KEY (collections_oid_collection) REFERENCES collections(oid_collection);
 Y   ALTER TABLE ONLY public.collections_user DROP CONSTRAINT fk_collections_user_collection;
       public       riftadi    false    198    190    2342            N	           2606    18156 )   collections_user fk_collections_user_user    FK CONSTRAINT     �   ALTER TABLE ONLY collections_user
    ADD CONSTRAINT fk_collections_user_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);
 S   ALTER TABLE ONLY public.collections_user DROP CONSTRAINT fk_collections_user_user;
       public       riftadi    false    198    187    2336            A	           2606    18081 !   comments fk_comments_publications    FK CONSTRAINT     �   ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_comments_publications FOREIGN KEY (oid_publication) REFERENCES publications(oid_publication);
 K   ALTER TABLE ONLY public.comments DROP CONSTRAINT fk_comments_publications;
       public       riftadi    false    2340    189    192            B	           2606    18121    comments fk_comments_user    FK CONSTRAINT     r   ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_comments_user FOREIGN KEY (oid_user) REFERENCES "user"(oid_user);
 C   ALTER TABLE ONLY public.comments DROP CONSTRAINT fk_comments_user;
       public       riftadi    false    187    2336    192            ;	           2606    18036    group fk_group_module    FK CONSTRAINT     m   ALTER TABLE ONLY "group"
    ADD CONSTRAINT fk_group_module FOREIGN KEY (module_oid) REFERENCES module(oid);
 A   ALTER TABLE ONLY public."group" DROP CONSTRAINT fk_group_module;
       public       riftadi    false    2334    186    185            C	           2606    18046 "   group_module fk_group_module_group    FK CONSTRAINT     x   ALTER TABLE ONLY group_module
    ADD CONSTRAINT fk_group_module_group FOREIGN KEY (group_oid) REFERENCES "group"(oid);
 L   ALTER TABLE ONLY public.group_module DROP CONSTRAINT fk_group_module_group;
       public       riftadi    false    185    2332    193            D	           2606    18051 #   group_module fk_group_module_module    FK CONSTRAINT     y   ALTER TABLE ONLY group_module
    ADD CONSTRAINT fk_group_module_module FOREIGN KEY (module_oid) REFERENCES module(oid);
 M   ALTER TABLE ONLY public.group_module DROP CONSTRAINT fk_group_module_module;
       public       riftadi    false    2334    193    186            I	           2606    18106 .   list_of_authors fk_list_of_authors_publication    FK CONSTRAINT     �   ALTER TABLE ONLY list_of_authors
    ADD CONSTRAINT fk_list_of_authors_publication FOREIGN KEY (publications_oid_publication) REFERENCES publications(oid_publication);
 X   ALTER TABLE ONLY public.list_of_authors DROP CONSTRAINT fk_list_of_authors_publication;
       public       riftadi    false    196    189    2340            J	           2606    18111 '   list_of_authors fk_list_of_authors_user    FK CONSTRAINT     �   ALTER TABLE ONLY list_of_authors
    ADD CONSTRAINT fk_list_of_authors_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);
 Q   ALTER TABLE ONLY public.list_of_authors DROP CONSTRAINT fk_list_of_authors_user;
       public       riftadi    false    196    2336    187            >	           2606    18141 +   notifications fk_notifications_publications    FK CONSTRAINT     �   ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_notifications_publications FOREIGN KEY (publications_oid_publication) REFERENCES publications(oid_publication);
 U   ALTER TABLE ONLY public.notifications DROP CONSTRAINT fk_notifications_publications;
       public       riftadi    false    189    2340    188            =	           2606    18076 #   notifications fk_notifications_user    FK CONSTRAINT     �   ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_notifications_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);
 M   ALTER TABLE ONLY public.notifications DROP CONSTRAINT fk_notifications_user;
       public       riftadi    false    188    2336    187            H	           2606    18096 4   publications_keywords fk_publications_keywords_keywo    FK CONSTRAINT     �   ALTER TABLE ONLY publications_keywords
    ADD CONSTRAINT fk_publications_keywords_keywo FOREIGN KEY (keywords_oid_keyword) REFERENCES keywords(oid_keyword);
 ^   ALTER TABLE ONLY public.publications_keywords DROP CONSTRAINT fk_publications_keywords_keywo;
       public       riftadi    false    191    2344    195            G	           2606    18091 4   publications_keywords fk_publications_keywords_publi    FK CONSTRAINT     �   ALTER TABLE ONLY publications_keywords
    ADD CONSTRAINT fk_publications_keywords_publi FOREIGN KEY (publications_oid_publication) REFERENCES publications(oid_publication);
 ^   ALTER TABLE ONLY public.publications_keywords DROP CONSTRAINT fk_publications_keywords_publi;
       public       riftadi    false    195    2340    189            ?	           2606    18116 !   publications fk_publications_user    FK CONSTRAINT        ALTER TABLE ONLY publications
    ADD CONSTRAINT fk_publications_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);
 K   ALTER TABLE ONLY public.publications DROP CONSTRAINT fk_publications_user;
       public       riftadi    false    187    2336    189            <	           2606    18056    user fk_user_group    FK CONSTRAINT     j   ALTER TABLE ONLY "user"
    ADD CONSTRAINT fk_user_group FOREIGN KEY (group_oid) REFERENCES "group"(oid);
 >   ALTER TABLE ONLY public."user" DROP CONSTRAINT fk_user_group;
       public       riftadi    false    2332    185    187            F	           2606    18071    user_group fk_user_group_group    FK CONSTRAINT     t   ALTER TABLE ONLY user_group
    ADD CONSTRAINT fk_user_group_group FOREIGN KEY (group_oid) REFERENCES "group"(oid);
 H   ALTER TABLE ONLY public.user_group DROP CONSTRAINT fk_user_group_group;
       public       riftadi    false    185    2332    194            E	           2606    18066    user_group fk_user_group_user    FK CONSTRAINT     v   ALTER TABLE ONLY user_group
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_oid) REFERENCES "user"(oid_user);
 G   ALTER TABLE ONLY public.user_group DROP CONSTRAINT fk_user_group_user;
       public       riftadi    false    194    187    2336            L	           2606    18136 '   user_keywords fk_user_keywords_keywords    FK CONSTRAINT     �   ALTER TABLE ONLY user_keywords
    ADD CONSTRAINT fk_user_keywords_keywords FOREIGN KEY (keywords_oid_keyword) REFERENCES keywords(oid_keyword);
 Q   ALTER TABLE ONLY public.user_keywords DROP CONSTRAINT fk_user_keywords_keywords;
       public       riftadi    false    2344    191    197            K	           2606    18131 #   user_keywords fk_user_keywords_user    FK CONSTRAINT     �   ALTER TABLE ONLY user_keywords
    ADD CONSTRAINT fk_user_keywords_user FOREIGN KEY (user_oid_user) REFERENCES "user"(oid_user);
 M   ALTER TABLE ONLY public.user_keywords DROP CONSTRAINT fk_user_keywords_user;
       public       riftadi    false    2336    197    187            �	   z   x�3�t�,*.Qp���IM.��σ
$�(������p����*Y�Y��!�gHjq��z��S*�I��
E�ə���
�a�iFF
F�V&V�z�Ff�F\1z\\\ ��)T      �	      x�3�4�2�4����� ��      �	      x������ � �      �	      x�3�4�2�4����� ��      �	   �   x�}��
�0�s��}vM�E�n�ݼ�-��h}��c�1��e�n�5k�اFo��q3x�1 5�����1�Xe(3"@�s��U��d�Ӿz�L�}1{z~��&B�cv�e�Ԉ�P(E���k-�BHZ�=l���3G ���T��x'8�o�<�      �	   .   x�3�,J-NM,J�H-�4�2�LL����,.)J,�/�4����� ��L      �	      x�3�4�2�4����� ��      �	   r   x�]�1�  ����!�[� d%�Z�����:t�K����&�.m���0������2"����Z ݳ�)���~�S/��q[�	�5�S�i����G=F��y�+� |j#n      �	   :   x�-��  ��tԻ˰����#�R�y		˧�ܣ˚�)�)�)	���'g����      �	   2   x�3�,.3�tL����,.)J,����2
q��&%g�q��qqq 3E      �	   �   x���M�0���)�6�B�p���M�!4�Vˠ��ˏ\���L����Q���Z����@����POLTO���9ZQ��';����ּ�B;�"��mP�l\d%\��w�e��(�0��I �D]�L�~�e:{'���Ka'�Bt�m�t�hd%�/Ϥ(1S&+�:��</JJ��x      �	     x���KN�@�s�\���yt2��@l� �͔d�HQ�q�AT��^X��߄�˩k?�ܞ����������2w�;�9Q�E�Byfdq������%�2E��2B���k��r[�sШ4��Wi�I$�ᵟ뱞�o��AJ�\<�����0���i8�c�C-�޺�~$�)��)�U�b���(�Y[�ǌ������I�"��a9Yk��K����X�*5k�fS��"��+�_q���ٯ��1�oC�@N��߿�1(+U�e�?�;      �	   2   x�340�4�240�4�`�,bfCIc i&M�"f`�9Pe� m	�      �	   �   x�m��
�0Dϛ���c4�
�����K�@����W�J�����zOk=��mŴ�w'(�#�D��PsD��F��(�@�d�7�g�%ml&��2����<����]�^����AO�"S!p��p�'Kh�:�&K�"RB?�\�օv��׏{����6NEJI�txl�U�1�`]�      �	      x������ � �      �	      x�3�4�2b#N#�=... *     