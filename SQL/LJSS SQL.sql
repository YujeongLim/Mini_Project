CREATE USER LJSS IDENTIFIED BY LJSS;
GRANT RESOURCE,CONNECT TO LJSS;


DROP TABLE TBL_MEMBER CASCADE CONSTRAINTS;
DROP TABLE TBL_PRODUCT CASCADE CONSTRAINTS;
DROP TABLE TBL_EVENT;
DROP TABLE TBL_NOTICE;
DROP TABLE TBL_QNA;
DROP TABLE TBL_CATEGORY CASCADE CONSTRAINTS;

CREATE TABLE TBL_MEMBER (
  MEM_CODE NUMBER PRIMARY KEY,
  MEM_ADMIN VARCHAR(1) DEFAULT 'N' CONSTRAINT AA_STATUS NOT NULL ,
  CONSTRAINT ADMIN_STATUS CHECK(MEM_ADMIN IN ('Y','N')),
  MEM_NAME VARCHAR(20) ,
  MEM_BIRTH VARCHAR(20) ,
  GENDER VARCHAR2(10) CHECK (GENDER IN('M', 'F')),
  MEM_ID VARCHAR(20) ,
  MEM_PWD VARCHAR(100) ,
  MEM_PHONE VARCHAR(20),
  MEM_ADRR VARCHAR(100) ,
  MEM_EMAIL VARCHAR(20) ,
  MEM_ACC_DATE DATE DEFAULT SYSDATE,
  MEM_OUT VARCHAR(1) DEFAULT 'N' CONSTRAINT NN_STATUS NOT NULL,
  CONSTRAINT OUT_STATUS CHECK(MEM_OUT IN ('Y','N'))
  );
 
  
  
  CREATE SEQUENCE mem_code
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;

  DROP SEQUENCE MEM_CODE;
  
  CREATE OR REPLACE TRIGGER TBL_MEMBER_TRIGGER
  BEFORE INSERT ON TBL_MEMBER
  FOR EACH ROW
  BEGIN
    :NEW.MEM_CODE := MEM_CODE.NEXTVAL;
  END;

  DROP TRIGGER TBL_MEMBER_TRIGGER;
  
  
  INSERT INTO TBL_MEMBER VALUES(1,'Y','관리자','1999.01.01','F','admin','admin','01012345678','서울 영등포구','admin@naver.com','2023-12-01','N');
  INSERT INTO TBL_MEMBER VALUES (2, 'N', '홍길동', '1990-01-15', 'M', 'hong_gil_dong', '비밀번호1', '01012345678', '서울시 강남구', 'hong@example.com','2023-12-01', 'N');
  INSERT INTO TBL_MEMBER VALUES  (3, 'N', '이순신', '1985-07-22', 'M', 'lee_sunshin', '비밀번호2', '01098765432', '서울시 종로구', 'lee@example.com','2023-12-01', 'N');
  INSERT INTO TBL_MEMBER VALUES  (4, 'N', '이순신', '1985-07-22', 'M', 'SSSS', 'SSSS', '01098765432', '서울시 종로구', 'lee@example.com','2023-12-01', 'N');
  COMMIT;
 
 
  CREATE TABLE TBL_PRODUCT (
  
  PRO_CODE VARCHAR(20),
  PRO_NAME VARCHAR(500) ,
  PRO_PRICE NUMBER ,
  CATE_CODE VARCHAR(20) ,
  PRO_SIZE VARCHAR(10) ,
  PRO_STOCK NUMBER,
  PRO_ENT_DATE DATE DEFAULT SYSDATE,
  CONSTRAINT FK_CATE_CODE FOREIGN KEY (CATE_CODE) REFERENCES TBL_CATEGORY(CATE_CODE),
  PRO_STATUS VARCHAR(1) DEFAULT 'Y' CONSTRAINT EE_STATUS NOT NULL ,
  CONSTRAINT PRODUCT_STATUS CHECK(PRO_STATUS IN ('Y','N')),
  PRO_IMG1 VARCHAR(100),
  PRO_IMG2 VARCHAR(100)

  );
 CREATE SEQUENCE PRO_CODE
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;

  DROP SEQUENCE PRO_CODE;
  
  CREATE OR REPLACE TRIGGER TBL_PRODUCT_TRIGGER
  BEFORE INSERT ON TBL_PRODUCT
  FOR EACH ROW
  BEGIN
    :NEW.PRO_CODE := PRO_CODE.NEXTVAL;
  END;

  DROP TRIGGER TBL_PRODUCT_TRIGGER;
  


INSERT INTO TBL_PRODUCT (PRO_CODE, PRO_NAME, PRO_PRICE, CATE_CODE, PRO_SIZE, PRO_STOCK, PRO_ENT_DATE)
VALUES ('1', '백 포인트 그래픽 스웻셔츠 [다크 브라운]', 150000,'1', 'XL', 100, '2023-12-07');
INSERT INTO TBL_PRODUCT (PRO_CODE, PRO_NAME, PRO_PRICE, CATE_CODE, PRO_SIZE, PRO_STOCK, PRO_ENT_DATE)
VALUES ('2', '백 포인트 그래픽 스웻셔츠 [다크 브라운]', 150000,'2', 'XL', 100, '2023-12-07');
commit;
select *
from tbl_product
where pro_code=4;

delete tbl_product; 
  
 

CREATE TABLE TBL_NOTICE(
  NOTICE_NO NUMBER PRIMARY KEY, 
  NOTICE_TITLE VARCHAR2(100) NOT NULL,
  NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
  NOITCE_WRITER VARCHAR2(255),
  ORIGIN_NAME VARCHAR2(255) , 
  CHANGE_NAME VARCHAR2(255) , 
  COUNT NUMBER DEFAULT 0,
  CREATE_DATE DATE,
  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

CREATE SEQUENCE SEQ_NNO;

INSERT INTO TBL_NOTICE 
VALUES(SEQ_NNO.NEXTVAL, '첫번째 게시판 서비스를 시작하겠습니다.', '안녕하세요. 첫 게시판입니다.','admin','','', DEFAULT, '20191210', DEFAULT);

INSERT INTO TBL_NOTICE  
VALUES(SEQ_NNO.NEXTVAL, '두번째 게시판 서비스를 시작하겠습니다.', '안녕하세요. 2 게시판입니다.','admin','','', DEFAULT, '20200320', DEFAULT);

INSERT INTO TBL_NOTICE  
VALUES(SEQ_NNO.NEXTVAL, '하이 에브리원 게시판 서비스를 시작하겠습니다.', '안녕하세요. 3 게시판입니다.','admin','','', DEFAULT, '20200321', DEFAULT);

INSERT INTO TBL_NOTICE  
VALUES(SEQ_NNO.NEXTVAL, '안녕.. 마이바티스는 처음이지?', '안녕하세요. 첫 게시판입니다.','admin','','', DEFAULT, '20200322', DEFAULT);

INSERT INTO TBL_NOTICE  
VALUES(SEQ_NNO.NEXTVAL, '어서와 ㅎㅎㅎㅎ', '반갑습니다.','admin','','', DEFAULT, '20200323',  DEFAULT);

INSERT INTO TBL_NOTICE  
VALUES(SEQ_NNO.NEXTVAL, '페이징 처리때문에 샘플데이터 많이 넣어놓는다...', '안녕하십니까','admin','','',  DEFAULT, '20200324', DEFAULT);

INSERT INTO TBL_NOTICE  
VALUES(SEQ_NNO.NEXTVAL, '게시판 서비스', '안녕하세요. 게시판입니다.','admin','','',  DEFAULT, '20200325', DEFAULT);

INSERT INTO TBL_NOTICE  
VALUES(SEQ_NNO.NEXTVAL, '샘플데이터들 ', '안녕하세요.','admin','','', DEFAULT, '20200326', DEFAULT);

INSERT INTO TBL_NOTICE  
VALUES(SEQ_NNO.NEXTVAL, '모두들 화이팅!!', '화이팅 하세요!!','admin','','', DEFAULT, '20200327', DEFAULT);

INSERT INTO TBL_NOTICE  
VALUES(SEQ_NNO.NEXTVAL, '힘내세요!!!', ' 게시판입니다.','admin','','',  DEFAULT, '20200328', DEFAULT);

INSERT INTO TBL_NOTICE  
VALUES(SEQ_NNO.NEXTVAL, '게시판 서비스', '프레임워크는 처음이지?','admin','','',  DEFAULT, '20200329', DEFAULT);

INSERT INTO TBL_NOTICE  
VALUES(SEQ_NNO.NEXTVAL, '시작하겠습니다.', '지금부터 시작!!','admin','','',  DEFAULT, '20200401', DEFAULT);

INSERT INTO TBL_NOTICE  
VALUES(SEQ_NNO.NEXTVAL, '마지막 게시판 시작하겠습니다.', '안녕하세요. 마지막 게시판입니다.','admin','','', DEFAULT, '20200402', DEFAULT);



commit;

DROP TABLE TBL_QNA

CREATE TABLE TBL_QNA(
  QNA_NO NUMBER PRIMARY KEY, 
  QNA_TITLE VARCHAR2(100) NOT NULL,
  QNA_CONTENT VARCHAR2(4000) NOT NULL,
  QNA_WRITER VARCHAR2(255),
  ORIGIN_NAME VARCHAR2(255) , 
  CHANGE_NAME VARCHAR2(255) , 
  COUNT NUMBER DEFAULT 0,
  CREATE_DATE DATE,
  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);
CREATE SEQUENCE SEQ_QNO;

commit;


CREATE TABLE TBL_CATEGORY (
  CATE_CODE VARCHAR(20) PRIMARY KEY,
  CATE_NAME VARCHAR(50) NOT NULL
);




--CREATE SEQUENCE CATE_CODE
--       INCREMENT BY 1
--       START WITH 1
--       MINVALUE 1
--       MAXVALUE 9999
--       NOCYCLE
--       NOCACHE
--       NOORDER;
--       
--
--  DROP SEQUENCE CATE_CODE;
--  
--  CREATE OR REPLACE TRIGGER TBL_TBL_CATEGORY_TRIGGER
--  BEFORE INSERT ON TBL_CATEGORY
--  FOR EACH ROW
--  BEGIN
--    :NEW.CATE_CODE := CATE_CODE.NEXTVAL;
--  END;
--
--  DROP TRIGGER TBL_CATEGORY_TRIGGER;

INSERT INTO TBL_CATEGORY (CATE_CODE,CATE_NAME)
VALUES(1,'OUTER');
INSERT INTO TBL_CATEGORY (CATE_CODE,CATE_NAME)
VALUES(2,'TOP');
INSERT INTO TBL_CATEGORY (CATE_CODE,CATE_NAME)
VALUES(3,'BOTTOM');
INSERT INTO TBL_CATEGORY (CATE_CODE,CATE_NAME)
VALUES(4,'SHOES');
INSERT INTO TBL_CATEGORY (CATE_CODE,CATE_NAME)
VALUES(5,'ACC');



CREATE TABLE TBL_PAYMENT (
  MEM_CODE VARCHAR(500) NOT NULL,
  PRO_CODE VARCHAR(500) NOT NULL,
  ORDER_NUM VARCHAR(50) PRIMARY KEY,
  DELIVERY_STS VARCHAR(20) NOT NULL,
  MEM_ADRR VARCHAR(100) NOT NULL,
  ORDER_DATE DATE DEFAULT SYSDATE,
  CONSTRAINT FK_MEM_CODE FOREIGN KEY (MEM_CODE) REFERENCES TBL_MEMBER(MEM_CODE),
  CONSTRAINT FK_PRO_CODE FOREIGN KEY (PRO_CODE) REFERENCES TBL_PRODUCT(PRO_CODE)
);

CREATE TABLE TBL_VIEW(
    MEM_CODE VARCHAR(50) NOT NULL,
    PRO_CODE VARCHAR(50) NOT NULL,
    CONSTRAINT FK_MEM_CODE1 FOREIGN KEY (MEM_CODE) REFERENCES TBL_MEMBER(MEM_CODE),
    CONSTRAINT FK_PRO_CODE1 FOREIGN KEY (PRO_CODE) REFERENCES TBL_PRODUCT(PRO_CODE)
    
);
SELECT*FROM TBL_PRODUCT;

--TBL_EVENT
CREATE TABLE TBL_EVENT (
  EVENT_CODE VARCHAR(1000) PRIMARY KEY,
  EVENT_NAME VARCHAR(50) NOT NULL,
  EVENT_DETAIL VARCHAR(500),
  EVENT_ADD_DATE DATE DEFAULT SYSDATE,
  EVENT_PHOTO VARCHAR(100)
);


 CREATE SEQUENCE EVENT_CODE
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
















CREATE USER LJSS IDENTIFIED BY LJSS;
GRANT RESOURCE, CONNECT TO LJSS;

CREATE SEQUENCE mem_code INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9999 NOCYCLE NOCACHE NOORDER;
CREATE SEQUENCE PRO_CODE INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9999 NOCYCLE NOCACHE NOORDER;
CREATE SEQUENCE SEQ_NNO;
CREATE SEQUENCE SEQ_QNO;
CREATE SEQUENCE EVENT_CODE INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9999 NOCYCLE NOCACHE NOORDER;

CREATE TABLE TBL_CATEGORY (CATE_CODE VARCHAR(20) PRIMARY KEY, CATE_NAME VARCHAR(50) NOT NULL);
CREATE TABLE TBL_MEMBER (MEM_CODE NUMBER PRIMARY KEY, MEM_ADMIN VARCHAR(1) DEFAULT 'N' CONSTRAINT AA_STATUS NOT NULL, CONSTRAINT ADMIN_STATUS CHECK(MEM_ADMIN IN ('Y','N')), MEM_NAME VARCHAR(20), MEM_BIRTH VARCHAR(20), GENDER VARCHAR2(10) CHECK (GENDER IN('M', 'F')), MEM_ID VARCHAR(20), MEM_PWD VARCHAR(100), MEM_PHONE VARCHAR(20), MEM_ADRR VARCHAR(100), MEM_EMAIL VARCHAR(20), MEM_ACC_DATE DATE DEFAULT SYSDATE, MEM_OUT VARCHAR(1) DEFAULT 'N' CONSTRAINT NN_STATUS NOT NULL, CONSTRAINT OUT_STATUS CHECK(MEM_OUT IN ('Y','N')));
CREATE TABLE TBL_PRODUCT (PRO_CODE VARCHAR(20), PRO_NAME VARCHAR(500), PRO_PRICE NUMBER, CATE_CODE VARCHAR(20), PRO_SIZE VARCHAR(10), PRO_STOCK NUMBER, PRO_ENT_DATE DATE DEFAULT SYSDATE, CONSTRAINT FK_CATE_CODE FOREIGN KEY (CATE_CODE) REFERENCES TBL_CATEGORY(CATE_CODE), PRO_STATUS VARCHAR(1) DEFAULT 'Y' CONSTRAINT EE_STATUS NOT NULL, CONSTRAINT PRODUCT_STATUS CHECK(PRO_STATUS IN ('Y','N')), PRO_IMG1 VARCHAR(100), PRO_IMG2 VARCHAR(100));
CREATE TABLE TBL_NOTICE (NOTICE_NO NUMBER PRIMARY KEY, NOTICE_TITLE VARCHAR2(100) NOT NULL, NOTICE_CONTENT VARCHAR2(4000) NOT NULL, NOITCE_WRITER VARCHAR2(255), ORIGIN_NAME VARCHAR2(255), CHANGE_NAME VARCHAR2(255), COUNT NUMBER DEFAULT 0, CREATE_DATE DATE, STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')));
CREATE TABLE TBL_QNA (QNA_NO NUMBER PRIMARY KEY, QNA_TITLE VARCHAR2(100) NOT NULL, QNA_CONTENT VARCHAR2(4000) NOT NULL, QNA_WRITER VARCHAR2(255), ORIGIN_NAME VARCHAR2(255), CHANGE_NAME VARCHAR2(255), COUNT NUMBER DEFAULT 0, CREATE_DATE DATE, STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')));
CREATE TABLE TBL_PAYMENT (MEM_CODE VARCHAR(500) NOT NULL, PRO_CODE VARCHAR(500) NOT NULL, ORDER_NUM VARCHAR(50) PRIMARY KEY, DELIVERY_STS VARCHAR(20) NOT NULL, MEM_ADRR VARCHAR(100) NOT NULL, ORDER_DATE DATE DEFAULT SYSDATE, CONSTRAINT FK_MEM_CODE FOREIGN KEY (MEM_CODE) REFERENCES TBL_MEMBER(MEM_CODE), CONSTRAINT FK_PRO_CODE FOREIGN KEY (PRO_CODE) REFERENCES TBL_PRODUCT(PRO_CODE));
CREATE TABLE TBL_VIEW (MEM_CODE VARCHAR(50) NOT NULL, PRO_CODE VARCHAR(50) NOT NULL, CONSTRAINT FK_MEM_CODE1 FOREIGN KEY (MEM_CODE) REFERENCES TBL_MEMBER(MEM_CODE), CONSTRAINT FK_PRO_CODE1 FOREIGN KEY (PRO_CODE) REFERENCES TBL_PRODUCT(PRO_CODE));
CREATE TABLE TBL_EVENT (EVENT_CODE VARCHAR(1000) PRIMARY KEY, EVENT_NAME VARCHAR(50) NOT NULL, EVENT_DETAIL VARCHAR(500), EVENT_ADD_DATE DATE DEFAULT SYSDATE, EVENT_PHOTO VARCHAR(100));

CREATE OR REPLACE TRIGGER TBL_MEMBER_TRIGGER BEFORE INSERT ON TBL_MEMBER FOR EACH ROW BEGIN :NEW.MEM_CODE := MEM_CODE.NEXTVAL; END;
CREATE OR REPLACE TRIGGER TBL_PRODUCT_TRIGGER BEFORE INSERT ON TBL_PRODUCT FOR EACH ROW BEGIN :NEW.PRO_CODE := PRO_CODE.NEXTVAL; END;

-- Insert statements for TBL_MEMBER, TBL_PRODUCT, TBL_NOTICE, TBL_QNA, TBL_CATEGORY, and others.

DROP TABLE TBL_MEMBER CASCADE CONSTRAINTS;
DROP TABLE TBL_PRODUCT CASCADE CONSTRAINTS;
DROP TABLE TBL_EVENT;
DROP TABLE TBL_NOTICE;
DROP TABLE TBL_QNA;
DROP TABLE TBL_CATEGORY CASCADE CONSTRAINTS;

DROP SEQUENCE MEM_CODE;
DROP SEQUENCE PRO_CODE;
DROP SEQUENCE SEQ_NNO;
DROP SEQUENCE SEQ_QNO;
DROP SEQUENCE EVENT_CODE;

DROP TRIGGER TBL_MEMBER_TRIGGER;
DROP TRIGGER TBL_PRODUCT_TRIGGER;

COMMIT;