PGDMP     *    (                 {            library    13.8    13.8 #    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    17236    library    DATABASE     d   CREATE DATABASE library WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE library;
                postgres    false            ?            1255    17279 O   add_student_p(integer, character varying, character varying, character varying) 	   PROCEDURE     ?   CREATE PROCEDURE public.add_student_p(integer, character varying, character varying, character varying)
    LANGUAGE plpgsql
    AS $_$
BEGIN
	INSERT INTO student_details VALUES($1,$2,$3,$4);
	COMMIT;
END;
$_$;
 g   DROP PROCEDURE public.add_student_p(integer, character varying, character varying, character varying);
       public          postgres    false            ?            1255    17277    trigger_f()    FUNCTION     ?   CREATE FUNCTION public.trigger_f() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE book_details SET quantity = quantity - 1 WHERE book_id = new.book_id;
RETURN new;
END;
$$;
 "   DROP FUNCTION public.trigger_f();
       public          postgres    false            ?            1259    17247    book_details    TABLE     ?   CREATE TABLE public.book_details (
    book_id integer NOT NULL,
    book_name character varying(100),
    author character varying(50),
    quantity integer
);
     DROP TABLE public.book_details;
       public         heap    postgres    false            ?            1259    17245    book_details_book_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.book_details_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.book_details_book_id_seq;
       public          postgres    false    203            ?           0    0    book_details_book_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.book_details_book_id_seq OWNED BY public.book_details.book_id;
          public          postgres    false    202            ?            1259    17271    issue_book_details    TABLE     ?   CREATE TABLE public.issue_book_details (
    id integer NOT NULL,
    book_id integer,
    student_id integer,
    issue_date date,
    due_date date,
    status character varying(20)
);
 &   DROP TABLE public.issue_book_details;
       public         heap    postgres    false            ?            1259    17269    issue_book_details_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.issue_book_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.issue_book_details_id_seq;
       public          postgres    false    207            ?           0    0    issue_book_details_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.issue_book_details_id_seq OWNED BY public.issue_book_details.id;
          public          postgres    false    206            ?            1259    17263    student_details    TABLE     ?   CREATE TABLE public.student_details (
    student_id integer NOT NULL,
    name character varying(50),
    course character varying(50),
    branch character varying(50)
);
 #   DROP TABLE public.student_details;
       public         heap    postgres    false            ?            1259    17261    student_details_student_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.student_details_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.student_details_student_id_seq;
       public          postgres    false    205            ?           0    0    student_details_student_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.student_details_student_id_seq OWNED BY public.student_details.student_id;
          public          postgres    false    204            ?            1259    17239    users    TABLE     ?   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50),
    password character varying(50),
    email character varying(100),
    contact character varying(20)
);
    DROP TABLE public.users;
       public         heap    postgres    false            ?            1259    17237    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    201            ?           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    200            7           2604    17250    book_details book_id    DEFAULT     |   ALTER TABLE ONLY public.book_details ALTER COLUMN book_id SET DEFAULT nextval('public.book_details_book_id_seq'::regclass);
 C   ALTER TABLE public.book_details ALTER COLUMN book_id DROP DEFAULT;
       public          postgres    false    202    203    203            9           2604    17274    issue_book_details id    DEFAULT     ~   ALTER TABLE ONLY public.issue_book_details ALTER COLUMN id SET DEFAULT nextval('public.issue_book_details_id_seq'::regclass);
 D   ALTER TABLE public.issue_book_details ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            8           2604    17266    student_details student_id    DEFAULT     ?   ALTER TABLE ONLY public.student_details ALTER COLUMN student_id SET DEFAULT nextval('public.student_details_student_id_seq'::regclass);
 I   ALTER TABLE public.student_details ALTER COLUMN student_id DROP DEFAULT;
       public          postgres    false    204    205    205            6           2604    17242    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201            ?          0    17247    book_details 
   TABLE DATA           L   COPY public.book_details (book_id, book_name, author, quantity) FROM stdin;
    public          postgres    false    203   A(       ?          0    17271    issue_book_details 
   TABLE DATA           c   COPY public.issue_book_details (id, book_id, student_id, issue_date, due_date, status) FROM stdin;
    public          postgres    false    207    )       ?          0    17263    student_details 
   TABLE DATA           K   COPY public.student_details (student_id, name, course, branch) FROM stdin;
    public          postgres    false    205   ?)       ?          0    17239    users 
   TABLE DATA           C   COPY public.users (id, name, password, email, contact) FROM stdin;
    public          postgres    false    201   ?*       ?           0    0    book_details_book_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.book_details_book_id_seq', 2, true);
          public          postgres    false    202            ?           0    0    issue_book_details_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.issue_book_details_id_seq', 15, true);
          public          postgres    false    206            ?           0    0    student_details_student_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.student_details_student_id_seq', 1, false);
          public          postgres    false    204            ?           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    200            =           2606    17252    book_details book_details_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.book_details
    ADD CONSTRAINT book_details_pkey PRIMARY KEY (book_id);
 H   ALTER TABLE ONLY public.book_details DROP CONSTRAINT book_details_pkey;
       public            postgres    false    203            A           2606    17276 *   issue_book_details issue_book_details_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.issue_book_details
    ADD CONSTRAINT issue_book_details_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.issue_book_details DROP CONSTRAINT issue_book_details_pkey;
       public            postgres    false    207            ?           2606    17268 $   student_details student_details_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.student_details
    ADD CONSTRAINT student_details_pkey PRIMARY KEY (student_id);
 N   ALTER TABLE ONLY public.student_details DROP CONSTRAINT student_details_pkey;
       public            postgres    false    205            ;           2606    17244    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    201            B           2620    17278     issue_book_details issue_trigger    TRIGGER     y   CREATE TRIGGER issue_trigger AFTER INSERT ON public.issue_book_details FOR EACH ROW EXECUTE FUNCTION public.trigger_f();
 9   DROP TRIGGER issue_trigger ON public.issue_book_details;
       public          postgres    false    207    208            ?   ?   x?νA???;W1W ??i??Аh4'L????????(??v?}?}???cs??a?5_??F?K	2????ח??'+SY|??~???1?l???a$4?Djn?\r??ؓnTZ????0????????j??1?!Ve(??!?????e|?J?TF???j??c	?:D??{>&      ?   ?   x?}??
?@?ϳﲒd??yO?"Ţ?ͷ???I??ۙo$?D?(m??q???????*t????1?n"3n}???	?#n?|S???S??amj?????m??:j??-?wuNkU???d?i_H?đtC??????B.?V      ?   ?   x???=n1???)|?HB??+!?)?Ȍ????^
?2{??ֹW6?#?M?)????y?7???1????>????p]1ʪ?N䏜,???#(????3???76?E5?\S???Kl?gs???VS6}????oL??!Gc??H^??sS?57l??3TT󝷔o0?1??X???$U?XT???(??'q<?.?Ƅ??|??f??D?????      ?   >   x?3?LN??4426151?s3s???s9--??LM????8??J?@??$5?\1z\\\ ???     