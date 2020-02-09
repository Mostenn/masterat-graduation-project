PGDMP     4            	        x            task_manager     11.6 (Ubuntu 11.6-1.pgdg18.04+1)     11.6 (Ubuntu 11.6-1.pgdg18.04+1) J    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    17168    task_manager    DATABASE     ~   CREATE DATABASE task_manager WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'ru_RU.UTF-8' LC_CTYPE = 'ru_RU.UTF-8';
    DROP DATABASE task_manager;
             postgres    false                        2615    17169 	   task_data    SCHEMA        CREATE SCHEMA task_data;
    DROP SCHEMA task_data;
             postgres    false                        2615    17170 	   user_data    SCHEMA        CREATE SCHEMA user_data;
    DROP SCHEMA user_data;
             postgres    false            �            1259    17221    assistants_to_tasks    TABLE     n   CREATE TABLE task_data.assistants_to_tasks (
    assistant_id bigint NOT NULL,
    task_id bigint NOT NULL
);
 *   DROP TABLE task_data.assistants_to_tasks;
    	   task_data         postgres    false    7            �            1259    17217 $   assistants_to_tasks_assistant_id_seq    SEQUENCE     �   CREATE SEQUENCE task_data.assistants_to_tasks_assistant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE task_data.assistants_to_tasks_assistant_id_seq;
    	   task_data       postgres    false    209    7            �           0    0 $   assistants_to_tasks_assistant_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE task_data.assistants_to_tasks_assistant_id_seq OWNED BY task_data.assistants_to_tasks.assistant_id;
         	   task_data       postgres    false    207            �            1259    17219    assistants_to_tasks_task_id_seq    SEQUENCE     �   CREATE SEQUENCE task_data.assistants_to_tasks_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE task_data.assistants_to_tasks_task_id_seq;
    	   task_data       postgres    false    7    209            �           0    0    assistants_to_tasks_task_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE task_data.assistants_to_tasks_task_id_seq OWNED BY task_data.assistants_to_tasks.task_id;
         	   task_data       postgres    false    208            �            1259    17238 
   task_types    TABLE     _   CREATE TABLE task_data.task_types (
    id bigint NOT NULL,
    name character varying(100)
);
 !   DROP TABLE task_data.task_types;
    	   task_data         postgres    false    7            �            1259    17236    task_types_id_seq    SEQUENCE     }   CREATE SEQUENCE task_data.task_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE task_data.task_types_id_seq;
    	   task_data       postgres    false    7    211            �           0    0    task_types_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE task_data.task_types_id_seq OWNED BY task_data.task_types.id;
         	   task_data       postgres    false    210            �            1259    17173    tasks    TABLE       CREATE TABLE task_data.tasks (
    id bigint NOT NULL,
    status integer NOT NULL,
    task_description character varying(400),
    creator bigint NOT NULL,
    executor bigint,
    task_type bigint,
    date_created date NOT NULL,
    date_closed date,
    estimated_date date
);
    DROP TABLE task_data.tasks;
    	   task_data         postgres    false    7            �            1259    17171    tasks_id_seq    SEQUENCE     x   CREATE SEQUENCE task_data.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE task_data.tasks_id_seq;
    	   task_data       postgres    false    7    199            �           0    0    tasks_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE task_data.tasks_id_seq OWNED BY task_data.tasks.id;
         	   task_data       postgres    false    198            �            1259    17248    tasks_to_types    TABLE     d   CREATE TABLE task_data.tasks_to_types (
    task_id bigint NOT NULL,
    type_id bigint NOT NULL
);
 %   DROP TABLE task_data.tasks_to_types;
    	   task_data         postgres    false    7            �            1259    17244    tasks_to_types_task_id_seq    SEQUENCE     �   CREATE SEQUENCE task_data.tasks_to_types_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE task_data.tasks_to_types_task_id_seq;
    	   task_data       postgres    false    214    7            �           0    0    tasks_to_types_task_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE task_data.tasks_to_types_task_id_seq OWNED BY task_data.tasks_to_types.task_id;
         	   task_data       postgres    false    212            �            1259    17246    tasks_to_types_type_id_seq    SEQUENCE     �   CREATE SEQUENCE task_data.tasks_to_types_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE task_data.tasks_to_types_type_id_seq;
    	   task_data       postgres    false    214    7            �           0    0    tasks_to_types_type_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE task_data.tasks_to_types_type_id_seq OWNED BY task_data.tasks_to_types.type_id;
         	   task_data       postgres    false    213            �            1259    17202    tasks_to_users    TABLE     d   CREATE TABLE task_data.tasks_to_users (
    task_id bigint NOT NULL,
    user_id bigint NOT NULL
);
 %   DROP TABLE task_data.tasks_to_users;
    	   task_data         postgres    false    7            �            1259    17198    tasks_to_users_task_id_seq    SEQUENCE     �   CREATE SEQUENCE task_data.tasks_to_users_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE task_data.tasks_to_users_task_id_seq;
    	   task_data       postgres    false    7    206            �           0    0    tasks_to_users_task_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE task_data.tasks_to_users_task_id_seq OWNED BY task_data.tasks_to_users.task_id;
         	   task_data       postgres    false    204            �            1259    17200    tasks_to_users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE task_data.tasks_to_users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE task_data.tasks_to_users_user_id_seq;
    	   task_data       postgres    false    206    7            �           0    0    tasks_to_users_user_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE task_data.tasks_to_users_user_id_seq OWNED BY task_data.tasks_to_users.user_id;
         	   task_data       postgres    false    205            �            1259    17192    departments    TABLE     �   CREATE TABLE user_data.departments (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    phone_value character varying(25),
    additional_phones character varying(100)
);
 "   DROP TABLE user_data.departments;
    	   user_data         postgres    false    6            �            1259    17190    departments_id_seq    SEQUENCE     ~   CREATE SEQUENCE user_data.departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE user_data.departments_id_seq;
    	   user_data       postgres    false    6    203            �           0    0    departments_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE user_data.departments_id_seq OWNED BY user_data.departments.id;
         	   user_data       postgres    false    202            �            1259    17181    users    TABLE     6  CREATE TABLE user_data.users (
    id bigint NOT NULL,
    first_name character varying(80),
    last_name character varying(80),
    department_id character varying(150),
    work_position character varying(150),
    email character varying(100),
    personal_phone character varying(30),
    role integer
);
    DROP TABLE user_data.users;
    	   user_data         postgres    false    6            �            1259    17179    users_id_seq    SEQUENCE     x   CREATE SEQUENCE user_data.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE user_data.users_id_seq;
    	   user_data       postgres    false    6    201            �           0    0    users_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE user_data.users_id_seq OWNED BY user_data.users.id;
         	   user_data       postgres    false    200            �            1259    17263    users_to_departments    TABLE     ^   CREATE TABLE user_data.users_to_departments (
    department_id bigint,
    user_id bigint
);
 +   DROP TABLE user_data.users_to_departments;
    	   user_data         postgres    false    6            )           2604    17224     assistants_to_tasks assistant_id    DEFAULT     �   ALTER TABLE ONLY task_data.assistants_to_tasks ALTER COLUMN assistant_id SET DEFAULT nextval('task_data.assistants_to_tasks_assistant_id_seq'::regclass);
 R   ALTER TABLE task_data.assistants_to_tasks ALTER COLUMN assistant_id DROP DEFAULT;
    	   task_data       postgres    false    209    207    209            *           2604    17225    assistants_to_tasks task_id    DEFAULT     �   ALTER TABLE ONLY task_data.assistants_to_tasks ALTER COLUMN task_id SET DEFAULT nextval('task_data.assistants_to_tasks_task_id_seq'::regclass);
 M   ALTER TABLE task_data.assistants_to_tasks ALTER COLUMN task_id DROP DEFAULT;
    	   task_data       postgres    false    208    209    209            +           2604    17241    task_types id    DEFAULT     t   ALTER TABLE ONLY task_data.task_types ALTER COLUMN id SET DEFAULT nextval('task_data.task_types_id_seq'::regclass);
 ?   ALTER TABLE task_data.task_types ALTER COLUMN id DROP DEFAULT;
    	   task_data       postgres    false    210    211    211            $           2604    17176    tasks id    DEFAULT     j   ALTER TABLE ONLY task_data.tasks ALTER COLUMN id SET DEFAULT nextval('task_data.tasks_id_seq'::regclass);
 :   ALTER TABLE task_data.tasks ALTER COLUMN id DROP DEFAULT;
    	   task_data       postgres    false    198    199    199            ,           2604    17251    tasks_to_types task_id    DEFAULT     �   ALTER TABLE ONLY task_data.tasks_to_types ALTER COLUMN task_id SET DEFAULT nextval('task_data.tasks_to_types_task_id_seq'::regclass);
 H   ALTER TABLE task_data.tasks_to_types ALTER COLUMN task_id DROP DEFAULT;
    	   task_data       postgres    false    212    214    214            -           2604    17252    tasks_to_types type_id    DEFAULT     �   ALTER TABLE ONLY task_data.tasks_to_types ALTER COLUMN type_id SET DEFAULT nextval('task_data.tasks_to_types_type_id_seq'::regclass);
 H   ALTER TABLE task_data.tasks_to_types ALTER COLUMN type_id DROP DEFAULT;
    	   task_data       postgres    false    214    213    214            '           2604    17205    tasks_to_users task_id    DEFAULT     �   ALTER TABLE ONLY task_data.tasks_to_users ALTER COLUMN task_id SET DEFAULT nextval('task_data.tasks_to_users_task_id_seq'::regclass);
 H   ALTER TABLE task_data.tasks_to_users ALTER COLUMN task_id DROP DEFAULT;
    	   task_data       postgres    false    206    204    206            (           2604    17206    tasks_to_users user_id    DEFAULT     �   ALTER TABLE ONLY task_data.tasks_to_users ALTER COLUMN user_id SET DEFAULT nextval('task_data.tasks_to_users_user_id_seq'::regclass);
 H   ALTER TABLE task_data.tasks_to_users ALTER COLUMN user_id DROP DEFAULT;
    	   task_data       postgres    false    206    205    206            &           2604    17195    departments id    DEFAULT     v   ALTER TABLE ONLY user_data.departments ALTER COLUMN id SET DEFAULT nextval('user_data.departments_id_seq'::regclass);
 @   ALTER TABLE user_data.departments ALTER COLUMN id DROP DEFAULT;
    	   user_data       postgres    false    203    202    203            %           2604    17184    users id    DEFAULT     j   ALTER TABLE ONLY user_data.users ALTER COLUMN id SET DEFAULT nextval('user_data.users_id_seq'::regclass);
 :   ALTER TABLE user_data.users ALTER COLUMN id DROP DEFAULT;
    	   user_data       postgres    false    200    201    201            �          0    17221    assistants_to_tasks 
   TABLE DATA               G   COPY task_data.assistants_to_tasks (assistant_id, task_id) FROM stdin;
 	   task_data       postgres    false    209   �V       �          0    17238 
   task_types 
   TABLE DATA               1   COPY task_data.task_types (id, name) FROM stdin;
 	   task_data       postgres    false    211   �V       �          0    17173    tasks 
   TABLE DATA               �   COPY task_data.tasks (id, status, task_description, creator, executor, task_type, date_created, date_closed, estimated_date) FROM stdin;
 	   task_data       postgres    false    199   �V       �          0    17248    tasks_to_types 
   TABLE DATA               =   COPY task_data.tasks_to_types (task_id, type_id) FROM stdin;
 	   task_data       postgres    false    214   �V       �          0    17202    tasks_to_users 
   TABLE DATA               =   COPY task_data.tasks_to_users (task_id, user_id) FROM stdin;
 	   task_data       postgres    false    206   W       �          0    17192    departments 
   TABLE DATA               R   COPY user_data.departments (id, name, phone_value, additional_phones) FROM stdin;
 	   user_data       postgres    false    203   9W       �          0    17181    users 
   TABLE DATA               x   COPY user_data.users (id, first_name, last_name, department_id, work_position, email, personal_phone, role) FROM stdin;
 	   user_data       postgres    false    201   VW       �          0    17263    users_to_departments 
   TABLE DATA               I   COPY user_data.users_to_departments (department_id, user_id) FROM stdin;
 	   user_data       postgres    false    215   sW       �           0    0 $   assistants_to_tasks_assistant_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('task_data.assistants_to_tasks_assistant_id_seq', 1, false);
         	   task_data       postgres    false    207            �           0    0    assistants_to_tasks_task_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('task_data.assistants_to_tasks_task_id_seq', 1, false);
         	   task_data       postgres    false    208            �           0    0    task_types_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('task_data.task_types_id_seq', 1, false);
         	   task_data       postgres    false    210            �           0    0    tasks_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('task_data.tasks_id_seq', 1, false);
         	   task_data       postgres    false    198            �           0    0    tasks_to_types_task_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('task_data.tasks_to_types_task_id_seq', 1, false);
         	   task_data       postgres    false    212            �           0    0    tasks_to_types_type_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('task_data.tasks_to_types_type_id_seq', 1, false);
         	   task_data       postgres    false    213            �           0    0    tasks_to_users_task_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('task_data.tasks_to_users_task_id_seq', 1, false);
         	   task_data       postgres    false    204            �           0    0    tasks_to_users_user_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('task_data.tasks_to_users_user_id_seq', 1, false);
         	   task_data       postgres    false    205            �           0    0    departments_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('user_data.departments_id_seq', 1, false);
         	   user_data       postgres    false    202            �           0    0    users_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('user_data.users_id_seq', 1, false);
         	   user_data       postgres    false    200            5           2606    17243    task_types task_types_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY task_data.task_types
    ADD CONSTRAINT task_types_pk PRIMARY KEY (id);
 E   ALTER TABLE ONLY task_data.task_types DROP CONSTRAINT task_types_pk;
    	   task_data         postgres    false    211            /           2606    17178    tasks tasks_pk 
   CONSTRAINT     O   ALTER TABLE ONLY task_data.tasks
    ADD CONSTRAINT tasks_pk PRIMARY KEY (id);
 ;   ALTER TABLE ONLY task_data.tasks DROP CONSTRAINT tasks_pk;
    	   task_data         postgres    false    199            3           2606    17197    departments departments_pk 
   CONSTRAINT     [   ALTER TABLE ONLY user_data.departments
    ADD CONSTRAINT departments_pk PRIMARY KEY (id);
 G   ALTER TABLE ONLY user_data.departments DROP CONSTRAINT departments_pk;
    	   user_data         postgres    false    203            1           2606    17189    users users_pk 
   CONSTRAINT     O   ALTER TABLE ONLY user_data.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);
 ;   ALTER TABLE ONLY user_data.users DROP CONSTRAINT users_pk;
    	   user_data         postgres    false    201            8           2606    17226 9   assistants_to_tasks assistants_to_tasks_assistant_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY task_data.assistants_to_tasks
    ADD CONSTRAINT assistants_to_tasks_assistant_id_fkey FOREIGN KEY (assistant_id) REFERENCES user_data.users(id);
 f   ALTER TABLE ONLY task_data.assistants_to_tasks DROP CONSTRAINT assistants_to_tasks_assistant_id_fkey;
    	   task_data       postgres    false    2865    209    201            9           2606    17231 4   assistants_to_tasks assistants_to_tasks_task_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY task_data.assistants_to_tasks
    ADD CONSTRAINT assistants_to_tasks_task_id_fkey FOREIGN KEY (task_id) REFERENCES task_data.tasks(id);
 a   ALTER TABLE ONLY task_data.assistants_to_tasks DROP CONSTRAINT assistants_to_tasks_task_id_fkey;
    	   task_data       postgres    false    209    2863    199            :           2606    17253 *   tasks_to_types tasks_to_types_task_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY task_data.tasks_to_types
    ADD CONSTRAINT tasks_to_types_task_id_fkey FOREIGN KEY (task_id) REFERENCES task_data.tasks(id);
 W   ALTER TABLE ONLY task_data.tasks_to_types DROP CONSTRAINT tasks_to_types_task_id_fkey;
    	   task_data       postgres    false    2863    214    199            ;           2606    17258 *   tasks_to_types tasks_to_types_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY task_data.tasks_to_types
    ADD CONSTRAINT tasks_to_types_type_id_fkey FOREIGN KEY (type_id) REFERENCES task_data.task_types(id);
 W   ALTER TABLE ONLY task_data.tasks_to_types DROP CONSTRAINT tasks_to_types_type_id_fkey;
    	   task_data       postgres    false    214    211    2869            6           2606    17207 *   tasks_to_users tasks_to_users_task_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY task_data.tasks_to_users
    ADD CONSTRAINT tasks_to_users_task_id_fkey FOREIGN KEY (task_id) REFERENCES task_data.tasks(id);
 W   ALTER TABLE ONLY task_data.tasks_to_users DROP CONSTRAINT tasks_to_users_task_id_fkey;
    	   task_data       postgres    false    206    2863    199            7           2606    17212 *   tasks_to_users tasks_to_users_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY task_data.tasks_to_users
    ADD CONSTRAINT tasks_to_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_data.users(id);
 W   ALTER TABLE ONLY task_data.tasks_to_users DROP CONSTRAINT tasks_to_users_user_id_fkey;
    	   task_data       postgres    false    2865    201    206            <           2606    17266 <   users_to_departments users_to_departments_department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY user_data.users_to_departments
    ADD CONSTRAINT users_to_departments_department_id_fkey FOREIGN KEY (department_id) REFERENCES user_data.departments(id);
 i   ALTER TABLE ONLY user_data.users_to_departments DROP CONSTRAINT users_to_departments_department_id_fkey;
    	   user_data       postgres    false    2867    203    215            =           2606    17271 6   users_to_departments users_to_departments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY user_data.users_to_departments
    ADD CONSTRAINT users_to_departments_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_data.users(id);
 c   ALTER TABLE ONLY user_data.users_to_departments DROP CONSTRAINT users_to_departments_user_id_fkey;
    	   user_data       postgres    false    201    215    2865            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     