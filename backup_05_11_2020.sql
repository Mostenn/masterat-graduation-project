PGDMP     4                     x           task_manager    11.4    11.3 U    i           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            j           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            k           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            l           1262    40195    task_manager    DATABASE     �   CREATE DATABASE task_manager WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE task_manager;
             postgres    false                        2615    40196 	   task_data    SCHEMA        CREATE SCHEMA task_data;
    DROP SCHEMA task_data;
             postgres    false                        2615    40197 	   user_data    SCHEMA        CREATE SCHEMA user_data;
    DROP SCHEMA user_data;
             postgres    false            �            1259    40198    tasks_to_users    TABLE     a   CREATE TABLE public.tasks_to_users (
    task_id bigint NOT NULL,
    user_id bigint NOT NULL
);
 "   DROP TABLE public.tasks_to_users;
       public         postgres    false            �            1259    40201    users_to_departments    TABLE     m   CREATE TABLE public.users_to_departments (
    department_id bigint NOT NULL,
    user_id bigint NOT NULL
);
 (   DROP TABLE public.users_to_departments;
       public         postgres    false            �            1259    40204    assistants_to_tasks    TABLE     n   CREATE TABLE task_data.assistants_to_tasks (
    assistant_id bigint NOT NULL,
    task_id bigint NOT NULL
);
 *   DROP TABLE task_data.assistants_to_tasks;
    	   task_data         postgres    false    8            �            1259    40207 $   assistants_to_tasks_assistant_id_seq    SEQUENCE     �   CREATE SEQUENCE task_data.assistants_to_tasks_assistant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE task_data.assistants_to_tasks_assistant_id_seq;
    	   task_data       postgres    false    8    200            m           0    0 $   assistants_to_tasks_assistant_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE task_data.assistants_to_tasks_assistant_id_seq OWNED BY task_data.assistants_to_tasks.assistant_id;
         	   task_data       postgres    false    201            �            1259    40209    assistants_to_tasks_task_id_seq    SEQUENCE     �   CREATE SEQUENCE task_data.assistants_to_tasks_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE task_data.assistants_to_tasks_task_id_seq;
    	   task_data       postgres    false    200    8            n           0    0    assistants_to_tasks_task_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE task_data.assistants_to_tasks_task_id_seq OWNED BY task_data.assistants_to_tasks.task_id;
         	   task_data       postgres    false    202            �            1259    40211    task_status    TABLE     �   CREATE TABLE task_data.task_status (
    id bigint NOT NULL,
    title character varying(50) NOT NULL,
    color character varying(15)
);
 "   DROP TABLE task_data.task_status;
    	   task_data         postgres    false    8            �            1259    40214    task_statuses_id_seq    SEQUENCE     �   CREATE SEQUENCE task_data.task_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE task_data.task_statuses_id_seq;
    	   task_data       postgres    false    8    203            o           0    0    task_statuses_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE task_data.task_statuses_id_seq OWNED BY task_data.task_status.id;
         	   task_data       postgres    false    204            �            1259    40216 
   task_types    TABLE     _   CREATE TABLE task_data.task_types (
    id bigint NOT NULL,
    name character varying(100)
);
 !   DROP TABLE task_data.task_types;
    	   task_data         postgres    false    8            �            1259    40219    task_types_id_seq    SEQUENCE     }   CREATE SEQUENCE task_data.task_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE task_data.task_types_id_seq;
    	   task_data       postgres    false    205    8            p           0    0    task_types_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE task_data.task_types_id_seq OWNED BY task_data.task_types.id;
         	   task_data       postgres    false    206            �            1259    40221    tasks    TABLE     *  CREATE TABLE task_data.tasks (
    id bigint NOT NULL,
    status integer NOT NULL,
    task_description character varying(400) NOT NULL,
    customer_id bigint NOT NULL,
    executor_id bigint,
    task_type bigint,
    date_created date NOT NULL,
    date_closed date,
    estimated_date date
);
    DROP TABLE task_data.tasks;
    	   task_data         postgres    false    8            �            1259    40224    tasks_id_seq    SEQUENCE     x   CREATE SEQUENCE task_data.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE task_data.tasks_id_seq;
    	   task_data       postgres    false    8    207            q           0    0    tasks_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE task_data.tasks_id_seq OWNED BY task_data.tasks.id;
         	   task_data       postgres    false    208            �            1259    40226    tasks_to_users    TABLE     d   CREATE TABLE task_data.tasks_to_users (
    task_id bigint NOT NULL,
    user_id bigint NOT NULL
);
 %   DROP TABLE task_data.tasks_to_users;
    	   task_data         postgres    false    8            �            1259    40229    tasks_to_users_task_id_seq    SEQUENCE     �   CREATE SEQUENCE task_data.tasks_to_users_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE task_data.tasks_to_users_task_id_seq;
    	   task_data       postgres    false    8    209            r           0    0    tasks_to_users_task_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE task_data.tasks_to_users_task_id_seq OWNED BY task_data.tasks_to_users.task_id;
         	   task_data       postgres    false    210            �            1259    40231    tasks_to_users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE task_data.tasks_to_users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE task_data.tasks_to_users_user_id_seq;
    	   task_data       postgres    false    209    8            s           0    0    tasks_to_users_user_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE task_data.tasks_to_users_user_id_seq OWNED BY task_data.tasks_to_users.user_id;
         	   task_data       postgres    false    211            �            1259    40233    departments    TABLE     �   CREATE TABLE user_data.departments (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    phone_value character varying(25),
    additional_phones character varying(100)
);
 "   DROP TABLE user_data.departments;
    	   user_data         postgres    false    7            �            1259    40236    departments_id_seq    SEQUENCE     ~   CREATE SEQUENCE user_data.departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE user_data.departments_id_seq;
    	   user_data       postgres    false    7    212            t           0    0    departments_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE user_data.departments_id_seq OWNED BY user_data.departments.id;
         	   user_data       postgres    false    213            �            1259    40238    users    TABLE     p  CREATE TABLE user_data.users (
    id bigint NOT NULL,
    first_name character varying(80),
    last_name character varying(80),
    department_id integer,
    work_position character varying(150),
    email character varying(100),
    personal_phone character varying(30),
    role integer,
    username character varying(50),
    password character varying(150)
);
    DROP TABLE user_data.users;
    	   user_data         postgres    false    7            �            1259    40241    users_id_seq    SEQUENCE     x   CREATE SEQUENCE user_data.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE user_data.users_id_seq;
    	   user_data       postgres    false    7    214            u           0    0    users_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE user_data.users_id_seq OWNED BY user_data.users.id;
         	   user_data       postgres    false    215            �            1259    40243    users_to_departments    TABLE     ^   CREATE TABLE user_data.users_to_departments (
    department_id bigint,
    user_id bigint
);
 +   DROP TABLE user_data.users_to_departments;
    	   user_data         postgres    false    7            �
           2604    40246     assistants_to_tasks assistant_id    DEFAULT     �   ALTER TABLE ONLY task_data.assistants_to_tasks ALTER COLUMN assistant_id SET DEFAULT nextval('task_data.assistants_to_tasks_assistant_id_seq'::regclass);
 R   ALTER TABLE task_data.assistants_to_tasks ALTER COLUMN assistant_id DROP DEFAULT;
    	   task_data       postgres    false    201    200            �
           2604    40247    assistants_to_tasks task_id    DEFAULT     �   ALTER TABLE ONLY task_data.assistants_to_tasks ALTER COLUMN task_id SET DEFAULT nextval('task_data.assistants_to_tasks_task_id_seq'::regclass);
 M   ALTER TABLE task_data.assistants_to_tasks ALTER COLUMN task_id DROP DEFAULT;
    	   task_data       postgres    false    202    200            �
           2604    40248    task_status id    DEFAULT     x   ALTER TABLE ONLY task_data.task_status ALTER COLUMN id SET DEFAULT nextval('task_data.task_statuses_id_seq'::regclass);
 @   ALTER TABLE task_data.task_status ALTER COLUMN id DROP DEFAULT;
    	   task_data       postgres    false    204    203            �
           2604    40249    task_types id    DEFAULT     t   ALTER TABLE ONLY task_data.task_types ALTER COLUMN id SET DEFAULT nextval('task_data.task_types_id_seq'::regclass);
 ?   ALTER TABLE task_data.task_types ALTER COLUMN id DROP DEFAULT;
    	   task_data       postgres    false    206    205            �
           2604    40250    tasks id    DEFAULT     j   ALTER TABLE ONLY task_data.tasks ALTER COLUMN id SET DEFAULT nextval('task_data.tasks_id_seq'::regclass);
 :   ALTER TABLE task_data.tasks ALTER COLUMN id DROP DEFAULT;
    	   task_data       postgres    false    208    207            �
           2604    40251    tasks_to_users task_id    DEFAULT     �   ALTER TABLE ONLY task_data.tasks_to_users ALTER COLUMN task_id SET DEFAULT nextval('task_data.tasks_to_users_task_id_seq'::regclass);
 H   ALTER TABLE task_data.tasks_to_users ALTER COLUMN task_id DROP DEFAULT;
    	   task_data       postgres    false    210    209            �
           2604    40252    tasks_to_users user_id    DEFAULT     �   ALTER TABLE ONLY task_data.tasks_to_users ALTER COLUMN user_id SET DEFAULT nextval('task_data.tasks_to_users_user_id_seq'::regclass);
 H   ALTER TABLE task_data.tasks_to_users ALTER COLUMN user_id DROP DEFAULT;
    	   task_data       postgres    false    211    209            �
           2604    40253    departments id    DEFAULT     v   ALTER TABLE ONLY user_data.departments ALTER COLUMN id SET DEFAULT nextval('user_data.departments_id_seq'::regclass);
 @   ALTER TABLE user_data.departments ALTER COLUMN id DROP DEFAULT;
    	   user_data       postgres    false    213    212            �
           2604    40254    users id    DEFAULT     j   ALTER TABLE ONLY user_data.users ALTER COLUMN id SET DEFAULT nextval('user_data.users_id_seq'::regclass);
 :   ALTER TABLE user_data.users ALTER COLUMN id DROP DEFAULT;
    	   user_data       postgres    false    215    214            T          0    40198    tasks_to_users 
   TABLE DATA               :   COPY public.tasks_to_users (task_id, user_id) FROM stdin;
    public       postgres    false    198   �e       U          0    40201    users_to_departments 
   TABLE DATA               F   COPY public.users_to_departments (department_id, user_id) FROM stdin;
    public       postgres    false    199   �e       V          0    40204    assistants_to_tasks 
   TABLE DATA               G   COPY task_data.assistants_to_tasks (assistant_id, task_id) FROM stdin;
 	   task_data       postgres    false    200   �e       Y          0    40211    task_status 
   TABLE DATA               :   COPY task_data.task_status (id, title, color) FROM stdin;
 	   task_data       postgres    false    203   �e       [          0    40216 
   task_types 
   TABLE DATA               1   COPY task_data.task_types (id, name) FROM stdin;
 	   task_data       postgres    false    205   lf       ]          0    40221    tasks 
   TABLE DATA               �   COPY task_data.tasks (id, status, task_description, customer_id, executor_id, task_type, date_created, date_closed, estimated_date) FROM stdin;
 	   task_data       postgres    false    207   �f       _          0    40226    tasks_to_users 
   TABLE DATA               =   COPY task_data.tasks_to_users (task_id, user_id) FROM stdin;
 	   task_data       postgres    false    209   Ph       b          0    40233    departments 
   TABLE DATA               R   COPY user_data.departments (id, name, phone_value, additional_phones) FROM stdin;
 	   user_data       postgres    false    212   yh       d          0    40238    users 
   TABLE DATA               �   COPY user_data.users (id, first_name, last_name, department_id, work_position, email, personal_phone, role, username, password) FROM stdin;
 	   user_data       postgres    false    214   �h       f          0    40243    users_to_departments 
   TABLE DATA               I   COPY user_data.users_to_departments (department_id, user_id) FROM stdin;
 	   user_data       postgres    false    216   j       v           0    0 $   assistants_to_tasks_assistant_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('task_data.assistants_to_tasks_assistant_id_seq', 1, false);
         	   task_data       postgres    false    201            w           0    0    assistants_to_tasks_task_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('task_data.assistants_to_tasks_task_id_seq', 1, false);
         	   task_data       postgres    false    202            x           0    0    task_statuses_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('task_data.task_statuses_id_seq', 5, true);
         	   task_data       postgres    false    204            y           0    0    task_types_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('task_data.task_types_id_seq', 3, true);
         	   task_data       postgres    false    206            z           0    0    tasks_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('task_data.tasks_id_seq', 27, true);
         	   task_data       postgres    false    208            {           0    0    tasks_to_users_task_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('task_data.tasks_to_users_task_id_seq', 1, false);
         	   task_data       postgres    false    210            |           0    0    tasks_to_users_user_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('task_data.tasks_to_users_user_id_seq', 1, false);
         	   task_data       postgres    false    211            }           0    0    departments_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('user_data.departments_id_seq', 4, true);
         	   user_data       postgres    false    213            ~           0    0    users_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('user_data.users_id_seq', 10, true);
         	   user_data       postgres    false    215            �
           2606    40256 "   tasks_to_users tasks_to_users_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.tasks_to_users
    ADD CONSTRAINT tasks_to_users_pkey PRIMARY KEY (task_id, user_id);
 L   ALTER TABLE ONLY public.tasks_to_users DROP CONSTRAINT tasks_to_users_pkey;
       public         postgres    false    198    198            �
           2606    40258 .   users_to_departments users_to_departments_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.users_to_departments
    ADD CONSTRAINT users_to_departments_pkey PRIMARY KEY (department_id, user_id);
 X   ALTER TABLE ONLY public.users_to_departments DROP CONSTRAINT users_to_departments_pkey;
       public         postgres    false    199    199            �
           2606    40260    task_status task_statuses_pk 
   CONSTRAINT     ]   ALTER TABLE ONLY task_data.task_status
    ADD CONSTRAINT task_statuses_pk PRIMARY KEY (id);
 I   ALTER TABLE ONLY task_data.task_status DROP CONSTRAINT task_statuses_pk;
    	   task_data         postgres    false    203            �
           2606    40262    task_types task_types_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY task_data.task_types
    ADD CONSTRAINT task_types_pk PRIMARY KEY (id);
 E   ALTER TABLE ONLY task_data.task_types DROP CONSTRAINT task_types_pk;
    	   task_data         postgres    false    205            �
           2606    40264    tasks tasks_pk 
   CONSTRAINT     O   ALTER TABLE ONLY task_data.tasks
    ADD CONSTRAINT tasks_pk PRIMARY KEY (id);
 ;   ALTER TABLE ONLY task_data.tasks DROP CONSTRAINT tasks_pk;
    	   task_data         postgres    false    207            �
           2606    40266    departments departments_pk 
   CONSTRAINT     [   ALTER TABLE ONLY user_data.departments
    ADD CONSTRAINT departments_pk PRIMARY KEY (id);
 G   ALTER TABLE ONLY user_data.departments DROP CONSTRAINT departments_pk;
    	   user_data         postgres    false    212            �
           2606    40268    users users_pk 
   CONSTRAINT     O   ALTER TABLE ONLY user_data.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);
 ;   ALTER TABLE ONLY user_data.users DROP CONSTRAINT users_pk;
    	   user_data         postgres    false    214            �
           1259    40269    task_statuses_id_uindex    INDEX     W   CREATE UNIQUE INDEX task_statuses_id_uindex ON task_data.task_status USING btree (id);
 .   DROP INDEX task_data.task_statuses_id_uindex;
    	   task_data         postgres    false    203            �
           1259    202742    users_username_uindex    INDEX     U   CREATE UNIQUE INDEX users_username_uindex ON user_data.users USING btree (username);
 ,   DROP INDEX user_data.users_username_uindex;
    	   user_data         postgres    false    214            �
           2606    40270 *   tasks_to_users fkbkmajmv2draxl6f538707kr70    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_to_users
    ADD CONSTRAINT fkbkmajmv2draxl6f538707kr70 FOREIGN KEY (task_id) REFERENCES task_data.tasks(id);
 T   ALTER TABLE ONLY public.tasks_to_users DROP CONSTRAINT fkbkmajmv2draxl6f538707kr70;
       public       postgres    false    207    2759    198            �
           2606    40275 *   tasks_to_users fkde7arlr8wvdbiflkesakurvhf    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_to_users
    ADD CONSTRAINT fkde7arlr8wvdbiflkesakurvhf FOREIGN KEY (user_id) REFERENCES user_data.users(id);
 T   ALTER TABLE ONLY public.tasks_to_users DROP CONSTRAINT fkde7arlr8wvdbiflkesakurvhf;
       public       postgres    false    198    2763    214            �
           2606    40280 0   users_to_departments fkl4vdr5t2vjgtk0jj82v621xwf    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_to_departments
    ADD CONSTRAINT fkl4vdr5t2vjgtk0jj82v621xwf FOREIGN KEY (department_id) REFERENCES user_data.departments(id);
 Z   ALTER TABLE ONLY public.users_to_departments DROP CONSTRAINT fkl4vdr5t2vjgtk0jj82v621xwf;
       public       postgres    false    212    2761    199            �
           2606    40285 0   users_to_departments fkqdyu5fnm9siu79db6mpxy4day    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_to_departments
    ADD CONSTRAINT fkqdyu5fnm9siu79db6mpxy4day FOREIGN KEY (user_id) REFERENCES user_data.users(id);
 Z   ALTER TABLE ONLY public.users_to_departments DROP CONSTRAINT fkqdyu5fnm9siu79db6mpxy4day;
       public       postgres    false    199    2763    214            �
           2606    40290 9   assistants_to_tasks assistants_to_tasks_assistant_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY task_data.assistants_to_tasks
    ADD CONSTRAINT assistants_to_tasks_assistant_id_fkey FOREIGN KEY (assistant_id) REFERENCES user_data.users(id);
 f   ALTER TABLE ONLY task_data.assistants_to_tasks DROP CONSTRAINT assistants_to_tasks_assistant_id_fkey;
    	   task_data       postgres    false    2763    200    214            �
           2606    40295 4   assistants_to_tasks assistants_to_tasks_task_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY task_data.assistants_to_tasks
    ADD CONSTRAINT assistants_to_tasks_task_id_fkey FOREIGN KEY (task_id) REFERENCES task_data.tasks(id);
 a   ALTER TABLE ONLY task_data.assistants_to_tasks DROP CONSTRAINT assistants_to_tasks_task_id_fkey;
    	   task_data       postgres    false    200    2759    207            �
           2606    40300 !   tasks fkbrg922bkqn5m7212jsqjg6ioe    FK CONSTRAINT     �   ALTER TABLE ONLY task_data.tasks
    ADD CONSTRAINT fkbrg922bkqn5m7212jsqjg6ioe FOREIGN KEY (executor_id) REFERENCES user_data.users(id);
 N   ALTER TABLE ONLY task_data.tasks DROP CONSTRAINT fkbrg922bkqn5m7212jsqjg6ioe;
    	   task_data       postgres    false    207    2763    214            �
           2606    40305 !   tasks fklrw802q2gbvoc16pf2gcdb4e0    FK CONSTRAINT     �   ALTER TABLE ONLY task_data.tasks
    ADD CONSTRAINT fklrw802q2gbvoc16pf2gcdb4e0 FOREIGN KEY (status) REFERENCES task_data.task_status(id);
 N   ALTER TABLE ONLY task_data.tasks DROP CONSTRAINT fklrw802q2gbvoc16pf2gcdb4e0;
    	   task_data       postgres    false    2755    207    203            �
           2606    40310 !   tasks fkoew37bwy2ifaha60efr67o5i7    FK CONSTRAINT     �   ALTER TABLE ONLY task_data.tasks
    ADD CONSTRAINT fkoew37bwy2ifaha60efr67o5i7 FOREIGN KEY (customer_id) REFERENCES user_data.users(id);
 N   ALTER TABLE ONLY task_data.tasks DROP CONSTRAINT fkoew37bwy2ifaha60efr67o5i7;
    	   task_data       postgres    false    207    2763    214            �
           2606    40315 !   tasks fkon71enw59brg8uvnm0dqbiq6i    FK CONSTRAINT     �   ALTER TABLE ONLY task_data.tasks
    ADD CONSTRAINT fkon71enw59brg8uvnm0dqbiq6i FOREIGN KEY (task_type) REFERENCES task_data.task_types(id);
 N   ALTER TABLE ONLY task_data.tasks DROP CONSTRAINT fkon71enw59brg8uvnm0dqbiq6i;
    	   task_data       postgres    false    207    205    2757            �
           2606    40320 *   tasks_to_users tasks_to_users_task_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY task_data.tasks_to_users
    ADD CONSTRAINT tasks_to_users_task_id_fkey FOREIGN KEY (task_id) REFERENCES task_data.tasks(id);
 W   ALTER TABLE ONLY task_data.tasks_to_users DROP CONSTRAINT tasks_to_users_task_id_fkey;
    	   task_data       postgres    false    207    2759    209            �
           2606    40325 *   tasks_to_users tasks_to_users_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY task_data.tasks_to_users
    ADD CONSTRAINT tasks_to_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_data.users(id);
 W   ALTER TABLE ONLY task_data.tasks_to_users DROP CONSTRAINT tasks_to_users_user_id_fkey;
    	   task_data       postgres    false    209    2763    214            �
           2606    40330 <   users_to_departments users_to_departments_department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY user_data.users_to_departments
    ADD CONSTRAINT users_to_departments_department_id_fkey FOREIGN KEY (department_id) REFERENCES user_data.departments(id);
 i   ALTER TABLE ONLY user_data.users_to_departments DROP CONSTRAINT users_to_departments_department_id_fkey;
    	   user_data       postgres    false    216    2761    212            �
           2606    40335 6   users_to_departments users_to_departments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY user_data.users_to_departments
    ADD CONSTRAINT users_to_departments_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_data.users(id);
 c   ALTER TABLE ONLY user_data.users_to_departments DROP CONSTRAINT users_to_departments_user_id_fkey;
    	   user_data       postgres    false    214    216    2763            T      x������ � �      U      x������ � �      V      x������ � �      Y   q   x��;�0E���*��H�n�*MHE���4�3�lb�!啎��D�XH�+d
��������M�ʴ���	ϸ�kcξ�wS��P+��Pnh-t,:�;�ꆯz�,���� .~$e      [   ;   x�3��K-)�/�V(�O�I�-�2�2Ӌs�Jӹ�ἀԢ�������b�=... c�p      ]   �  x��S�n�0=K_�[O,�v�c�E/+�;��:l�ڑ<�m���,���&�0m񑏏�VB��~��hb�v!�Bg:[d�Bg����K�R���yj0  K~>T��У��1��λ����z+��]�}h�!��u�/�;c
vd�Yy2���TZ���v�l&���T�P � ��-Rϩ�?�X���[DX�k��l��z��kQ�?0�[�ޥLs�p]�nՆ3���1n����A�A���h��_��#��ZH=����ϝ�[ؙ���KtuI8�"��;B�agc�"퀆����Ho���w�e��}8��-'�+Yq����y��tN�i�f��D��:���/>$�(252�wf��;sP�qP�Kk|x���).�P�����`f��O_�� ���      _      x���4�24�4�24�b���� &z      b   M   x��1
�0�����t��@T������e�Ȗ���:w�a�{n�h%ĵ:�F�;�q��#�"CD�;D���B      d   0  x���]o� �����u�RP����Uݼ�\����qXl����jl͖tIB���>��#�9Ow�6��D�Ş�,~��D�2���V�R)�v��j5�!]�d�3����G1�A���7�-���~2��Q��T���r�(m&�s&;~^�;%S����l�9�%���}�Z��~|� ��!�U��z�ǥt��*n=)�� '�L%�b�?R���p���0	?�E� �l��M��4��j�3�d|�����+}���О�=g�(ێæ�Vt�}�t�T�>XK۲�#T�Z      f      x�3�4�2�4�2�4�2�4bS�=... '�     