--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

DROP DATABASE IF EXISTS "o.gulyaeva";
CREATE DATABASE "o.gulyaeva" WITH ENCODING='UTF-8';

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: chest_pain_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chest_pain_types (
    chest_pain_id integer NOT NULL,
    chest_pain character varying NOT NULL
);


ALTER TABLE public.chest_pain_types OWNER TO postgres;

--
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctors (
    doctor_id integer NOT NULL,
    doctor_name character varying(255) NOT NULL
);


ALTER TABLE public.doctors OWNER TO postgres;

--
-- Name: ecg_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ecg_types (
    ecg_id integer NOT NULL,
    rest_ecg character varying NOT NULL
);


ALTER TABLE public.ecg_types OWNER TO postgres;

--
-- Name: patient_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patient_records (
    record_id integer NOT NULL,
    patient_id integer NOT NULL,
    doctor_id integer NOT NULL,
    chest_pain_id integer NOT NULL,
    ecg_id integer NOT NULL,
    rest_spb integer,
    cholesterol integer,
    max_hr integer,
    st_by_exercise real,
    CONSTRAINT st_by_exercise_check CHECK (((st_by_exercise >= ('-3'::integer)::double precision) AND (st_by_exercise <= (3)::double precision)))
);


ALTER TABLE public.patient_records OWNER TO postgres;

--
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    patient_id integer NOT NULL,
    patient_name character varying NOT NULL,
    date_of_birth date NOT NULL,
    gender character(1) NOT NULL,
    weight integer,
    height integer,
    CONSTRAINT check_gender CHECK ((gender = ANY (ARRAY['М'::bpchar, 'Ж'::bpchar]))),
    CONSTRAINT check_height CHECK (((height < 200) AND (height > 0))),
    CONSTRAINT check_weight CHECK (((weight < 400) AND (weight > 0)))
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- Data for Name: chest_pain_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chest_pain_types (chest_pain_id, chest_pain) FROM stdin;
1	Острый, колющий или пронизывающий боль
2	Тупая или тяжелая боль
3	Жгучая боль
4	Локализованная боль
5	Распространяющаяся боль
6	Боль при дыхании
7	Боль при движении или физической активности
8	Чувствительность или боль при пальпации
\.


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctors (doctor_id, doctor_name) FROM stdin;
1	Кузнецов А.В.
2	Шестакова Е.А.
3	Белова О.В.
4	Королева Н.А.
5	Кузьмин Л.В.
6	Смирнова Е.В.
7	Михайлова А.А.
8	Козлова Е.С.
9	Попов Н.В.
10	Кузнецова А.А.
11	Соколова Е.А.
12	Петров О.А.
13	Смирнов А.В.
14	Кузнецова Е.А.
15	Королева Е.В.
\.


--
-- Data for Name: ecg_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ecg_types (ecg_id, rest_ecg) FROM stdin;
1	Сверхжелудочковая тахикардия
2	Брадикардия
3	Преждевременные сокращения предсердий
4	Преждевременные сокращения желудочков
5	Блок левой пучковой ветви
6	Блок правой пучковой ветви
7	Первой степени блокада сердца
8	Второй степени блокада сердца
9	Третьей степени блокада сердца
10	Тихая ишемия
11	Хроническая ишемия
12	Острый коронарный синдром
13	Гипертрофия левого желудочка
14	Гипертрофия правого желудочка
15	Кардиомиопатия
16	Инфаркт миокарда
17	Миокардит
18	Перикардит
19	Нормальная
\.


--
-- Data for Name: patient_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patient_records (record_id, patient_id, doctor_id, chest_pain_id, ecg_id, rest_spb, cholesterol, max_hr, st_by_exercise) FROM stdin;
1	1	2	4	12	120	200	150	1.5
2	3	1	2	5	130	180	160	0.8
4	5	3	1	14	122	240	130	2
5	6	5	6	3	128	200	165	0
6	4	7	5	16	136	190	155	-0.5
7	7	6	7	9	125	210	148	1.2
8	9	8	8	13	110	185	170	-0.9
9	8	10	2	7	140	240	125	2.5
10	11	9	2	1	115	200	160	-1
12	13	13	1	11	128	205	145	0.3
13	14	12	6	18	126	210	140	-1.5
14	15	14	7	6	138	195	165	0.5
15	16	15	3	17	114	230	150	-0.2
16	17	1	5	15	130	220	158	1
18	9	8	2	5	122	190	155	0.8
19	14	15	7	8	128	195	148	-0.5
20	17	2	1	12	136	200	162	1.2
21	3	1	3	14	118	180	155	0
23	5	3	6	16	122	240	150	2
24	6	5	4	3	128	200	160	0
25	4	7	8	11	136	190	165	-0.5
26	7	6	7	9	125	210	148	1.2
27	9	8	8	13	110	185	170	-0.9
29	11	9	2	17	115	200	160	-1
30	10	11	4	2	132	190	152	1.8
3	2	4	3	19	118	220	140	-1.2
11	10	11	4	19	132	190	152	1.8
17	12	2	8	19	135	205	162	-0.7
22	2	4	5	19	125	220	140	-1.2
28	8	10	1	19	140	240	125	2.5
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (patient_id, patient_name, date_of_birth, gender, weight, height) FROM stdin;
1	Иванов И.И.	1980-01-15	М	75	180
2	Петрова А.С.	1995-05-22	Ж	60	165
3	Смирнов Н.П.	1972-09-10	М	85	175
4	Козлова Е.А.	1988-03-03	Ж	70	160
5	Зайцев П.М.	1992-11-28	М	78	182
6	Сидорова О.В.	1985-07-07	Ж	65	170
7	Кузнецов В.В.	1978-12-18	М	90	178
8	Лебедева Т.П.	1990-04-02	Ж	68	162
9	Григорьев А.И.	1983-08-25	М	79	175
10	Новикова Л.Ф.	1987-06-14	Ж	63	168
11	Семенов Д.В.	1993-02-09	М	88	185
12	Шевченко И.С.	1982-10-30	Ж	72	167
13	Калинин С.А.	1975-04-20	М	77	173
14	Андреева М.И.	1989-09-05	Ж	67	160
15	Макаров В.П.	1986-11-12	М	82	180
16	Тимофеева Е.А.	1991-07-01	Ж	75	175
17	Гаврилов А.В.	1977-03-28	М	81	178
\.


--
-- Name: chest_pain_types ChestPainTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chest_pain_types
    ADD CONSTRAINT "ChestPainTypes_pkey" PRIMARY KEY (chest_pain_id);


--
-- Name: ecg_types ECGTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecg_types
    ADD CONSTRAINT "ECGTypes_pkey" PRIMARY KEY (ecg_id);


--
-- Name: patient_records PatientRecords_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_records
    ADD CONSTRAINT "PatientRecords_pkey" PRIMARY KEY (record_id);


--
-- Name: chest_pain_types chest_pain_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chest_pain_types
    ADD CONSTRAINT chest_pain_id_unique UNIQUE (chest_pain_id);


--
-- Name: doctors doctor_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctor_id_unique UNIQUE (doctor_id);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (doctor_id);


--
-- Name: ecg_types ecg_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecg_types
    ADD CONSTRAINT ecg_id_unique UNIQUE (ecg_id);


--
-- Name: patients patient_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patient_id_unique UNIQUE (patient_id);


--
-- Name: patients patient_name_duplicate; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patient_name_duplicate UNIQUE (patient_name, date_of_birth);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);


--
-- Name: patient_records record_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_records
    ADD CONSTRAINT record_id_unique UNIQUE (record_id);


--
-- Name: patient_records chest_pain_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_records
    ADD CONSTRAINT chest_pain_id_fk FOREIGN KEY (chest_pain_id) REFERENCES public.chest_pain_types(chest_pain_id);


--
-- Name: patient_records doctor_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_records
    ADD CONSTRAINT doctor_id_fk FOREIGN KEY (doctor_id) REFERENCES public.doctors(doctor_id);


--
-- Name: patient_records ecg_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_records
    ADD CONSTRAINT ecg_id_fk FOREIGN KEY (ecg_id) REFERENCES public.ecg_types(ecg_id);


--
-- Name: patient_records patient_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_records
    ADD CONSTRAINT patient_id_fk FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id);


--
-- PostgreSQL database dump complete
--

