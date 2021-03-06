-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public.employers
(
    "userId" integer NOT NULL,
    "companyName" character varying,
    "webSites" character varying,
    "phoneNumber" character varying,
    PRIMARY KEY ("userId")
);

CREATE TABLE public."jobPositions"
(
    id integer NOT NULL,
    "positionName" character varying,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_seekers
(
    "userId" integer NOT NULL,
    "firstName" character varying,
    "lastName" character varying,
    "nationalId" bigint,
    "birthOfDate" date,
    PRIMARY KEY ("userId")
);

CREATE TABLE public."systemUsers"
(
    "userId" integer NOT NULL,
    "firstName" character varying,
    "lastName" character varying,
    PRIMARY KEY ("userId")
);

CREATE TABLE public.users
(
    id integer NOT NULL,
    email character varying(40),
    password character varying,
    PRIMARY KEY (id)
);

CREATE TABLE public."verificationStatus"
(
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "emailVerifaction" boolean,
    "systemVerificatioon" boolean,
    PRIMARY KEY (id)
);

ALTER TABLE public.employers
    ADD FOREIGN KEY ("userId")
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.employers
    ADD FOREIGN KEY ("userId")
    REFERENCES public."verificationStatus" ("userId")
    NOT VALID;


ALTER TABLE public.job_seekers
    ADD FOREIGN KEY ("userId")
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public."systemUsers"
    ADD FOREIGN KEY ("userId")
    REFERENCES public.users (id)
    NOT VALID;

END;