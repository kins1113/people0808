-- 3������      1 
--DROP TABLE THIRD CASCADE CONSTRAINTS;
CREATE TABLE THIRD (
	THIRD_CODE NUMBER      primary key,  -- 3�������ڵ�
	THIRDNAME  VARCHAR(50)                  -- 3��������
);
--DROP SEQUENCE THIRD_SEQ ;
create sequence THIRD_SEQ
increment by 1
start with 1
nocache;


-- �Խ��� ����       2
--DROP TABLE BOARD_KIND CASCADE CONSTRAINTS;
CREATE TABLE BOARD_KIND (
	TYPE_CODE   NUMBER      primary key, -- ���� �ڵ�
	TYPE             VARCHAR(50)                 -- ����
);
alter table board_kind add USAGE varchar2(10) default 'Y';         --�߰� 7�� 2�� ��ȯ 
alter table board_kind add REGDATE date default sysdate;         --�߰� 7�� 2�� ��ȯ 
--drop sequence BOARD_KIND_SEQ;
create sequence BOARD_KIND_SEQ
increment by 1
start with 1
nocache;
SELECT * FROM PAYMENT;

-- ����       3
--DROP TABLE PAYMENT CASCADE CONSTRAINTS;
CREATE TABLE PAYMENT (
	PAYMENT_CODE     NUMBER          primary key,   -- ���� �ڵ�
	PATMENTWAY        VARCHAR(30)   NOT NULL,     -- ��������
	PROGRESS            VARCHAR(30) ,                      -- �����Ȳ
	DISCOUNT             NUMBER,                            -- ���αݾ�
	PAYDATE               DATE ,                               -- ������
	PAYEND_DATE       DATE,                                -- ������
	SERVICE_CODE     NUMBER          NOT NULL,   -- ���� �ڵ�
	MEMBER_CODE     NUMBER          NOT NULL,     -- ȸ�� �ڵ�
	constraint FK_SERVICE_TO_PAYMENT foreign key(SERVICE_CODE) references SERVICE(SERVICE_CODE),
	constraint FK_MEMBER_TO_PAYMENT foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE)
);
--drop sequence PAYMENT_SEQ;
create sequence PAYMENT_SEQ
increment by 1
start with 1
nocache;



-- ��������(�̷¼�)        4
--DROP TABLE OPENCHECK CASCADE CONSTRAINTS;
CREATE TABLE OPENCHECK (
	OPEN_CODE         NUMBER primary key,   -- ���� �ڵ�
	MEMBER_CODE    NUMBER ,                    -- ȸ�� �ڵ�
	RESUME_CODE    NUMBER ,                    -- �̷¼� �ڵ�
	OPENDATE          DATE,                            -- ���� ��¥
	constraint FK_MEMBER_TO_OPENCHECK foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE),
	constraint FK_RESUME_TO_OPENCHECK foreign key(RESUME_CODE) references RESUME(RESUME_CODE)
);
--drop sequence OPENCHECK_SEQ;
create sequence OPENCHECK_SEQ
increment by 1
start with 1
nocache;


-- �Խñ�      5
--DROP TABLE POST CASCADE CONSTRAINTS;
CREATE TABLE POST (
	BOARD_CODE2      NUMBER            primary key,         -- �Խñ� �ڵ�
	BOARDTITLE          VARCHAR(50)     NOT NULL,           -- ����
	BOARDCONTENT   CLOB                  NOT NULL,          -- ����
	BOARDREGDATE2 DATE                  DEFAULT sysdate, -- �����
	BOARDHITS           NUMBER             DEFAULT 0,          -- ��ȸ��
	DELETECHECK      VARCHAR(20)      DEFAULT 'N',         -- ���� ����
	MEMBER_CODE     NUMBER            NOT NULL,             -- ȸ�� �ڵ�
	BOARD_CODE        NUMBER,                                       -- �Խ��� �ڵ�
	BOARDCHECK       VARCHAR(20) ,                                 -- �Խ��� ���� �ڵ� 
	constraint FK_MEMBER_TO_POST foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE),
	constraint FK_BOARD_TO_POST foreign key(BOARD_CODE) references BOARD(BOARD_CODE1)
);
alter table post drop column boardCheck;
alter table post add REPORT_CK VARCHAR2(5) default 'Y';
alter table post add REPORT_USER VARCHAR2(50);
alter table post add REPORT_COMENT CLOB;

--drop sequence POST_SEQ;
create sequence POST_SEQ
increment by 1
start with 1
nocache;


-- ����ٹ�����       6
--DROP TABLE HOPE_WORKING CASCADE CONSTRAINTS;
CREATE TABLE HOPE_WORKING (
	HOPEWORK_CODE    NUMBER           primary key, -- ����ٹ��ڵ�
    JOBTYPE                  VARCHAR(50) ,                      -- ������
	HOPEWORKDATE     DATE,                                    -- �ٹ��Ͻ�
    HOPEPAY                VARCHAR(50) ,                       -- �޿�
	HOPEWORKFORM   VARCHAR(50) ,                       -- �ٹ�����
	LOCAL_CODE          NUMBER             NOT NULL, -- �����ڵ�
	FIRSTJOB_CODE     NUMBER             NOT NULL, -- 1�������ڵ�
	constraint FK_LOCATION_TO_HOPE_WORKING foreign key(LOCAL_CODE) references LOCATION(LOCAL_CODE),
	constraint FK_FIRST_TO_HOPE_WORKING foreign key(FIRSTJOB_CODE) references FIRST(FIRST_CODE)
);
ALTER TABLE HOPE_WORKING modify LOCAL_CODE  null;
ALTER TABLE HOPE_WORKING modify FIRSTJOB_CODE  null;
ALTER TABLE HOPE_WORKING modify HOPEWORKDATE varchar2(60);

--drop sequence HOPE_WORKING_SEQ;
create sequence HOPE_WORKING_SEQ
increment by 1
start with 1
nocache;


-- ������Ȳ 7
--DROP TABLE APPLY CASCADE CONSTRAINTS;
CREATE TABLE APPLY (
	APPLY_CODE         NUMBER               primary key, -- ���� �ڵ�
	APPLYDATE            DATE,                                      -- ������
    APPLYLIST             VARCHAR(100) ,                       -- ��������
	APPLYCONDITION  VARCHAR(50) ,                         -- ��������
	OPENCHECK          VARCHAR(20)       DEFAULT 'N', -- ��������
	MEMBER_CODE     NUMBER               NOT NULL,   -- ȸ�� �ڵ�
	JOBOPENING         NUMBER               NOT NULL,    -- ä����� �ڵ�
	constraint FK_MEMBER_TO_APPLY foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE),
	constraint FK_JOBOPENING_TO_APPLY foreign key(JOBOPENING) references JOBOPENING(JOBOPENING)
);
--drop sequence APPLY_SEQ;
create sequence APPLY_SEQ
increment by 1
start with 1
nocache;


-- �����Ǵ亯   8
--DROP TABLE CUSANSWER CASCADE CONSTRAINTS;
CREATE TABLE CUSANSWER (
	ANSWER_CODE           NUMBER         primary key, -- �亯�ڵ�
	CUSTEXT_CODE          NUMBER        NOT NULL, -- ������ �� �ڵ�
	ANSWERTITLE             VARCHAR(30) NOT NULL, -- ����
	ANSWERCONTENT       CLOB             NOT NULL, -- ����
	ANSWER_REGDATE     DATE,                              -- �����
	ADMIN_CODE               NUMBER,                        -- ������ �ڵ�
	constraint FK_CUSTEXT_TO_CUSANSWER foreign key(CUSTEXT_CODE) references CUSTEXT(CUSTEXT_CODE),
	constraint FK_MANAGER_TO_CUSANSWER foreign key(ADMIN_CODE) references MANAGER(ADMIN_CODE)
);
--drop sequence CUSANSWER_SEQ;
create sequence CUSANSWER_SEQ
increment by 1
start with 1
nocache;


-- �Խ��� ���   9
CREATE TABLE POST_CMT (
	COMMENT_CODE    NUMBER          primary key,             -- ��� �ڵ�
	BOARD_DATE          DATE              DEFAULT sysdate,     -- �����
	ARRAYNO               NUMBER,                                        -- ���Ĺ�ȣ
	STEPNO                  NUMBER,                                        -- �ܰ��ȣ
	DELETECHECK        VARCHAR(20)  DEFAULT 'N',            -- ��������
    MEMBER_CODE      NUMBER,                                        -- ȸ�� �ڵ�
	BOARD_CODE2       NUMBER,                                       -- �Խñ� �ڵ�
	GROUPNO              NUMBER,                                       -- �׷��ȣ
	constraint FK_MEMBER_TO_POST_CMT foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE),
	constraint FK_POST_TO_POST_CMT foreign key(BOARD_CODE2) references POST(BOARD_CODE2)
);
--drop sequence NOTICE_CMT_SEQ;
create sequence NOTICE_CMT_SEQ
increment by 1
start with 1
nocache;


-- �̷¼�  10
CREATE TABLE RESUME (
	RESUME_CODE          NUMBER       primary key,                  -- �̷¼� �ڵ�
	RESUMETITLE            VARCHAR(20) NOT NULL,                 -- ����
	RESUMEREGDATE     DATE              DEFAULT sysdate,     -- �����
    INTRODUCE              CLOB,                                                -- �ڱ�Ұ�
	AWARD                     VARCHAR(50) ,                               -- ����, ����, Ȱ������
	LANGLICENCE_CODE NUMBER,                                      -- ����ڰ����ڵ�
	LICENCE_CODE        NUMBER,                                     -- �ڰ�����ȣ
	DV_CODE                 NUMBER,                                  -- �����ڵ�
    ACADEMIC_CODE      NUMBER            NOT NULL,      -- �з��ڵ�
	DESIREDWORK_CODE NUMBER,                                -- ����ٹ��ڵ�
    OPENCHECK               VARCHAR(10) DEFAULT 'N',        -- ��������
	MEMBER_CODE          NUMBER         NOT NULL,            -- ȸ�� �ڵ�
	constraint FK_LANGCERTIFICATION_TO_RESUME foreign key(LANGLICENCE_CODE) references LANGCERTIFICATION(LANGLICENCE_CODE),
	constraint FK_CERTIFICATE_TO_RESUME foreign key(LICENCE_CODE) references CERTIFICATE(L_NO),
	constraint FK_CAREER_TO_RESUME foreign key(DV_CODE) references CAREER(DV_CODE),
	constraint FK_EDUCATION_TO_RESUME foreign key(ACADEMIC_CODE) references EDUCATION(ACADEMIC_CODE),
	constraint FK_HOPE_WORKING_TO_RESUME foreign key(DESIREDWORK_CODE) references HOPE_WORKING(HOPEWORK_CODE),
	constraint FK_MEMBER_TO_RESUME foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE)
);
--drop sequence RESUME_SEQ;
alter table resume modify ACADEMIC_CODE  null;
alter table resume modify MEMBER_CODE  null;
alter table resume add (picture varchar2(100));
alter table resume modify (RESUMETITLE varchar2(100));
alter table resume modify (RESUMEREGDATE DEFAULT sysdate);

create sequence RESUME_SEQ
increment by 1
start with 1
nocache;



-- �Խ���      11
CREATE TABLE BOARD (
	BOARD_CODE1        NUMBER      primary key, -- �Խ��� �ڵ�
	FIR_ADMIN               VARCHAR(50) ,                 -- ���� ��� ������
	BOARDNAME            VARCHAR(30) NOT NULL,  -- �Խ��� �̸�
	BOARDREGDATE1    DATE,                              -- �Խ��� ���� �����
	BOARDUPDATE         DATE,                              -- �Խ��� ������ ������
	LAST_ADMIN             VARCHAR(50) ,              -- ������ ���� ������
	BOARD_ORDER        VARCHAR(50) ,              -- �Խ��� ����
	USAGE                     VARCHAR(50) ,              -- ��� ����
    COMMENTAGE          VARCHAR(50) ,                 -- ��� ���� ����
	UPAGE                     VARCHAR(50) ,                -- ���ε� ���� ����
	UPNUMAGE              VARCHAR(50) ,                 -- ���ε� ���� �� ����
	UPSIZEAGE              NUMBER,                          -- ÷�� ������ ���� ������
	TYPE_CODE             NUMBER      NOT NULL,       -- ���� �ڵ�
	constraint FK_board_kind_TO_BOARD foreign key(TYPE_CODE) references board_kind(TYPE_CODE)
);
alter table board modify usage default 'Y';
alter table board modify BOARDREGDATE1 default sysdate;
--drop sequence BOARD_SEQ;
create sequence BOARD_SEQ
increment by 1
start with 1
nocache;



-- ������ �� ����    12
CREATE TABLE CUSTEXT (
	CUSTEXT_CODE             NUMBER         primary key, -- ������ �� �ڵ�
	CUSTEXTCATEGORY      VARCHAR(20) NOT NULL, -- ��������
	CUSTITLE                       VARCHAR(50) NOT NULL, -- ����
	CUSCONTENT                 CLOB             NOT NULL, -- ����
	CUS_REGDATE               DATE,                              -- �����
	MEMBER_CODE              NUMBER        NOT NULL,  -- ȸ�� �ڵ�
	constraint FK_MEMBER_TO_CUSTEXT foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE)
);
--drop sequence CUSTEXT_SEQ;
create sequence CUSTEXT_SEQ
increment by 1
start with 1
nocache;



-- ä�����     13
CREATE TABLE JOBOPENING (
	JOBOPENING                       NUMBER       primary key,  -- ä����� �ڵ�
	JOBTITLE                            VARCHAR(20)  NOT NULL,  -- ����
	LOCALCHECK                     VARCHAR(10)  NOT NULL,   -- ��������
	SUBWAYINFO                     VARCHAR(50)  ,                   -- ������
	WORKWAY                         VARCHAR(30)  ,                   -- �ٹ����
	WORKDATE                       DATE,                                    -- �ٹ��Ⱓ
	DAYOFWEEK                     VARCHAR(20)  ,                    -- �ٹ�����
	WORKTIME                       DATE,                                    -- �ٹ��ð�
	PAYWAY                           VARCHAR(30)  ,                      -- �޿����
	PAY                                   VARCHAR(30)  ,                      -- �޿�
	WORKFORM                      VARCHAR(30)  ,                      -- �ٹ�����
	WELFARE                          VARCHAR(50)  ,                       -- �����Ļ�
	GENDER                            VARCHAR(20)  ,                      -- ����
	AGELIMIT                          NUMBER,                                -- ���ѿ���
	ACADEMIC_CONDITION      VARCHAR(50)  ,                       -- �з�����
	CAREER                             VARCHAR(50)  ,                      -- ��»���
	SWEETENER                       VARCHAR(100) ,                     -- �������
	RECRUIT                             NUMBER,                               -- �����ο�
	RECRUITMENT_TARGET      VARCHAR(50)  ,                     -- �������
	END_DATE                          DATE,                                     -- ����������
	RECEIVEWAY                      VARCHAR(50)  ,                       -- �������
	SUBMIT                               VARCHAR(50)  ,                       -- ���⼭��
	APPLICATIONHANDBOOK     VARCHAR(50)  ,                        -- �󼼸����䰭
	JOBREGDATE                     DATE,                                    -- �����
	HITS                                   NUMBER,                                 -- ��ȸ��
	REPORTCHEKE                  VARCHAR(10)       DEFAULT 'N',     -- �Ű���
	ADMINAGREE                      VARCHAR(10)       DEFAULT 'N',   -- ������ ����
	CATEGORY                        VARCHAR(50)  ,                          -- ī�װ�
	COMPANYIMAGE                VARCHAR(150)        NULL,           -- ���� �̹���
	COMPANY_CODE                NUMBER              NOT NULL,        -- ȸ���ڵ�
	constraint FK_COMPANY_TO_JOBOPENING foreign key(COMPANY_CODE) references COMPANY(COMPANY_CODE)
);

alter table jobopening modify welfare varchar(500);
alter table jobopening modify localcheck varchar(50);

--drop sequence JOBOPENING_SEQ;
create sequence JOBOPENING_SEQ
increment by 1
start with 1
nocache;


-- �ڰ���      14
CREATE TABLE CERTIFICATE (
	L_NO                 NUMBER           primary key,              -- �ڰ�����ȣ
	L_NAME             VARCHAR(50)   NOT NULL,                -- �ڰ����̸�
	L_GETDATE       DATE                DEFAULT sysdate,     -- �����
	L_INSTITUTION  VARCHAR(50)    NOT NULL                 -- ������
);
ALTER TABLE CERTIFICATE modify L_GETDATE varchar2(50); 

--drop sequence CERTIFICATE_SEQ;
create sequence CERTIFICATE_SEQ
increment by 1
start with 1
nocache;



-- �������� 15
CREATE TABLE NOTICE (
	NOTIFY_CODE           NUMBER      primary key,      -- �������� �ڵ�
	NOTIFYTITLE             VARCHAR(50) NOT NULL,     -- ����
	NOTIFYCONTENT       CLOB  ,                               -- ����
	NOTIFYDATE             DATE,                                  -- �Խ� ��¥ 
	ADMIN_CODE            NUMBER,                              -- ������ �ڵ�
	constraint FK_MANAGER_TO_NOTICE foreign key(ADMIN_CODE) references MANAGER(ADMIN_CODE)
);
ALTER TABLE NOTICE ADD(READCOUNT number); --��ȸ��
ALTER TABLE NOTICE MODIFY(NOTIFYDATE DATE DEFAULT sysdate);

--drop sequence NOTICE_SEQ;
create sequence NOTICE_SEQ
increment by 1
start with 1
nocache;



-- ȸ��       16
CREATE TABLE MEMBER (
	MEMBERID                   VARCHAR(30)  NOT NULL, -- ���̵�
	REGDATE                     DATE,                               -- ������
	MEMBERNAME             VARCHAR(30)  NOT NULL, -- �̸�
	ZIPCODE                      VARCHAR(30)  NOT NULL, -- �����ȣ
	ADDRESS                     VARCHAR(30)  NOT NULL, -- �ּ�
	ADDRESSDETAIL          VARCHAR(100) NOT NULL, -- ���ּ�
	MEMBER_CODE           NUMBER       primary key, -- ȸ�� �ڵ�
	WITHDRAWALDATE      DATE,                              -- Ż����
	PWD                           VARCHAR(30)  NOT NULL, -- ��й�ȣ
	BIRTH                         VARCHAR(30)  NOT NULL, -- �������
	MEMBERGENDER        VARCHAR(30)  NOT NULL, -- ����
	EMAIL                         VARCHAR(100) NOT NULL, -- �̸���
	PICTURE                     VARCHAR(100) ,               -- ����
	TEL                             VARCHAR(50)  NOT NULL, -- ��ȭ��ȣ
	COMPANY_CODE         NUMBER         NOT NULL,  -- ȸ���ڵ�
    constraint FK_COMPANY_TO_MEMBER foreign key(COMPANY_CODE) references COMPANY(COMPANY_CODE)
);
alter table MEMBER modify COMPANY_CODE  null;
ALTER TABLE member DROP COLUMN picture;
ALTER TABLE member DROP COLUMN company_code;
ALTER TABLE member add (authority_code number);
ALTER TABLE MEMBER MODIFY (ADDRESS VARCHAR2(200));

alter table member modify zipcode null;
alter table member modify address null;
alter table member modify addressdetail null;
alter table member modify birth null;
alter table member modify membergender null;

SELECT * FROM MEMBER;
SELECT * FROM COMPANY;

alter table member add (company_code number);
alter table member add constraint fk_member foreign key(COMPANY_CODE) references company(company_code);

--����� ��ȣ
ALTER TABLE MEMBER MODIFY (REGDATE DEFAULT SYSDATE);

--�����÷� ȸ������ �̷¼��� 
alter table member add constraint AUTHORITY_CODE_FK FOREIGN KEY(AUTHORITY_CODE)
REFERENCES AUTHORITY(AUTHORITY_CODE) ON DELETE CASCADE;
ALTER TABLE COMPANY RENAME COLUMN COMPANY_CODE TO BUSSINESS_NUMBER;

--drop sequence MEMBER_SEQ;
create sequence MEMBER_SEQ
increment by 1
start with 1
nocache;


-- ������  17
CREATE TABLE MANAGER (
	ADMIN_CODE        NUMBER          primary key,  -- ������ �ڵ�
	ADMINID               VARCHAR(50)   NOT NULL,   -- �����ھ��̵�
	ADMINPWD           VARCHAR(50)   NOT NULL,   -- ��й�ȣ
	AUTHORITY          VARCHAR(50) ,                    -- ����
	AUT_REGDATE     DATE,                                  -- ������
	AUT_DELDATE      DATE                                   -- ������
);
alter table manager modify AUT_REGDATE default sysdate;
alter table manager modify adminid unique;
--drop sequence MANAGER_SEQ;
create sequence MANAGER_SEQ
increment by 1
start with 1
nocache;


--����    18
create table authority(
    AUTHORITY_CODE   NUMBER          PRIMARY KEY,
    AUTHORITY_NAME   VARCHAR(50)   NOT NULL
);
insert into authority values(AUTHORITY_SEQ.NEXTVAL, '����ȸ��');
insert into authority values(AUTHORITY_SEQ.NEXTVAL, '���ȸ�� ��û');
insert into authority values(AUTHORITY_SEQ.NEXTVAL, '���ȸ�� ����');
create sequence AUTHORITY_SEQ
increment by 1
start with 1
nocache;





-- ����   19
CREATE TABLE LOCATION (
	LOCAL_CODE      NUMBER           primary key,      -- �����ڵ�
	SIDO                   VARCHAR(50)   NOT NULL,        -- �õ�
	GUGUN               VARCHAR(50)   NOT NULL         -- �ñ���
);
--drop sequence LOCATION_SEQ;
create sequence LOCATION_SEQ
increment by 1
start with 1
nocache;

-- �з�   20
CREATE TABLE EDUCATION (
	ACADEMIC_CODE       NUMBER           primary key,          -- �з��ڵ�
	SCHOOLNAME           VARCHAR(50)    NOT NULL,            -- �б���
	MAJOR                      VARCHAR(50)    NOT NULL,            -- ������
	DEGREE                    VARCHAR(50)    NOT NULL,            -- ����
	GRADUATE                DATE                DEFAULT sysdate,  -- �����⵵
	GRADUATECHECK      VARCHAR(20)   DEFAULT 'N'          -- ��������
);
--drop sequence EDUCATION_SEQ;
ALTER TABLE EDUCATION ADD(SCHOOLLOCAL varchar2(50)); --�б�����
ALTER TABLE EDUCATION ADD(GRADUATETYPE varchar2(50)); --���� ����(����,����,����,����)
ALTER TABLE EDUCATION DROP COLUMN GRADUATE;
alter table EDUCATION add(GRADUATE varchar2(50)); 

create sequence EDUCATION_SEQ
increment by 1
start with 1
nocache;



-- ����ڰ���    21
CREATE TABLE LANGCERTIFICATION (
	LANGLICENCE_CODE        NUMBER          primary key,              -- ����ڰ����ڵ�
	LANGLICENCENAME         VARCHAR(50) ,                                 -- ����ڰ����̸�
	GETDATE                         DATE                DEFAULT sysdate,     -- �����
	INSTITUTE                        VARCHAR(50)                                  -- ������
);
--drop sequence LANGUAGE_CERTIFICATION_SEQ;
ALTER TABLE LANGCERTIFICATION ADD(CERTIFICATIONTYPE varchar2(50)); --�ڰ��� ���� (�ڰ���,����,���󳻿�)
ALTER TABLE LANGCERTIFICATION RENAME COLUMN GETDATE TO LANG_GETDATE;
ALTER TABLE LANGCERTIFICATION ADD(language varchar2(50));--���
ALTER TABLE LANGCERTIFICATION ADD(langpoint varchar2(50));--�������
ALTER TABLE LANGCERTIFICATION ADD(lang_grade varchar2(50));--���޼�
ALTER TABLE LANGCERTIFICATION DROP COLUMN LANG_GETDATE;
ALTER TABLE LANGCERTIFICATION ADD(LANG_GETDATE varchar2(50)); 
create sequence LANGCERTIFICATION_SEQ
increment by 1
start with 1
nocache;



-- ��»���     22
CREATE TABLE CAREER (
	DV_CODE                NUMBER            primary key,            -- �����ڵ�
	COMPANYNAME      VARCHAR(30)     NOT NULL,              -- ȸ���
	WORKTERM            DATE                 DEFAULT sysdate,    -- �ٹ��Ⱓ
	CHARGEWORK       VARCHAR(50)     NOT NULL               -- ������
);
ALTER TABLE CAREER ADD(workcheck varchar2(50)); --��±��� (����,���)
ALTER TABLE CAREER ADD(jobgrade varchar2(50)); --����
ALTER TABLE CAREER ADD(workcondition varchar2(50)); --�ٹ�����(������,����)
ALTER TABLE CAREER DROP COLUMN WORKTERM;
ALTER TABLE CAREER ADD(WORKTERM varchar2(50));       

--drop sequence CAREER_SEQ;
create sequence CAREER_SEQ
increment by 1
start with 1
nocache;


-- ����      23
CREATE TABLE SERVICE (
	SERVICE_CODE          NUMBER             primary key, -- ���� �ڵ�
	SERVICENAME            VARCHAR(30)     NOT NULL, -- ���� �̸�
	SERVICEPRICE           NUMBER             NOT NULL, -- ���� ����
	SERVICECONTENT      CLOB                 NOT NULL, -- ���� ����
	SERVICEDAY              NUMBER                              -- ���� �ϼ�
);
--drop sequence SERVICE_SEQ;
create sequence SERVICE_SEQ
increment by 1
start with 1
nocache;


-- ���ε� ����       24
CREATE TABLE upload_info (
	UPLOAD_CODE               NUMBER      primary key, -- ���ε� �ڵ�
    FILENAME                       VARCHAR(30) ,               -- ���ε� ���ϸ�
	FILESIZE                         NUMBER,                       -- ���ϻ�����
	DOWNCOUNT                  NUMBER,                       -- �ٿ�ε� ��
	ORIGINALFILENAME        VARCHAR(50) ,               -- ���� ���ϸ�
	BOARD_CODE2               NUMBER,                        -- �Խñ� �ڵ�
	constraint FK_POST_TO_upload_info foreign key(BOARD_CODE2) references POST(BOARD_CODE2)
);
--drop sequence upload_info_SEQ;
create sequence upload_info_SEQ
increment by 1
start with 1
nocache;



-- 2������     25
CREATE TABLE SECOND (
	SECOND_CODE   NUMBER             primary key, -- 2�������ڵ�
	SECONDNAME    VARCHAR(50) ,                       -- 2��������
    THIRD_CODE      NUMBER                                -- 3�������ڵ�
);
--drop sequence SECOND_OCCUPATION_SEQ;
create sequence SECOND_SEQ
increment by 1
start with 1
nocache;



-- ȸ��26
DROP TABLE COMPANY  CASCADE CONSTRAINTS;
CREATE TABLE COMPANY (
	COMPANY_CODE     NUMBER          primary key, -- ȸ���ڵ�
	COMPANYNAME      VARCHAR(50)    NOT NULL, -- ȸ���
	COMPANYNO          VARCHAR(50)    NOT NULL, -- ����ڹ�ȣ
	IMAGE                    VARCHAR(100)                   -- �ΰ� �̹���
);
alter table company add (zipcode varchar2(30));
alter table company add (address varchar2(200));
alter table company add (addressdetail varchar2(200));
alter table company rename column zipcode to company_zipcode;
alter table company rename column address to company_address;
alter table company rename column addressdetail to company_addressdetail;


--drop sequence COMPANY_SEQ;
create sequence COMPANY_SEQ
increment by 1
start with 1
nocache;



-- �������� ���          27
CREATE TABLE NOTICE_CMT2 (
	COMMENT_CODE    NUMBER    primary key,     -- ��� �ڵ�2
	MEMBER_CODE      NUMBER    NOT NULL,       -- ȸ�� �ڵ�
	NOTIFY_CODE        NUMBER    NOT NULL,       -- �������� �ڵ�
	COMCONTENT        CLOB        NOT NULL,        -- ����
	COMREGDATE        DATE       DEFAULT sysdate, -- �����
	constraint FK_MEMBER_TO_NOTICE_CMT2 foreign key(MEMBER_CODE) references MEMBER(MEMBER_CODE),
	constraint FK_NOTICE_TO_NOTICE_CMT2 foreign key(NOTIFY_CODE) references NOTICE(NOTIFY_CODE)
);
--drop sequence NOTICE_CMT2_SEQ;
create sequence NOTICE_CMT2_SEQ
increment by 1
start with 1
nocache;



-- 1������ 28
CREATE TABLE FIRST(
	FIRST_CODE          NUMBER           primary key, -- 1�������ڵ�
	FIRSTNAME           VARCHAR(50) ,                     -- 1��������
	SECOND_CODE     NUMBER                              -- 2�������ڵ�
);
--drop sequence FIRST_OCCUPATION_SEQ;
create sequence FIRST_SEQ
increment by 1
start with 1
nocache;



-- ��ũ��  29
CREATE TABLE SCRAP (
	SCRAP_CODE                   NUMBER primary key, -- ��ũ���ڵ�
	SCRAPDATE                     DATE,                        -- ��ũ����¥
	SCRAPMEMBER_CODE     NUMBER NOT NULL,   -- ��ũ���ϴ� ȸ�� �ڵ�
	JOBOPENING_CODE         NUMBER NOT NULL,   -- ä����� �ڵ�
	RESUME_CODE                NUMBER NOT NULL,    -- �̷¼� �ڵ�
	constraint FK_MEMBER_TO_SCRAP foreign key(SCRAPMEMBER_CODE) references MEMBER(MEMBER_CODE),
	constraint FK_JOBOPENING_TO_SCRAP foreign key(JOBOPENING_CODE) references JOBOPENING(JOBOPENING),
	constraint FK_RESUME_TO_SCRAP foreign key(RESUME_CODE) references RESUME(RESUME_CODE)
);
alter table scrap modify resume_code null;      --����� ���忡�� ��ũ���ҽ� resume_code �ηκ���
alter table scrap modify jobopening_code null;     --�������� ���忡�� ��ũ���ҽ� jobopening_code �η� ����
--drop sequence SCRAP_SEQ;
create sequence SCRAP_SEQ
increment by 1
start with 1
nocache;

--�˾� 30
CREATE TABLE POPUP
(
ADMIN_CODE	NUMBER,
POPUP_NAME	VARCHAR(50),
POPUP_IMG	VARCHAR(100),
WIDTH		NUMBER,
HEIGHT		NUMBER,
LEFT	    NUMBER,
TOP		    NUMBER,
REGDATE		DATE,
USAGE		VARCHAR(10),
POPUP_CODE	NUMBER PRIMARY KEY,
constraint FK_RESUME_TO_ foreign key(ADMIN_CODE) references MANAGER(ADMIN_CODE)
);
create sequence POPUP_SEQ
increment by 1
start with 1
nocache;

SELECT * FROM POPUP;



-- ���� 
ALTER TABLE "PAYMENT"
	ADD
		CONSTRAINT "FK_SERVICE_TO_PAYMENT" -- ����  -> ���� 
		FOREIGN KEY (
			"SERVICE_CODE" -- ���� �ڵ�
		)
		REFERENCES "SERVICE" ( -- ���� 
			"SERVICE_CODE" -- ���� �ڵ�
		);

-- ���� 
ALTER TABLE "PAYMENT"
	ADD
		CONSTRAINT "FK_MEMBER_TO_PAYMENT" -- ȸ�� -> ���� 
		FOREIGN KEY (
			"MEMBER_CODE" -- ȸ�� �ڵ�
		)
		REFERENCES "MEMBER" ( -- ȸ��
			"MEMBER_CODE" -- ȸ�� �ڵ�
		);

-- ��������(�̷¼�) 
ALTER TABLE "OPENCHECK"
	ADD
		CONSTRAINT "FK_MEMBER_TO_OPENCHECK" -- ȸ�� -> ��������(�̷¼�) 
		FOREIGN KEY (
			"MEMBER_CODE" -- ȸ�� �ڵ�
		)
		REFERENCES "MEMBER" ( -- ȸ��
			"MEMBER_CODE" -- ȸ�� �ڵ�
		);

-- ��������(�̷¼�) 
ALTER TABLE "OPENCHECK"
	ADD
		CONSTRAINT "FK_RESUME_TO_OPENCHECK" -- �̷¼� -> ��������(�̷¼�) 
		FOREIGN KEY (
			"RESUME_CODE" -- �̷¼� �ڵ�
		)
		REFERENCES "RESUME" ( -- �̷¼�
			"RESUME_CODE" -- �̷¼� �ڵ�
		);

-- �Խñ�
ALTER TABLE "POST"
	ADD
		CONSTRAINT "FK_MEMBER_TO_POST" -- ȸ�� -> �Խñ�
		FOREIGN KEY (
			"MEMBER_CODE" -- ȸ�� �ڵ�
		)
		REFERENCES "MEMBER" ( -- ȸ��
			"MEMBER_CODE" -- ȸ�� �ڵ�
		);

-- �Խñ�
ALTER TABLE "POST"
	ADD
		CONSTRAINT "FK_BOARD_TO_POST" -- �Խ��� -> �Խñ�
		FOREIGN KEY (
			"BOARD_CODE" -- �Խ��� �ڵ�
		)
		REFERENCES "BOARD" ( -- �Խ���
			"BOARD_CODE1" -- �Խ��� �ڵ�
		);

-- ����ٹ�����
ALTER TABLE "HOPE_WORKING"
	ADD
		CONSTRAINT "FK_LOCATION_TO_HOPE_WORKING" -- ���� -> ����ٹ�����
		FOREIGN KEY (
			"LOCAL_CODE" -- �����ڵ�
		)
		REFERENCES "LOCATION" ( -- ����
			"LOCAL_CODE" -- �����ڵ�
		);

-- ����ٹ�����
ALTER TABLE "HOPE_WORKING"
	ADD
		CONSTRAINT "FK_FIRST_TO_HOPE_WORKING" -- 1������ -> ����ٹ�����
		FOREIGN KEY (
			"FIRSTJOB_CODE" -- 1�������ڵ�
		)
		REFERENCES "FIRST" ( -- 1������
			"FIRST_CODE" -- 1�������ڵ�
		);

-- ������Ȳ
ALTER TABLE "APPLY"
	ADD
		CONSTRAINT "FK_MEMBER_TO_APPLY" -- ȸ�� -> ������Ȳ
		FOREIGN KEY (
			"MEMBER_CODE" -- ȸ�� �ڵ�
		)
		REFERENCES "MEMBER" ( -- ȸ��
			"MEMBER_CODE" -- ȸ�� �ڵ�
		);

-- ������Ȳ
ALTER TABLE "APPLY"
	ADD
		CONSTRAINT "FK_JOBOPENING_TO_APPLY" -- ä����� -> ������Ȳ
		FOREIGN KEY (
			"JOBOPENING" -- ä����� �ڵ�
		)
		REFERENCES "JOBOPENING" ( -- ä�����
			"JOBOPENING" -- ä����� �ڵ�
		);

-- �����Ǵ亯
ALTER TABLE "CUSANSWER"
	ADD
		CONSTRAINT "FK_CUSTEXT_TO_CUSANSWER" -- ������ �� ���� -> �����Ǵ亯
		FOREIGN KEY (
			"CUSTEXT_CODE" -- ������ �� �ڵ�
		)
		REFERENCES "CUSTEXT" ( -- ������ �� ����
			"CUSTEXT_CODE" -- ������ �� �ڵ�
		);

-- �����Ǵ亯
ALTER TABLE "CUSANSWER"
	ADD
		CONSTRAINT "FK_MANAGER_TO_CUSANSWER" -- ������ -> �����Ǵ亯
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ �ڵ�
		)
		REFERENCES "MANAGER" ( -- ������
			"ADMIN_CODE" -- ������ �ڵ�
		);

-- �Խ��� ���
ALTER TABLE "NOTICE_CMT"
	ADD
		CONSTRAINT "FK_MEMBER_TO_NOTICE_CMT" -- ȸ�� -> �Խ��� ���
		FOREIGN KEY (
			"MEMBER_CODE" -- ȸ�� �ڵ�
		)
		REFERENCES "MEMBER" ( -- ȸ��
			"MEMBER_CODE" -- ȸ�� �ڵ�
		);

-- �Խ��� ���
ALTER TABLE "NOTICE_CMT"
	ADD
		CONSTRAINT "FK_POST_TO_NOTICE_CMT" -- �Խñ� -> �Խ��� ���
		FOREIGN KEY (
			"BOARD_CODE2" -- �Խñ� �ڵ�
		)
		REFERENCES "POST" ( -- �Խñ�
			"BOARD_CODE2" -- �Խñ� �ڵ�
		);

-- �̷¼�
ALTER TABLE "RESUME"
	ADD
		CONSTRAINT "FK_LANGCERTIFICATION_TO_RESUME" -- ����ڰ��� -> �̷¼�
		FOREIGN KEY (
			"LANGLICENCE_CODE" -- ����ڰ����ڵ�
		)
		REFERENCES "LANGCERTIFICATION" ( -- ����ڰ���
			"LANGLICENCE_CODE" -- ����ڰ����ڵ�
		);

-- �̷¼�
ALTER TABLE "RESUME"
	ADD
		CONSTRAINT "FK_CERTIFICATE_TO_RESUME" -- �ڰ��� -> �̷¼�
		FOREIGN KEY (
			"LICENCE_CODE" -- �ڰ�����ȣ
		)
		REFERENCES "CERTIFICATE" ( -- �ڰ���
			"L_NO" -- �ڰ�����ȣ
		);

-- �̷¼�
ALTER TABLE "RESUME"
	ADD
		CONSTRAINT "FK_CAREER_TO_RESUME" -- ��»��� -> �̷¼�
		FOREIGN KEY (
			"DV_CODE" -- �����ڵ�
		)
		REFERENCES "CAREER" ( -- ��»���
			"DV_CODE" -- �����ڵ�
		);

-- �̷¼�
ALTER TABLE "RESUME"
	ADD
		CONSTRAINT "FK_EDUCATION_TO_RESUME" -- �з� -> �̷¼�
		FOREIGN KEY (
			"ACADEMIC_CODE" -- �з��ڵ�
		)
		REFERENCES "EDUCATION" ( -- �з�
			"ACADEMIC_CODE" -- �з��ڵ�
		);

-- �̷¼�
ALTER TABLE "RESUME"
	ADD
		CONSTRAINT "FK_HOPE_WORKING_TO_RESUME" -- ����ٹ����� -> �̷¼�
		FOREIGN KEY (
			"DESIREDWORK_CODE" -- ����ٹ��ڵ�
		)
		REFERENCES "HOPE_WORKING" ( -- ����ٹ�����
			"HOPEWORK_CODE" -- ����ٹ��ڵ�
		);

-- �̷¼�
ALTER TABLE "RESUME"
	ADD
		CONSTRAINT "FK_MEMBER_TO_RESUME" -- ȸ�� -> �̷¼�
		FOREIGN KEY (
			"MEMBER_CODE" -- ȸ�� �ڵ�
		)
		REFERENCES "MEMBER" ( -- ȸ��
			"MEMBER_CODE" -- ȸ�� �ڵ�
		);

-- �Խ���
ALTER TABLE "BOARD"
	ADD
		CONSTRAINT "FK_board_kind_TO_BOARD" -- �Խ��� ���� -> �Խ���
		FOREIGN KEY (
			"TYPE_CODE" -- ���� �ڵ�
		)
		REFERENCES "board_kind" ( -- �Խ��� ����
			"TYPE_CODE" -- ���� �ڵ�
		);

-- ������ �� ����
ALTER TABLE "CUSTEXT"
	ADD
		CONSTRAINT "FK_MEMBER_TO_CUSTEXT" -- ȸ�� -> ������ �� ����
		FOREIGN KEY (
			"MEMBER_CODE" -- ȸ�� �ڵ�
		)
		REFERENCES "MEMBER" ( -- ȸ��
			"MEMBER_CODE" -- ȸ�� �ڵ�
		);

-- ä�����
ALTER TABLE "JOBOPENING"
	ADD
		CONSTRAINT "FK_COMPANY_TO_JOBOPENING" -- ȸ�� -> ä�����
		FOREIGN KEY (
			"COMPANY_CODE" -- ȸ���ڵ�
		)
		REFERENCES "COMPANY" ( -- ȸ��
			"COMPANY_CODE" -- ȸ���ڵ�
		);

-- ��������
ALTER TABLE "NOTICE"
	ADD
		CONSTRAINT "FK_MANAGER_TO_NOTICE" -- ������ -> ��������
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ �ڵ�
		)
		REFERENCES "MANAGER" ( -- ������
			"ADMIN_CODE" -- ������ �ڵ�
		);

-- ȸ��
ALTER TABLE "MEMBER"
	ADD
		CONSTRAINT "FK_COMPANY_TO_MEMBER" -- ȸ�� -> ȸ��
		FOREIGN KEY (
			"COMPANY_CODE" -- ȸ���ڵ�
		)
		REFERENCES "COMPANY" ( -- ȸ��
			"COMPANY_CODE" -- ȸ���ڵ�
		);

-- ���ε� ����
ALTER TABLE "upload_info"
	ADD
		CONSTRAINT "FK_POST_TO_upload_info" -- �Խñ� -> ���ε� ����
		FOREIGN KEY (
			"BOARD_CODE2" -- �Խñ� �ڵ�
		)
		REFERENCES "POST" ( -- �Խñ�
			"BOARD_CODE2" -- �Խñ� �ڵ�
		);

-- 2������
ALTER TABLE "SECOND"
	ADD
		CONSTRAINT "FK_THIRD_TO_SECOND" -- 3������ -> 2������
		FOREIGN KEY (
			"THIRD_CODE" -- 3�������ڵ�
		)
		REFERENCES "THIRD" ( -- 3������
			"THIRD_CODE" -- 3�������ڵ�
		);

-- �������� ���
ALTER TABLE "NOTICE_CMT2"
	ADD
		CONSTRAINT "FK_MEMBER_TO_NOTICE_CMT2" -- ȸ�� -> �������� ���
		FOREIGN KEY (
			"MEMBER_CODE" -- ȸ�� �ڵ�
		)
		REFERENCES "MEMBER" ( -- ȸ��
			"MEMBER_CODE" -- ȸ�� �ڵ�
		);

-- �������� ���
ALTER TABLE "NOTICE_CMT2"
	ADD
		CONSTRAINT "FK_NOTICE_TO_NOTICE_CMT2" -- �������� -> �������� ���
		FOREIGN KEY (
			"NOTIFY_CODE" -- �������� �ڵ�
		)
		REFERENCES "NOTICE" ( -- ��������
			"NOTIFY_CODE" -- �������� �ڵ�
		);

-- 1������
ALTER TABLE "FIRST"
	ADD
		CONSTRAINT "FK_SECOND_TO_FIRST" -- 2������ -> 1������
		FOREIGN KEY (
			"SECOND_CODE" -- 2�������ڵ�
		)
		REFERENCES "SECOND" ( -- 2������
			"SECOND_CODE" -- 2�������ڵ�
		);

-- ��ũ��
ALTER TABLE "SCRAP"
	ADD
		CONSTRAINT "FK_MEMBER_TO_SCRAP" -- ȸ�� -> ��ũ��
		FOREIGN KEY (
			"SCRAPMEMBER_CODE" -- ��ũ���ϴ� ȸ�� �ڵ�
		)
		REFERENCES "MEMBER" ( -- ȸ��
			"MEMBER_CODE" -- ȸ�� �ڵ�
		);

-- ��ũ��
ALTER TABLE "SCRAP"
	ADD
		CONSTRAINT "FK_JOBOPENING_TO_SCRAP" -- ä����� -> ��ũ��
		FOREIGN KEY (
			"JOBOPENING_CODE" -- ä����� �ڵ�
		)
		REFERENCES "JOBOPENING" ( -- ä�����
			"JOBOPENING" -- ä����� �ڵ�
		);

-- ��ũ��
ALTER TABLE "SCRAP"
	ADD
		CONSTRAINT "FK_RESUME_TO_SCRAP" -- �̷¼� -> ��ũ��
		FOREIGN KEY (
			"RESUME_CODE" -- �̷¼� �ڵ�
		)
		REFERENCES "RESUME" ( -- �̷¼�
			"RESUME_CODE" -- �̷¼� �ڵ�
		);