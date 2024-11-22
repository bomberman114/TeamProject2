C:\Users\GGG>sqlplus /nolog

SQL> conn /as sysdba
연결되었습니다.

SQL> alter session set "_ORACLE_SCRIPT"=true;
세션이 변경되었습니다.

SQL> create user teamproject1 identified by 1234;
사용자가 생성되었습니다.

SQL> grant connect, resource to teamproject1;
권한이 부여되었습니다.

SQL> alter user teamproject1 default tablespace
  2  users quota unlimited on users;
사용자가 변경되었습니다.

SQL> conn teamproject1/1234
연결되었습니다.
SQL> show user
USER은 "TEAMPROJECT1"입니다

 //제약조건 테이블 밑으로 내리기
//제약조건 이름 중복 안하게 수정 
//오타 수정
//COMPANY_USER -> COMPANY_USERS 통일
//NUM -> IDX 로 통일
//개인회원/기업회원 가입일(SYSDATE)/기업 설립일(ESTABLISH) 추가
//채용공고 등록일/개인이력서 등록일(SYSDATE) 추가
//VARCHAR2 길이 일괄 통합
//짧은 길이(40)으로 통일
//보통 길이(100)으로 통일
//조금 긴 길이(320)으로 통일  -- 이메일...
//매우 긴 길이(2000)으로 통일 -- 자소서...
//SKILL TABLE 추가
//REGION TABLE 추가
//COMMON_COMPANY_RECRUIT_SKILL 추가
//COMMON_USER_RESUME_SKILL 추가
//BOOKMARK 추가

-- 개인회원=====================================================================
-- DROP TABLE USERS;
CREATE TABLE USERS (
       USER_ID       VARCHAR2(40)   PRIMARY KEY         -- 개인회원 아이디
     , USER_PASSWD   VARCHAR2(40)   NOT NULL            -- 개인회원 비밀번호
     , USER_NAME     VARCHAR2(40)   NOT NULL            -- 개인회원 이름
     , USER_PHONE    VARCHAR2(40)   NOT NULL            -- 개인회원 연락처
     , USER_EMAIL    VARCHAR2(320)                      -- 개인회원 이메일
     , USER_REGDATE  DATE           DEFAULT SYSDATE     -- 개인회원 가입일 
);

/* 개인회원 INSERT FORM
INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, 
                    USER_EMAIL, USER_REGDATE) 
VALUES            ('siyeon01', 'passwd123', 'Park Siyeon', '010-1234-5678', 
                   'siyeon.park@green.com', SYSDATE);
                   
INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, 
                   USER_EMAIL, USER_REGDATE) 
VALUES            ('Lee02', 'passwd456', 'Lee Jiwon', '010-2345-6789', 
                   'lee@green.com', SYSDATE);
*/



-- 기업회원=====================================================================
-- DROP TABLE COMPANY_USERS;
CREATE TABLE COMPANY_USERS (
      COMPANY_ID           VARCHAR2(40)  PRIMARY KEY          -- 기업회원 아이디
    , COMPANY_PASSWD       VARCHAR2(40)  NOT NULL             -- 기업회원 비밀번호
    , COMPANY_USER_NAME    VARCHAR2(40)  NOT NULL             -- 기업회원 이름
    , COMPANY_PHONE        VARCHAR2(40)  NOT NULL             -- 기업회원 연락처
    , COMPANY_NAME         VARCHAR2(40)  NOT NULL             -- 기업회원 회사명
    , COMPANY_BCODE        NUMBER(8, 0)  NOT NULL             -- 기업회원 사업자등록번호
    , COMPANY_BOSS_NAME    VARCHAR2(40)  NOT NULL             -- 기업회원 대표자명
    , COMPANY_EMAIL        VARCHAR2(320) NOT NULL             -- 기업공식 이메일
    , COMPANY_USER_EMAIL   VARCHAR2(320) NOT NULL             -- 기업회원 이메일
    , COMPANY_REGDATE      DATE          DEFAULT SYSDATE      -- 기업회원 가입일
    , COMPANY_ESTABLISH    DATE          NOT NULL             -- 기업     설립일 
);

/* 기업회원 INSERT FORM
INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, 
                           COMPANY_PHONE, COMPANY_NAME, COMPANY_BCODE, 
                           COMPANY_BOSS_NAME, COMPANY_EMAIL, COMPANY_USER_EMAIL, 
                           COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('kaka01', 'kaka123', 'Park Jeonghwan', 
                           '010-2221-33331', 'kaka', 12345678, 
                           'Jo Hyeongil', 'kaka@kaka.com', 'jeonghwan.park@kaka.com', 
                           SYSDATE, TO_DATE('2015-12-12', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, 
                           COMPANY_PHONE, COMPANY_NAME, COMPANY_BCODE, 
                           COMPANY_BOSS_NAME, COMPANY_EMAIL, COMPANY_USER_EMAIL, 
                           COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('InnoTech02', 'comp456', 'Kim Ara', 
                           '02-2345-6789', 'InnoTech', 87654321, 
                           'Kim Minwoo', 'contact@innotech.com', 'ara.kim@innotech.com', 
                           SYSDATE, TO_DATE('2015-08-15', 'YYYY-MM-DD'));
*/



-- 개인 이력서===================================================================
-- DROP TABLE USER_RESUME;
CREATE TABLE USER_RESUME (
    USER_RESUME_IDX        NUMBER(4, 0)       PRIMARY KEY     -- 이력서   번호
  , USER_TITLE             VARCHAR2(100)      NOT NULL        -- 개인회원 이력서 제목
  , USER_ID                VARCHAR2(40)       NOT NULL        -- 개인회원 아이디
  , USER_NAME              VARCHAR2(40)       NOT NULL        -- 개인회원 이름
  , USER_BIRTH             VARCHAR2(40)       NOT NULL        -- 개인회원 생일
  , USER_PHONE             VARCHAR2(40)       NOT NULL        -- 개인회원 연락처
  , USER_EMAIL             VARCHAR2(320)      NOT NULL        -- 개인회원 이메일
  , REGION_IDX             NUMBER(4)          NOT NULL        -- 지역
  , REGION_ADDRESS         VARCHAR2(320)      NOT NULL        -- 개인회원 상세 주소
  , USER_INTRO             VARCHAR2(2000)     NOT NULL        -- 자소서              
  , USER_RESUME_REGDATE    DATE               DEFAULT SYSDATE -- 이력서   등록일
);

ALTER TABLE USER_RESUME ADD CONSTRAINT FK_USER_RESUME_USERS FOREIGN KEY (USER_ID) 
    REFERENCES USERS(USER_ID);
ALTER TABLE USER_RESUME ADD CONSTRAINT FK_USER_RESUME_REGION FOREIGN KEY (REGION_IDX) 
    REFERENCES REGION(REGION_IDX);
    
/* 개인 이력서 INSERT FORM
CREATE SEQUENCE USER_RESUME_SEQ
    START WITH 1         -- 1부터 시작
    INCREMENT BY 1       -- 1씩 증가
    NOCACHE;             -- 캐시를 사용X
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, USER_ADDRESS, 
                         SKILL_NAME, USER_INTRO, 
                         USER_BOOKMARK, USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME_SEQ.NEXTVAL, '이력서', 'siyeon01', 'Park Siyeon', 
                         TO_DATE('1996-04-15', 'YYYY-MM-DD'), '010-1234-5678', 'siyeon.park@green.com', 
                         'Busan,South Korea', 'JAVA, PYTHON', 'JAVA를 매우 잘합니다.', 
                         NULL, SYSDATE);

INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, USER_ADDRESS, 
                         SKILL_NAME, USER_INTRO, 
                         USER_BOOKMARK, USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME_SEQ.NEXTVAL, 'Frontend Developer', 'user02', 'Lee Jiwon', 
                         TO_DATE('1996-04-15', 'YYYY-MM-DD'), '010-2345-6789', 'lee@green.com', 
                         'Busan, South Korea', 'JAVASCRIPT', '열심히 하겠습니다.', 
                         NULL, SYSDATE);
*/



-- 채용공고=====================================================================
-- DROP TABLE COMPANY_RECRUIT;
CREATE TABLE COMPANY_RECRUIT (
    COMPANY_RECRUIT_IDX        NUMBER(4)        PRIMARY KEY     -- 채용공고 번호
  , COMPANY_ID                 VARCHAR2(40)     NOT NULL        -- 기업회원 아이디
  , COMPANY_NAME               VARCHAR2(40)     NOT NULL        -- 기업회원 회사명
  , RECRUIT_TITLE              VARCHAR2(320)    NOT NULL        -- 채용공고 제목
  , COMPANY_JOB                VARCHAR2(100)    NOT NULL        -- 모집부문
  , GETMAN                     VARCHAR2(40)     NOT NULL        -- 모집인원 (value 00, readonly)
  , REGION_IDX                 NUMBER(4)        NOT NULL        -- 근무지역
  , COMPANY_ADDRESS            VARCHAR2(400)    NOT NULL        -- 근무위치 (=회사위치)
  , COMPANY_INFO               VARCHAR2(2000)   NOT NULL        -- 기업정보
  , APPLICATION_DEADLINE       VARCHAR2(320)    NOT NULL        -- 접수기간 (데드라인)
  , COMPANY_ESTABLISH          DATE             NOT NULL        -- 기업     설립일
  , COMPANY_RECRUIT_REGDATE    DATE             DEFAULT SYSDATE -- 채용공고 등록일
);



ALTER TABLE COMPANY_RECRUIT ADD CONSTRAINT FK_COMPANY_RECRUIT_USERS FOREIGN KEY (COMPANY_ID) 
    REFERENCES COMPANY_USERS(COMPANY_ID);
ALTER TABLE COMPANY_RECRUIT ADD CONSTRAINT FK_COMPANY_RECRUIT_REGION FOREIGN KEY (REGION_IDX) 
    REFERENCES REGION(REGION_IDX);

ALTER TABLE COMPANY_RECRUIT ADD VIEWS NUMBER(8) DEFAULT 0 NOT NULL;


/* 채용공고 INSERT FORM
INSERT INTO COMPANY_RECRUIT (COMPANY_RECRUIT_IDX, COMPANY_ID, COMPANY_NAME, 
                             RECRUIT_TITLE, SKILL_NAME, SKILL_STACK, COMPANY_JOB, 
                             GETMAN, COMPANY_ADDRESS, COMPANY_INFO, 
                             APPLICATION_DEADLINE, BOOKMARK, 
                             COMPANY_ESTABLISH, COMPANY_RECRUIT_REGDATE) 
VALUES                      (1, 'company01', 'TechCorp', 
                             'Backend Developer', 'JAVA', '백엔드', 'Backend Development', 
                             '5', 'Seoul, South Korea', 'Leading tech company focusing on AI and cloud solutions...', 
                             '2024-12-31', NULL, 
                             TO_DATE('2010-05-01', 'YYYY-MM-DD'), SYSDATE);

INSERT INTO COMPANY_RECRUIT (COMPANY_RECRUIT_IDX, COMPANY_ID, COMPANY_NAME, 
                             RECRUIT_TITLE, SKILL_NAME, SKILL_STACK, COMPANY_JOB, 
                             GETMAN, COMPANY_ADDRESS, COMPANY_INFO, 
                             APPLICATION_DEADLINE, BOOKMARK, 
                             COMPANY_ESTABLISH, COMPANY_RECRUIT_REGDATE) 
VALUES                      ((SELECT NVL(MAX(COMPANY_RECRUIT_IDX), 0) + 1 FROM COMPANY_RECRUIT), 'company01', 'TechCorp', 
                             'Backend Developer', 'ORACLE', '데이터베이스', 'Backend Development', 
                             '5', 'Seoul, South Korea', 'Leading tech company focusing on AI and cloud solutions...', 
                             '2024-12-31', NULL, 
                             TO_DATE('2010-05-01', 'YYYY-MM-DD'), SYSDATE);
*/

   
    
-- 북마크 ======================================================================
-- DROP TABLE BOOKMARK;
CREATE TABLE USERS_BOOKMARK (
    BOOKMARK_IDX         NUMBER(4)    PRIMARY KEY        -- 북마크 ID
   ,USER_ID              VARCHAR2(40)    NOT NULL        -- 구직자 ID (회원 ID)
   ,COMPANY_RECRUIT_IDX  NUMBER(4)       NOT NULL        -- 채용공고 번호
   ,BOOKMARK_DATE        DATE            DEFAULT SYSDATE -- 북마크한 날짜
   ,BOOKMARK_CHECK       NUMBER(1)       DEFAULT 0       -- 북마크 체크 확인
);

ALTER TABLE USERS_BOOKMARK ADD CONSTRAINT FK_BOOKMARK_USER_ID FOREIGN KEY (USER_ID) 
    REFERENCES USERS(USER_ID);
ALTER TABLE USERS_BOOKMARK ADD CONSTRAINT FK_BOOKMARK_RECRUIT_IDX FOREIGN KEY (COMPANY_RECRUIT_IDX) 
    REFERENCES COMPANY_RECRUIT(COMPANY_RECRUIT_IDX);
ALTER TABLE USERS_BOOKMARK ADD CONSTRAINT CHECK_BOOKMARK_CHECK CHECK (BOOKMARK_CHECK IN (0, 1));

/* 북마크 INSERT FORM
INSERT INTO BOOKMARK (USER_ID, COMPANY_RECRUIT_IDX) 
VALUES ('user123', 101);
*/

/* 북마크 조회 FORM
SELECT cr.*
FROM COMPANY_RECRUIT cr
JOIN BOOKMARK b ON cr.COMPANY_RECRUIT_IDX = b.COMPANY_RECRUIT_IDX
WHERE b.USER_ID = 'siyeon01';

SELECT ur.*
FROM USER_RESUME ur
JOIN BOOKMARK b ON ur.USER_ID = b.USER_ID
WHERE b.COMPANY_RECRUIT_IDX = 101;
*/



-- 지원내역=====================================================================
-- DROP TABLE APPLICATIONS;
CREATE TABLE APPLICATIONS (
      APPLICATIONS_IDX      NUMBER(4)    PRIMARY KEY    -- 지원내역키
    , USER_RESUME_IDX       NUMBER(4)    NOT NULL       -- 이력서 번호
    , COMPANY_RECRUIT_IDX   NUMBER(4)    NOT NULL       -- 채용 공고  번호
    , APPLICATION_STATUS    VARCHAR2(40) NOT NULL       -- 지원상태   (심사중,합격,불합격)
    , APPLIED_DATE          DATE         DEFAULT SYSDATE-- 지원날짜
);

ALTER TABLE APPLICATIONS ADD CONSTRAINT FK_APPLICATIONS_USERS FOREIGN KEY (USER_RESUME_IDX) 
    REFERENCES USER_RESUME(USER_RESUME_IDX);
ALTER TABLE APPLICATIONS ADD CONSTRAINT FK_APPLICATIONS_RECRUIT FOREIGN KEY (COMPANY_RECRUIT_IDX) 
    REFERENCES COMPANY_RECRUIT(COMPANY_RECRUIT_IDX);

/* 지원내역 INSERT FORM
INSERT INTO APPLICATIONS (APPLICATIONS_IDX, USER_ID, 
                          COMPANY_RECRUIT_IDX, APPLICATION_STATUS, APPLIED_DATE) 
VALUES                   (1, 'user01', 
                          1, '심사중', SYSDATE);

INSERT INTO APPLICATIONS (APPLICATIONS_IDX, USER_ID, 
                          COMPANY_RECRUIT_IDX, APPLICATION_STATUS, APPLIED_DATE) 
VALUES                   (2, 'user02', 2, '합격', SYSDATE);
*/



-- 메뉴 ========================================================================
-- DROP TABLE MENU;
CREATE TABLE MENU (
      MENU_IDX              NUMBER(4) PRIMARY KEY
    , MENU_TITLE            VARCHAR2(40)  UNIQUE NOT NULL
);



-- 커뮤니티=====================================================================
-- DROP TABLE COMMUNITY;
CREATE TABLE COMMUNITY (
      COMMUNITY_IDX        NUMBER(4)         PRIMARY KEY                 
    , COMPANY_ID           VARCHAR2(40)                     --기업회원 아이디
    , USER_ID              VARCHAR2(40)                     --개인회원 아이디
    , COMMUNITY_TITLE      VARCHAR2(40)      NOT NULL       --제목
    , COMMUNITY_CONTENT    VARCHAR2(2000)    NOT NULL       --내용
    , MENU_IDX             NUMBER(4)         NOT NULL 
);

ALTER TABLE COMMUNITY ADD CONSTRAINT FK_COMMUNITY_USERS FOREIGN KEY (USER_ID) 
    REFERENCES USERS(USER_ID);
ALTER TABLE COMMUNITY ADD CONSTRAINT FK_COMMUNITY_COMPANY_USERS FOREIGN KEY (COMPANY_ID) 
    REFERENCES COMPANY_USERS(COMPANY_ID);
ALTER TABLE COMMUNITY ADD CONSTRAINT FK_COMMUNITY_MENU FOREIGN KEY (MENU_IDX) 
    REFERENCES MENU(MENU_IDX);
    
/* 커뮤니티 INSERT FORM
INSERT INTO COMMUNITY (COMMUNITY_IDX, COMPANY_ID, USER_ID, 
                       COMMUNITY_TITLE, COMMUNITY_CONTENT) 
VALUES                (1, 'company01', 'user01', 
                       'New Tech Trends', 'What are your thoughts on the latest AI developments?');

INSERT INTO COMMUNITY (COMMUNITY_IDX, COMPANY_ID, USER_ID, 
                       COMMUNITY_TITLE, COMMUNITY_CONTENT) 
VALUES                (2, 'company02', 'user02', 
                       'Career Advice', 'How do you prepare for a frontend developer interview?');
*/



-- 커뮤니티 기업리뷰 ===========================================================
-- DROP TABLE REVIEW_COMPANY;
CREATE TABLE REVIEW_COMPANY (
    USER_ID               VARCHAR2(40)        NOT NULL            -- 개인회원 아이디
  , REVIEW_COMPANY_IDX    NUMBER(4)           PRIMARY KEY         -- 리뷰번호
  , WRITER                VARCHAR2(40)        NOT NULL            -- 작성자
  , COMPANY_NAME          VARCHAR2(40)        NOT NULL            -- 기업명
  , TITLE                 VARCHAR2(320)       NOT NULL            -- 제목
  , CONTENT               VARCHAR2(2000)      NOT NULL            -- 내용
  , STAR                  NUMBER(2)           NOT NULL            -- 평점
  , MENU_IDX              NUMBER(4)
);

ALTER TABLE REVIEW_COMPANY ADD CONSTRAINT FK_REVIEW_COMPANY_USERS FOREIGN KEY (USER_ID) 
    REFERENCES USERS(USER_ID);
ALTER TABLE REVIEW_COMPANY ADD CONSTRAINT FK_REVIEW_COMPANY_MENU FOREIGN KEY (MENU_IDX) 
    REFERENCES MENU(MENU_IDX);

/* 커뮤니티 기업리뷰 INSERT FORM
INSERT INTO REVIEW_COMPANY (USER_ID,REVIEW_COMPANY_IDX,NAME,
                            COMPANY_NAME, TITLE, CONTENT, STAR)
VALUES                     ('user01', 1, 'park siyeon',
                            'TechCorp', Techcorp리뷰, '매우 안좋음',5)
INSERT INTO REVIEW_COMPANY (USER_ID,REVIEW_COMPANY_IDX,NAME,
                            COMPANY_NAME, TITLE, CONTENT, STAR)
VALUES                     ('user02', 2, 'NAME',
                            'COMPANY_NAME', 'TITLE', 'CONTENT',STAR)
*/
                            

-- 고객센터 ====================================================================
-- DROP TABLE SERVICE_CENTER;
CREATE TABLE SERVICE_CENTER (
    SERVICE_CENTER_IDX         NUMBER(4, 0)    PRIMARY KEY
  , USER_ID                    VARCHAR2(40)                       -- 개인회원 아이디
  , COMPANY_ID                 VARCHAR2(40)                       -- 기업회원 아이디
  , WRITER                     VARCHAR2(40)    NOT NULL           -- 작성자
  , TITLE                      VARCHAR2(320)   NOT NULL           -- 제목
  , CONTENT                    VARCHAR2(2000)                     -- 내용
);

ALTER TABLE SERVICE_CENTER ADD CONSTRAINT FK_SERVICE_CENTER_USERS FOREIGN KEY (USER_ID) 
    REFERENCES USERS(USER_ID);
ALTER TABLE SERVICE_CENTER ADD CONSTRAINT FK_SERVICE_CENTER_COMPANY_USERS FOREIGN KEY (COMPANY_ID) 
    REFERENCES COMPANY_USERS(COMPANY_ID);

/* 고객센터 INSERT FORM
INSERT INTO SERVICE_CENTER (SERVICE_CENTER_IDX, USER_ID, COMPANY_ID, 
                            NAME, TITLE, 
                            CONTENT) 
VALUES                     (1, 'user01', 'company01', 
                            'Kim Minsoo', 'Login Issue', 
                            'I am having trouble logging into my account. Please assist.');
INSERT INTO SERVICE_CENTER (SERVICE_CENTER_IDX, USER_ID, COMPANY_ID, 
                            NAME, TITLE, 
                            CONTENT) 
VALUES                     (2, 'user02', 'company02', 
                            'Lee Jiwon', 'Application Status', 
                            'I would like to know the status of my application.');
*/



-- 개인 이력서 공통 스킬 =======================================================
-- DROP COMMON_USER_RESUME_SKILL;
CREATE TABLE COMMON_USER_RESUME_SKILL (
     COMMON_USER_IDX            NUMBER(4)      PRIMARY KEY
    ,SKILL_NAME                 VARCHAR2(40)   NOT NULL          -- 스킬명
    ,USER_RESUME_IDX            NUMBER(4, 0)   NOT NULL          -- 이력서   번호
);

ALTER TABLE COMMON_USER_RESUME_SKILL ADD CONSTRAINT FK_COMMON_USER_RESUME_SKILL FOREIGN KEY (USER_RESUME_IDX) 
    REFERENCES USER_RESUME(USER_RESUME_IDX);
ALTER TABLE COMMON_USER_RESUME_SKILL ADD CONSTRAINT FK_COMMON_USER_SKILL_NAME FOREIGN KEY (SKILL_NAME) 
    REFERENCES SKILLS(SKILL_NAME);


                  
	-- 채용공고 공통 스킬 ==========================================================
-- DROP COMMON_COMPANY_RECRUIT_SKILL;
CREATE TABLE COMMON_COMPANY_RECRUIT_SKILL (
     COMMON_COMPANY_IDX         NUMBER(4)      PRIMARY KEY
    ,SKILL_NAME                 VARCHAR2(40)   NOT NULL          -- 스킬명
    ,COMPANY_RECRUIT_IDX        NUMBER(4, 0)   NOT NULL          -- 이력서   번호
);
                  
ALTER TABLE COMMON_COMPANY_RECRUIT_SKILL ADD CONSTRAINT FK_COMMON_COMPANY_RECRUIT_IDX FOREIGN KEY (COMPANY_RECRUIT_IDX) 
    REFERENCES COMPANY_RECRUIT(COMPANY_RECRUIT_IDX);
ALTER TABLE COMMON_COMPANY_RECRUIT_SKILL ADD CONSTRAINT FK_COMMON_COMPANY_SKILL_NAME FOREIGN KEY (SKILL_NAME) 
    REFERENCES SKILLS(SKILL_NAME);
    


-- 지역 ========================================================================
-- DROP TABLE REGION;
CREATE TABLE REGION (
      REGION_IDX        NUMBER(4)      PRIMARY KEY
     ,REGION_NAME       VARCHAR2(40)   NOT NULL               -- 지역이름 (시군구 제외)
);



-- 스킬  =======================================================================
-- DROP TABLE SKILL;
CREATE TABLE SKILLS (
      SKILL_STACK      VARCHAR2(40)    NOT NULL                -- 스킬구분    
    , SKILL_NAME       VARCHAR2(320)   PRIMARY KEY             -- 스킬
    
);

--**********************INSERT 문 모음******************************************



--개인회원 INSERT FORM---------------------------------------------------------
--개인회원 --------------------------------------------------------------------
--DROP TABLE USERS;
DROP TABLE USERS;              --테이블 삭제
DELETE FROM USERS;             --칼럼 삭제



INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE) 
VALUES            ('user01', 'passwd123', 'Park Siyeon', '010-1111-1111', 'siyeon.park@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE) 
VALUES            ('user02', 'passwd123', 'Lee Jiwon', '010-1111-1112', 'lee@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE) 
VALUES            ('user03', 'passwd123', 'uo Jiwon', '010-1111-1113', 'uo@green.com', SYSDATE);
                   
INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user04', 'passwd123', 'Kim Minseo', '010-1111-1114', 'kim04@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user05', 'passwd123', 'Jung Hyeri', '010-1111-1115', 'jung05@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user06', 'passwd123', 'Yoon Jaewon', '010-1111-1116', 'yoon06@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user07', 'passwd123', 'Choi Yeonwoo', '010-1111-1117', 'choi07@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user08', 'passwd123', 'Han Jisoo', '010-1111-1118', 'han08@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user09', 'passwd123', 'Park Soohyun', '010-1111-1119', 'park09@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user10', 'passwd123', 'Lee Sunwoo', '010-1111-1120', 'lee10@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user11', 'passwd123', 'Oh Hyemin', '010-1111-1121', 'oh11@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user12', 'passwd123', 'Im Taewon', '010-1111-1122', 'im12@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user13', 'passwd123', 'Seo Eunji', '010-1111-1123', 'seo13@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user14', 'passwd123', 'Kim Junseo', '010-1111-1124', 'kim14@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user15', 'passwd123', 'Park Yeji', '010-1111-1125', 'park15@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user16', 'passwd123', 'Jang Seohyun', '010-1111-1126', 'jang16@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user17', 'passwd123', 'Choi Doyoon', '010-1111-1127', 'choi17@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user18', 'passwd123', 'Hong Minji', '010-1111-1128', 'hong18@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user19', 'passwd123', 'Yoon Jaehyun', '010-1111-1129', 'yoon19@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user20', 'passwd123', 'Lee Haeun', '010-1111-1130', 'lee20@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user21', 'passwd123', 'Kim Siyoon', '010-1111-1131', 'kim21@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user22', 'passwd123', 'Park Jihoon', '010-1111-1132', 'park22@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user23', 'passwd123', 'Yoon Minho', '010-1111-1133', 'yoon23@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user24', 'passwd123', 'Kim Dasom', '010-1111-1134', 'kim24@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user25', 'passwd123', 'Kang Jiwon', '010-1111-1135', 'kang25@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user26', 'passwd123', 'Shin Hyerim', '010-1111-1136', 'shin26@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user27', 'passwd123', 'Cho Minjun', '010-1111-1137', 'cho27@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user28', 'passwd123', 'Jang Harin', '010-1111-1138', 'jang28@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user29', 'passwd123', 'Lee Junyoung', '010-1111-1139', 'lee29@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user30', 'passwd123', 'Park Yeseo', '010-1111-1140', 'park30@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user31', 'passwd123', 'Oh Donghyun', '010-1111-1141', 'oh31@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user32', 'passwd123', 'Shin Sunwoo', '010-1111-1142', 'shin32@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user33', 'passwd123', 'Kang Hyerim', '010-1111-1143', 'kang33@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user34', 'passwd123', 'Park Yuna', '010-1111-1144', 'park34@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user35', 'passwd123', 'Kim Taeyang', '010-1111-1145', 'kim35@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user36', 'passwd123', 'Yoon Dahye', '010-1111-1146', 'yoon36@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user37', 'passwd123', 'Choi Siyoon', '010-1111-1147', 'choi37@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user38', 'passwd123', 'Oh Minjae', '010-1111-1148', 'oh38@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user39', 'passwd123', 'Park Jisoo', '010-1111-1149', 'park39@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user40', 'passwd123', 'Lee Sungmin', '010-1111-1150', 'lee40@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user41', 'passwd123', 'Hong Taeyang', '010-1111-1151', 'hong41@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user42', 'passwd123', 'Yoon Jiwon', '010-1111-1152', 'yoon42@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user43', 'passwd123', 'Kang Soohyun', '010-1111-1153', 'kang43@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user44', 'passwd123', 'Cho Hyunjoo', '010-1111-1154', 'cho44@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user45', 'passwd123', 'Lee Jiyoon', '010-1111-1155', 'lee45@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user46', 'passwd123', 'Yoon Haneul', '010-1111-1156', 'yoon46@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user47', 'passwd123', 'Jung Taeyang', '010-1111-1157', 'jung47@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user48', 'passwd123', 'Kim Jiwon', '010-1111-1158', 'kim48@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user49', 'passwd123', 'Han Eunwoo', '010-1111-1159', 'han49@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user50', 'passwd123', 'Kim Sunyoung', '010-1111-1160', 'kim50@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user51', 'passwd123', 'Seo Hyewon', '010-1111-1161', 'seo51@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user52', 'passwd123', 'Yoon Minseo', '010-1111-1162', 'yoon52@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user53', 'passwd123', 'Kang Hyesoo', '010-1111-1163', 'kang53@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user54', 'passwd123', 'Kim Haneul', '010-1111-1164', 'kim54@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user55', 'passwd123', 'Choi Hyunji', '010-1111-1165', 'choi55@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user56', 'passwd123', 'Lee Jimin', '010-1111-1166', 'lee56@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user57', 'passwd123', 'Seo Harin', '010-1111-1167', 'seo57@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user58', 'passwd123', 'Oh Seoyeon', '010-1111-1168', 'oh58@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user59', 'passwd123', 'Park Minjoon', '010-1111-1169', 'park59@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user60', 'passwd123', 'Jung Woosoo', '010-1111-1170', 'jung60@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user61', 'passwd123', 'Kim Seoyeon', '010-1111-1171', 'kim61@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user62', 'passwd123', 'Lee Siyoon', '010-1111-1172', 'lee62@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user63', 'passwd123', 'Park Hyunjin', '010-1111-1173', 'park63@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user64', 'passwd123', 'Oh Yeseo', '010-1111-1174', 'oh64@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user65', 'passwd123', 'Han Soohyun', '010-1111-1175', 'han65@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user66', 'passwd123', 'Shin Yeonwoo', '010-1111-1176', 'shin66@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user67', 'passwd123', 'Choi Eunsu', '010-1111-1177', 'choi67@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user68', 'passwd123', 'Kang Somin', '010-1111-1178', 'kang68@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user69', 'passwd123', 'Im Hyunjin', '010-1111-1179', 'im69@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user70', 'passwd123', 'Jung Minseok', '010-1111-1180', 'jung70@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user71', 'passwd123', 'Park Woobin', '010-1111-1181', 'park71@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user72', 'passwd123', 'Lee Jihyun', '010-1111-1182', 'lee72@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user73', 'passwd123', 'Kim Taeyeon', '010-1111-1183', 'kim73@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user74', 'passwd123', 'Han Hyunjoo', '010-1111-1184', 'han74@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user75', 'passwd123', 'Jung Minji', '010-1111-1185', 'jung75@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user76', 'passwd123', 'Park Donghyun', '010-1111-1186', 'park76@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user77', 'passwd123', 'Yoon Hyemin', '010-1111-1187', 'yoon77@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user78', 'passwd123', 'Lee Yeseul', '010-1111-1188', 'lee78@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user79', 'passwd123', 'Kim Eunsoo', '010-1111-1189', 'kim79@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user80', 'passwd123', 'Seo Yeonwoo', '010-1111-1190', 'seo80@green.com', SYSDATE);  

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user81', 'passwd123', 'Song Hyunjin', '010-1111-1191', 'hyunjin.song@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user82', 'passwd123', 'Choi Minseok', '010-1111-1192', 'minseok.choi@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user83', 'passwd123', 'Yoo Jaewon', '010-1111-1193', 'jaewon.yoo@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user84', 'passwd123', 'Han Seulgi', '010-1111-1194', 'seulgi.han@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user85', 'passwd123', 'Lee Hyeon', '010-1111-1195', 'hyeon.lee@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user86', 'passwd123', 'Park Jisoo', '010-1111-1196', 'jisoo.park@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user87', 'passwd123', 'Kim Donghoon', '010-1111-1197', 'donghoon.kim@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user88', 'passwd123', 'Seo Eunji', '010-1111-1198', 'eunji.seo@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user89', 'passwd123', 'Kang Minjae', '010-1111-1199', 'minjae.kang@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user90', 'passwd123', 'Yoon Somin', '010-1111-1200', 'somin.yoon@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user91', 'passwd123', 'Jung Kyungmin', '010-1111-1201', 'kyungmin.jung@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user92', 'passwd123', 'Shim Jinyoung', '010-1111-1202', 'jinyoung.shim@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user93', 'passwd123', 'Hong Eunji', '010-1111-1203', 'eunji.hong@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user94', 'passwd123', 'Nam Hyewon', '010-1111-1204', 'hyewon.nam@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user95', 'passwd123', 'Cho Yeonwoo', '010-1111-1205', 'yeonwoo.cho@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user96', 'passwd123', 'Bae Eunseo', '010-1111-1206', 'eunseo.bae@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user97', 'passwd123', 'Lee Daehyun', '010-1111-1207', 'daehyun.lee@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user98', 'passwd123', 'Kim Jinyoung', '010-1111-1208', 'jinyoung.kim@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user99', 'passwd123', 'Park Minseo', '010-1111-1209', 'minseo.park@green.com', SYSDATE);

INSERT INTO USERS (USER_ID, USER_PASSWD, USER_NAME, USER_PHONE, USER_EMAIL, USER_REGDATE)
VALUES ('user100', 'passwd123', 'Park seo', '010-1111-1210', 'seo.park@green.com', SYSDATE);



-- 기업회원 INSERT FORM---------------------------------------------------------
-- 기업회원 --------------------------------------------------------------------
--DROP TABLE COMPANY_USERS;
DROP TABLE COMPANY_USERS;              --테이블 삭제
DELETE FROM COMPANY_USERS;             --칼럼 삭제



INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, 
                           COMPANY_PHONE, COMPANY_NAME, COMPANY_BCODE, 
                           COMPANY_BOSS_NAME, COMPANY_EMAIL, COMPANY_USER_EMAIL, 
                           COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('kaka01', 'kaka123', 'Park Jeonghwan', 
                           '010-2221-33331', 'kaka', 12345678, 
                           'Jo Hyeongil', 'kaka@kaka.com', 'jeonghwan.park@kaka.com', 
                           SYSDATE, TO_DATE('2015-12-12', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, 
                           COMPANY_PHONE, COMPANY_NAME, COMPANY_BCODE, 
                           COMPANY_BOSS_NAME, COMPANY_EMAIL, COMPANY_USER_EMAIL, 
                           COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('InnoTech02', 'comp456', 'Kim Ara', 
                           '02-2345-6789', 'InnoTech', 87654321, 
                           'Kim Minwoo', 'contact@innotech.com', 'ara.kim@innotech.com', 
                           SYSDATE, TO_DATE('2015-08-15', 'YYYY-MM-DD'));
                           
INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('naver01', 'naver123', 'Kim Hyunwoo', '02-3456-7890', 'Naver', 11112222, 
                           'Han Seongsoo', 'contact@naver.com', 'hyunwoo.kim@naver.com', SYSDATE, 
                           TO_DATE('2000-01-01', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                     ('skTelecom02', 'sk456', 'Lee Jihoon', '02-9876-5432', 'SK Telecom', 22223333, 
                           'Park Jungsoo', 'info@sktelecom.com', 'jihoon.lee@sktelecom.com', SYSDATE, 
                           TO_DATE('1998-05-20', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('samsung03', 'sams789', 'Cho Minji', '010-9876-5432', 'Samsung', 33334444, 
                          'Lee Jaeyoung', 'support@samsung.com', 'minji.cho@samsung.com', SYSDATE, 
                           TO_DATE('1938-11-01', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('lgElec04', 'lg789', 'Yoon Seohyun', '02-5432-6789', 'LG Electronics', 44445555, 
                          'Kwon Bongseok', 'lg@lge.com', 'seohyun.yoon@lge.com', SYSDATE, 
                           TO_DATE('1958-10-01', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('hyundai05', 'hyn567', 'Jung Woojin', '031-7654-3210', 'Hyundai Motors', 55556666, 
                           'Chung Euisun', 'hyundai@hyundai.com', 'woojin.jung@hyundai.com', SYSDATE, 
                           TO_DATE('1967-12-29', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('posco06', 'posco123', 'Shin Sangmin', '054-5678-1234', 'POSCO', 66667777, 
                          'Choi Jeongwoo', 'info@posco.com', 'sangmin.shin@posco.com', SYSDATE, 
                           TO_DATE('1968-04-01', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('coupang07', 'cou123', 'Kim Jisoo', '010-1234-5678', 'Coupang', 77778888, 
                          'Bom Kim', 'support@coupang.com', 'jisoo.kim@coupang.com', SYSDATE, 
                           TO_DATE('2010-08-01', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('kakao02', 'kakao789', 'Park Minji', '031-1234-5678', 'Kakao', 88889999, 
                           'Yeo Minsoo', 'kakao@kakao.com', 'minji.park@kakao.com', SYSDATE, 
                           TO_DATE('2010-12-05', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('naver02', 'naver456', 'Choi Seunghyun', '02-2345-6789', 'Naver', 99990000, 
                           'Han Seongsoo', 'support@naver.com', 'seunghyun.choi@naver.com', SYSDATE, 
                           TO_DATE('2000-02-01', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('line01', 'line123', 'Jang Hyejin', '031-5432-9876', 'LINE', 11223344, 
                          'Idezawa Takeshi', 'support@line.com', 'hyejin.jang@line.com', SYSDATE, 
                          TO_DATE('2011-06-23', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('lotte01', 'lot123', 'Yoon Sunwoo', '02-6543-9876', 'Lotte', 22113344, 
                          'Shin Dongbin', 'info@lotte.com', 'sunwoo.yoon@lotte.com', SYSDATE, 
                          TO_DATE('1967-04-03', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('hanwha01', 'han123', 'Kim Hyeonwoo', '02-4567-7890', 'Hanwha', 33224455, 
                          'Kim Seungyoun', 'info@hanwha.com', 'hyeonwoo.kim@hanwha.com', SYSDATE, 
                           TO_DATE('1952-10-09', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('gsCaltex01', 'gsc123', 'Kim Dahyun', '010-1111-2222', 'GS Caltex', 55447788, 
                           'Huh Jinsoo', 'support@gscaltex.com', 'dahyun.kim@gscaltex.com', SYSDATE, 
                           TO_DATE('1967-05-19', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('kt01', 'kt456', 'Choi Minho', '02-7654-3210', 'KT', 66558899, 
                           'Koo Hyunmo', 'info@kt.com', 'minho.choi@kt.com', SYSDATE, 
                           TO_DATE('1981-12-10', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('hybe01', 'hybe789', 'Park Jiho', '010-4321-8765', 'HYBE', 77665588, 
                           'Bang Si-hyuk', 'info@hybe.com', 'jiho.park@hybe.com', SYSDATE, 
                           TO_DATE('2005-02-01', 'YYYY-MM-DD'));
                           
INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('cjGroup01', 'cj123', 'Lee Hyunwoo', '02-1234-5678', 'CJ Group', 77889911, 
                           'Lee Jae-hyun', 'support@cjgroup.com', 'hyunwoo.lee@cjgroup.com', SYSDATE, 
                            TO_DATE('1953-11-19', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('kbstar02', 'kb789', 'Park Seungmin', '02-5678-1234', 'KB Star', 88990012, 
                           'Yoon Jong-kyoo', 'info@kbstar.com', 'seungmin.park@kbstar.com', SYSDATE, 
                           TO_DATE('1964-09-03', 'YYYY-MM-DD'));

INSERT INTO COMPANY_USERS (COMPANY_ID, COMPANY_PASSWD, COMPANY_USER_NAME, COMPANY_PHONE, 
                           COMPANY_NAME, COMPANY_BCODE, COMPANY_BOSS_NAME, COMPANY_EMAIL, 
                           COMPANY_USER_EMAIL, COMPANY_REGDATE, COMPANY_ESTABLISH) 
VALUES                    ('hanjin01', 'hanjin456', 'Choi Jiho', '02-6789-1234', 'Hanjin', 99001122, 
                           'Cho Won-tae', 'contact@hanjin.com', 'jiho.choi@hanjin.com', SYSDATE, 
                            TO_DATE('1945-11-01', 'YYYY-MM-DD'));



-- 개인 이력서 INSERT FORM -----------------------------------------------------
-- 개인 이력서 -----------------------------------------------------------------
DROP TABLE USER_RESUME1;               --테이블 삭제
DELETE FROM USER_RESUME1;              --칼럼 삭제
DROP SEQUENCE USER_RESUME1_SEQ;        --시퀸스 삭제



CREATE SEQUENCE USER_RESUME1_SEQ
    START WITH 1         
    INCREMENT BY 1       
    NOCACHE;         
    
    
    
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서01', 'user01', 'Park Siyeon', 
                         TO_DATE('1996-04-15', 'YYYY-MM-DD'), '010-1111-1111', 'siyeon.park@green.com' 
                         ,11,'강남','JAVA를 매우 잘합니다01.', SYSDATE);

INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서02', 'user02', 'Lee Jiwon', 
                         TO_DATE('1996-04-16', 'YYYY-MM-DD'), '010-1111-1112', 'lee@green.com' 
                         ,24,'상문','JAVA를 매우 잘합니다02.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서03', 'user03', 'Uo Jiwon', 
                         TO_DATE('1996-04-17', 'YYYY-MM-DD'), '010-1111-1113', 'uo@green.com' 
                         ,25,'목동','JAVA를 매우 잘합니다03.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서04', 'user04', 'Kim Minseo', 
                         TO_DATE('1996-04-18', 'YYYY-MM-DD'), '010-1111-1114', 'kim@green.com' 
                         ,11,'강남','JAVA를 매우 잘합니다04.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서05', 'user05', 'Jung Hyeri', 
                         TO_DATE('1996-04-19', 'YYYY-MM-DD'), '010-1111-1115', 'jung05@green.com' 
                         ,24,'상문','JAVA를 매우 잘합니다05.', SYSDATE);

INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서06', 'user06', 'Yoon Jaewon', 
                         TO_DATE('1996-04-20', 'YYYY-MM-DD'), '010-1111-1116', 'yoon06@green.com' 
                         ,25,'목동','JAVA를 매우 잘합니다06.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서07', 'user07', 'Choi Yeonwoo', 
                         TO_DATE('1996-04-21', 'YYYY-MM-DD'), '010-1111-1117', 'choi07@green.com' 
                         ,22,'달서구','JAVA를 매우 잘합니다07.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서08', 'user08', 'Han Jisoo', 
                         TO_DATE('1996-04-22', 'YYYY-MM-DD'), '010-1111-1118', 'han08@green.com' 
                         ,26,'삼산동','JAVA를 매우 잘합니다08.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서09', 'user09', 'Park Soohyun', 
                         TO_DATE('1996-04-23', 'YYYY-MM-DD'), '010-1111-1119', 'park09@green.com' 
                         ,39,'월정리','JAVA를 매우 잘합니다09.', SYSDATE);

INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서10', 'user10', 'Lee Sunwoo', 
                         TO_DATE('1996-04-24', 'YYYY-MM-DD'), '010-1111-1120', 'lee10@green.com' 
                         ,11,'강남','JAVA를 매우 잘합니다10.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서11', 'user11', 'Oh Hyemin', 
                         TO_DATE('1996-04-25', 'YYYY-MM-DD'), '010-1111-1121', 'oh11@green.com', 
                         11, '강남', 'JAVA를 매우 잘합니다11.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서12', 'user12', 'Im Taewon', 
                         TO_DATE('1996-04-26', 'YYYY-MM-DD'), '010-1111-1122', 'im12@green.com', 
                         24, '상문', 'JAVA를 매우 잘합니다12.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서13', 'user13', 'Seo Eunji', 
                         TO_DATE('1996-04-27', 'YYYY-MM-DD'), '010-1111-1123', 'seo13@green.com', 
                         25, '목동', 'JAVA를 매우 잘합니다13.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서14', 'user14', 'Kim Junseo', 
                         TO_DATE('1996-04-28', 'YYYY-MM-DD'), '010-1111-1124', 'kim14@green.com', 
                         11, '강남', 'JAVA를 매우 잘합니다14.', SYSDATE);
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서15', 'user15', 'Park Yeji', 
                         TO_DATE('1996-04-29', 'YYYY-MM-DD'), '010-1111-1125', 'park15@green.com', 
                         24, '상문', 'JAVA를 매우 잘합니다15.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서16', 'user16', 'Jang Seohyun', 
                         TO_DATE('1996-04-30', 'YYYY-MM-DD'), '010-1111-1126', 'jang16@green.com', 
                         25, '목동', 'JAVA를 매우 잘합니다16.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서17', 'user17', 'Choi Doyoon', 
                         TO_DATE('1996-05-01', 'YYYY-MM-DD'), '010-1111-1127', 'choi17@green.com', 
                         22, '달서구', 'JAVA를 매우 잘합니다17.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서18', 'user18', 'Hong Minji', 
                         TO_DATE('1996-05-02', 'YYYY-MM-DD'), '010-1111-1128', 'hong18@green.com', 
                         26, '울산', 'JAVA를 매우 잘합니다18.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서19', 'user19', 'Yoon Jaehyun', 
                         TO_DATE('1996-05-03', 'YYYY-MM-DD'), '010-1111-1129', 'yoon19@green.com', 
                         39, '월정리', 'JAVA를 매우 잘합니다19.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, 
                         USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서20', 'user20', 'Lee Haeun', 
                         TO_DATE('1996-05-04', 'YYYY-MM-DD'), '010-1111-1130', 'lee20@green.com', 
                         11, '강남', 'JAVA를 매우 잘합니다20.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서21', 'user21', 'Kim Siyoon', 
                         TO_DATE('1996-05-05', 'YYYY-MM-DD'), '010-1111-1131', 'kim21@green.com', 
                         24, '상문', 'JAVA를 매우 잘합니다21.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서22', 'user22', 'Park Jihoon', 
                         TO_DATE('1996-05-06', 'YYYY-MM-DD'), '010-1111-1132', 'park22@green.com', 
                         11, '강남', 'JAVA를 매우 잘합니다22.', SYSDATE);
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서23', 'user23', 'Yoon Minho', 
                         TO_DATE('1996-05-07', 'YYYY-MM-DD'), '010-1111-1133', 'yoon@green.com', 
                         24, '상문', 'JAVA를 매우 잘합니다23.', SYSDATE);

INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서24', 'user24', 'Park Jihoon', 
                         TO_DATE('1996-05-08', 'YYYY-MM-DD'), '010-1111-1134', 'kim24@green.com', 
                         22, '달서구', 'JAVA를 매우 잘합니다24.', SYSDATE);
                 
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서25', 'user25', 'Kang Jiwon', 
                         TO_DATE('1996-05-09', 'YYYY-MM-DD'), '010-1111-1135', 'kang25@green.com', 
                         23, '화평동', 'JAVA를 매우 잘합니다25.', SYSDATE);               
                         
INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서26', 'user26', 'Shin Hyerim', 
                         TO_DATE('1996-05-10', 'YYYY-MM-DD'), '010-1111-1136', 'shin26@green.com', 
                         11, '강남', 'JAVA를 매우 잘합니다26.', SYSDATE);   

INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서27', 'user27', 'Cho Minjun', 
                         TO_DATE('1996-05-11', 'YYYY-MM-DD'), '010-1111-1137', 'cho27@green.com', 
                         23, '화평동', 'JAVA를 매우 잘합니다27.', SYSDATE);   

INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서28', 'user28', 'Jang Harin', 
                         TO_DATE('1996-05-12', 'YYYY-MM-DD'), '010-1111-1138', 'jang28@green.com', 
                         23, '화평동', 'JAVA를 매우 잘합니다28.', SYSDATE);   

INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서29', 'user29', 'Lee Junyong', 
                         TO_DATE('1996-05-13', 'YYYY-MM-DD'), '010-1111-1139', 'lee29@green.com', 
                         23, '화평동', 'JAVA를 매우 잘합니다29.', SYSDATE);   

INSERT INTO USER_RESUME (USER_RESUME_IDX, USER_TITLE, USER_ID, USER_NAME, 
                         USER_BIRTH, USER_PHONE, USER_EMAIL, REGION_IDX, 
                         REGION_ADDRESS, USER_INTRO, USER_RESUME_REGDATE) 
VALUES                  (USER_RESUME1_SEQ.NEXTVAL, '이력서30', 'user30', 'Park Yeseo', 
                         TO_DATE('1996-05-14', 'YYYY-MM-DD'), '010-1111-1140', 'park30@green.com', 
                         23, '화평동', 'JAVA를 매우 잘합니다30.', SYSDATE);   



-- 채용공고 INSERT FORM --------------------------------------------------------
-- 채용공고 --------------------------------------------------------------------
DROP TABLE COMPANY_RECRUIT;               --테이블 삭제
DELETE FROM COMPANY_RECRUIT;              --칼럼 삭제
DROP SEQUENCE COMPANY_RECRUIT_SEQ;        --시퀸스 삭제



CREATE SEQUENCE COMPANY_RECRUIT_SEQ
    START WITH 1         
    INCREMENT BY 1      
    NOCACHE;            
    
    
    
INSERT INTO COMPANY_RECRUIT (COMPANY_RECRUIT_IDX, COMPANY_ID, COMPANY_NAME, 
                             RECRUIT_TITLE, COMPANY_JOB, GETMAN, 
                             REGION_IDX,COMPANY_ADDRESS, COMPANY_INFO, 
                             APPLICATION_DEADLINE, 
                             COMPANY_ESTABLISH, COMPANY_RECRUIT_REGDATE) 
VALUES                      (COMPANY_RECRUIT_SEQ.NEXTVAL,'kaka01','kaka', 
                             '채용공고01', '프론트엔드',1,
                             11,'강남','저희 회사는 정말 좋은 회사입니다1',
                             TO_DATE('2024-12-31','YYYY-MM-DD'),
                             TO_DATE('2010-05-01','YYYY-MM-DD'),SYSDATE);

INSERT INTO COMPANY_RECRUIT (COMPANY_RECRUIT_IDX, COMPANY_ID, COMPANY_NAME, 
                             RECRUIT_TITLE, COMPANY_JOB, GETMAN, 
                             REGION_IDX,COMPANY_ADDRESS, COMPANY_INFO, 
                             APPLICATION_DEADLINE, 
                             COMPANY_ESTABLISH, COMPANY_RECRUIT_REGDATE) 
VALUES                      (COMPANY_RECRUIT_SEQ.NEXTVAL,'InnoTech02','InnoTech', 
                             '채용공고02', '백엔드',2,
                             26,'삼산동','저희 회사는 정말 좋은 회사입니다2',
                             TO_DATE('2025-01-01','YYYY-MM-DD'),
                             TO_DATE('2010-05-02','YYYY-MM-DD'),SYSDATE);
                             
INSERT INTO COMPANY_RECRUIT (COMPANY_RECRUIT_IDX, COMPANY_ID, COMPANY_NAME, 
                             RECRUIT_TITLE, COMPANY_JOB, GETMAN, 
                             REGION_IDX,COMPANY_ADDRESS, COMPANY_INFO, 
                             APPLICATION_DEADLINE, 
                             COMPANY_ESTABLISH, COMPANY_RECRUIT_REGDATE) 
VALUES                      (COMPANY_RECRUIT_SEQ.NEXTVAL,'naver01','Naver', 
                             '채용공고03', '데이터베이스',3,
                             23,'화평동','저희 회사는 정말 좋은 회사입니다3',
                             TO_DATE('2025-01-02','YYYY-MM-DD'),
                             TO_DATE('2010-05-03','YYYY-MM-DD'),SYSDATE);
                             
INSERT INTO COMPANY_RECRUIT (COMPANY_RECRUIT_IDX, COMPANY_ID, COMPANY_NAME, 
                             RECRUIT_TITLE, COMPANY_JOB, GETMAN, 
                             REGION_IDX,COMPANY_ADDRESS, COMPANY_INFO, 
                             APPLICATION_DEADLINE, 
                             COMPANY_ESTABLISH, COMPANY_RECRUIT_REGDATE) 
VALUES                      (COMPANY_RECRUIT_SEQ.NEXTVAL,'skTelecom02','SK Telecom', 
                             '채용공고04', '모바일',4,
                             23,'인천','저희 회사는 정말 좋은 회사입니다4',
                             TO_DATE('2025-01-02','YYYY-MM-DD'),
                             TO_DATE('2010-05-03','YYYY-MM-DD'),SYSDATE);
                             
INSERT INTO COMPANY_RECRUIT (COMPANY_RECRUIT_IDX, COMPANY_ID, COMPANY_NAME, 
                             RECRUIT_TITLE, COMPANY_JOB, GETMAN, 
                             REGION_IDX,COMPANY_ADDRESS, COMPANY_INFO, 
                             APPLICATION_DEADLINE, 
                             COMPANY_ESTABLISH, COMPANY_RECRUIT_REGDATE) 
VALUES                      (COMPANY_RECRUIT_SEQ.NEXTVAL,'samsung03','Samsung', 
                             '채용공고05', '프론트엔드',5,
                             11,'강남','저희 회사는 정말 좋은 회사입니다5',
                             TO_DATE('2025-01-03','YYYY-MM-DD'),
                             TO_DATE('2010-05-04','YYYY-MM-DD'),SYSDATE);
                             
INSERT INTO COMPANY_RECRUIT (COMPANY_RECRUIT_IDX, COMPANY_ID, COMPANY_NAME, 
                             RECRUIT_TITLE, COMPANY_JOB, GETMAN, 
                             REGION_IDX,COMPANY_ADDRESS, COMPANY_INFO, 
                             APPLICATION_DEADLINE, 
                             COMPANY_ESTABLISH, COMPANY_RECRUIT_REGDATE) 
VALUES                      (COMPANY_RECRUIT_SEQ.NEXTVAL,'lgElec04','LG Electronics', 
                             '채용공고06', '백엔드',6,
                             24,'상문','저희 회사는 정말 좋은 회사입니다2',
                             TO_DATE('2025-01-04','YYYY-MM-DD'),
                             TO_DATE('2010-05-05','YYYY-MM-DD'),SYSDATE);        



-- 메뉴 INSERT FORM ------------------------------------------------------------
-- 메뉴 ------------------------------------------------------------------------
DROP TABLE MENU;               --테이블 삭제
DELETE FROM MENU;              --칼럼 삭제
DROP SEQUENCE MENU;            --시퀸스 삭제



INSERT INTO MENU (MENU_IDX, MENU_TITLE)
VALUES           (1,'자유게시판');
INSERT INTO MENU (MENU_IDX, MENU_TITLE)
VALUES           (2,'기업 리뷰');



-- 커뮤니티 INSERT FORM --------------------------------------------------------
-- 커뮤니티 --------------------------------------------------------------------
DROP TABLE COMMUNITY;                --테이블 삭제
DELETE FROM COMMUNITY;               --칼럼 삭제
DROP SEQUENCE COMMUNITY1_SEQ;        --시퀸스 삭제



CREATE SEQUENCE COMMUNITY1_SEQ
    START WITH 1        
    INCREMENT BY 1       
    NOCACHE;          
    
    
    
INSERT INTO COMMUNITY (COMMUNITY_IDX,USER_ID, 
                       COMMUNITY_TITLE, COMMUNITY_CONTENT,MENU_IDX) 
VALUES                (COMMUNITY1_SEQ.NEXTVAL,'user50', 
                       '동영상', '재밌다?',1);

INSERT INTO COMMUNITY (COMMUNITY_IDX,USER_ID, 
                       COMMUNITY_TITLE, COMMUNITY_CONTENT,MENU_IDX) 
VALUES                (COMMUNITY1_SEQ.NEXTVAL,'user51', 
                       '저녁밥 추천좀', '뭐먹을까',1);
                       
INSERT INTO COMMUNITY (COMMUNITY_IDX,USER_ID, 
                       COMMUNITY_TITLE, COMMUNITY_CONTENT,MENU_IDX) 
VALUES                (COMMUNITY1_SEQ.NEXTVAL,'user52', 
                       '아침밥 추천좀', '간단하게',1);
                       
INSERT INTO COMMUNITY (COMMUNITY_IDX,USER_ID, 
                       COMMUNITY_TITLE, COMMUNITY_CONTENT,MENU_IDX) 
VALUES                (COMMUNITY1_SEQ.NEXTVAL,'user52', 
                       '점심밥 추천좀', '맛있는거',1);
                       
INSERT INTO COMMUNITY (COMMUNITY_IDX,USER_ID, 
                       COMMUNITY_TITLE, COMMUNITY_CONTENT,MENU_IDX) 
VALUES                (COMMUNITY1_SEQ.NEXTVAL,'user53', 
                       '재밌는 게임 뭐 있을까', 'ㅇㅇ',1);
                       
                       
                       
-- 기업 리뷰 INSERT FORM -------------------------------------------------------
-- 기업 리뷰 -------------------------------------------------------------------
DROP TABLE REVIEW_COMPANY;                --테이블 삭제
DELETE FROM REVIEW_COMPANY;               --칼럼 삭제
DROP SEQUENCE REVIEW_COMPANY_SEQ;         --시퀸스 삭제



CREATE SEQUENCE REVIEW_COMPANY_SEQ
    START WITH 1         
    INCREMENT BY 1     
    NOCACHE;           



INSERT INTO REVIEW_COMPANY (USER_ID, REVIEW_COMPANY_IDX, WRITER, COMPANY_NAME,
                            TITLE, CONTENT, STAR, MENU_IDX)
VALUES                     ('user40', REVIEW_COMPANY_SEQ.NEXTVAL,'user40','InnoTech',
                            '좋은 회사입니다','사수분이 정말 친절하게 알려주셔서 금방 적응했습니다.',10,2);
                            
INSERT INTO REVIEW_COMPANY (USER_ID, REVIEW_COMPANY_IDX, WRITER, COMPANY_NAME,
                            TITLE, CONTENT, STAR, MENU_IDX)
VALUES                     ('user41', REVIEW_COMPANY_SEQ.NEXTVAL,'user41','POSCO',
                            '복지가 좋아요','회사 복지가 정말 좋아요.',9,2);
                            
INSERT INTO REVIEW_COMPANY (USER_ID, REVIEW_COMPANY_IDX, WRITER, COMPANY_NAME,
                            TITLE, CONTENT, STAR, MENU_IDX)
VALUES                     ('user42', REVIEW_COMPANY_SEQ.NEXTVAL,'user42','LINE',
                            '사장님 좋아요','사장님이 보너스를 많이 주십니다.',10,2);

INSERT INTO REVIEW_COMPANY (USER_ID, REVIEW_COMPANY_IDX, WRITER, COMPANY_NAME,
                            TITLE, CONTENT, STAR, MENU_IDX)
VALUES                     ('user43', REVIEW_COMPANY_SEQ.NEXTVAL,'user43','Lotte',
                            '기업이 수평적이에요','수평적인 기업 문화에요.',8,2);
                            
INSERT INTO REVIEW_COMPANY (USER_ID, REVIEW_COMPANY_IDX, WRITER, COMPANY_NAME,
                            TITLE, CONTENT, STAR, MENU_IDX)
VALUES                     ('user44', REVIEW_COMPANY_SEQ.NEXTVAL,'user44','KT',
                            '기숙사가 좋아요','기숙사가 있어서 너무 좋아요.',7,2);
                            
                            
                            
-- 지원내역 INSERT FORM --------------------------------------------------------
-- 지원내역 --------------------------------------------------------------------
DROP TABLE APPLICATIONS;                --테이블 삭제
DELETE FROM APPLICATIONS;               --칼럼 삭제
DROP SEQUENCE APPLICATIONS_SEQ;         --시퀸스 삭제



CREATE SEQUENCE APPLICATIONS_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE;
    
    
    
DELETE FROM APPLICATIONS;
DROP SEQUENCE APPLICATIONS_SEQ;
INSERT INTO APPLICATIONS(APPLICATIONS_IDX, USER_RESUME_IDX, 
                         COMPANY_RECRUIT_IDX, APPLICATION_STATUS, APPLIED_DATE) 
VALUES                  (APPLICATIONS_SEQ.NEXTVAL, 1, 
                         1, '심사중', SYSDATE);

INSERT INTO APPLICATIONS(APPLICATIONS_IDX, USER_RESUME_IDX, 
                         COMPANY_RECRUIT_IDX, APPLICATION_STATUS, APPLIED_DATE) 
VALUES                  (APPLICATIONS_SEQ.NEXTVAL, 2, 
                         3, '면접중', SYSDATE);
                         
INSERT INTO APPLICATIONS(APPLICATIONS_IDX, USER_RESUME_IDX, 
                         COMPANY_RECRUIT_IDX, APPLICATION_STATUS, APPLIED_DATE) 
VALUES                  (APPLICATIONS_SEQ.NEXTVAL, 4, 
                         4, '합격', SYSDATE);
                         
INSERT INTO APPLICATIONS(APPLICATIONS_IDX, USER_RESUME_IDX, 
                         COMPANY_RECRUIT_IDX, APPLICATION_STATUS, APPLIED_DATE) 
VALUES                  (APPLICATIONS_SEQ.NEXTVAL, 5, 
                         5, '탈락', SYSDATE);
                         
INSERT INTO APPLICATIONS(APPLICATIONS_IDX, USER_RESUME_IDX, 
                         COMPANY_RECRUIT_IDX, APPLICATION_STATUS, APPLIED_DATE) 
VALUES                  (APPLICATIONS_SEQ.NEXTVAL, 6, 
                         6, '심사중', SYSDATE);         
                         
                         

-- 북마크 INSERT FORM ----------------------------------------------------------
-- 북마크 ----------------------------------------------------------------------
DROP TABLE USERS_BOOKMARK;                --테이블 삭제
DELETE FROM USERS_BOOKMARK;               --칼럼 삭제
DROP SEQUENCE USERS_SEQ;                  --시퀸스 삭제



CREATE SEQUENCE USERS_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE;
DELETE FROM USERS_BOOKMARK;
DROP SEQUENCE USERS_SEQ;



INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user01', 1,SYSDATE,
                            0);
                            
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user02', 1,SYSDATE,
                            0);

INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user03', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user04', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user05', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user06', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user07', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user08', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user09', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user10', 1,SYSDATE,
                            0);                      
                    
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user11', 1,SYSDATE,
                            0);
                            
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user12', 1,SYSDATE,
                            0);

INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user13', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user14', 1,SYSDATE,
                            1);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user15', 1,SYSDATE,
                            1);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user16', 1,SYSDATE,
                            1);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user17', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user18', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user19', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user20', 1,SYSDATE,
                           0);                      
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user21', 1,SYSDATE,
                            0);
                            
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user22', 1,SYSDATE,
                            0);

INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user23', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user24', 1,SYSDATE,
                            1);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user25', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user26', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user27', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user28', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user29', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user30', 1,SYSDATE,
                            0);            
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user31', 1,SYSDATE,
                            0);
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user32', 1,SYSDATE,
                            0);

INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user33', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user34', 1,SYSDATE,
                            1);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user35', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user36', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user37', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user38', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user39', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user40', 1,SYSDATE,
                            0);                      
                    
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user41', 1,SYSDATE,
                            0);
                            
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user42', 1,SYSDATE,
                            0);

INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user43', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user44', 1,SYSDATE,
                            1);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user45', 1,SYSDATE,
                            1);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user46', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user47', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user48', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user49', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user50', 1,SYSDATE,
                            0);                      
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user51', 1,SYSDATE,
                            0);
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user52', 1,SYSDATE,
                            0);

INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user53', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user54', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user55', 1,SYSDATE,
                            1);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user56', 1,SYSDATE,
                            1);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user57', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK)
VALUES                     (USERS_SEQ.NEXTVAL,'user58', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user59', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user60', 1,SYSDATE,
                            0);    
                
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user61', 1,SYSDATE,
                            1);                      
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user62', 1,SYSDATE,
                            0);
                            
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user63', 1,SYSDATE,
                            0);

INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user64', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user65', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user66', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user67', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user68', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user69', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user70', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user71', 1,SYSDATE,
                            1);            
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user72', 1,SYSDATE,
                            0);
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user73', 1,SYSDATE,
                            0);

INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user74', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user75', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user76', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user77', 1,SYSDATE,
                            1);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user78', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user79', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user80', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user81', 1,SYSDATE,
                            0);                      
                    
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user82', 1,SYSDATE,
                            1);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user83', 1,SYSDATE,
                            0);

INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user84', 1,SYSDATE,
                            1);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user85', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user86', 1,SYSDATE,
                            1);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user87', 1,SYSDATE,
                            1);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user88', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user89', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user90', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user91', 1,SYSDATE,
                            0);                      
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user92', 1,SYSDATE,
                            1);
                            
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user93', 1,SYSDATE,
                            1);

INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user94', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user95', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user96', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user97', 1,SYSDATE,
                            1);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                    (USERS_SEQ.NEXTVAL,'user98', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK)
VALUES                     (USERS_SEQ.NEXTVAL,'user99', 1,SYSDATE,
                            0);
                      
INSERT INTO USERS_BOOKMARK (BOOKMARK_IDX, USER_ID,
                            COMPANY_RECRUIT_IDX, BOOKMARK_DATE, 
                            BOOKMARK_CHECK) 
VALUES                     (USERS_SEQ.NEXTVAL,'user100', 1,SYSDATE,
                            1);
                      
            

-- 개인 공통 스킬 --------------------------------------------------------------
-- 개인 공통 스킬 --------------------------------------------------------------
DROP TABLE COMMON_USER_RESUME_SKILL;                --테이블 삭제
DELETE FROM COMMON_USER_RESUME_SKILL;               --칼럼 삭제
DROP SEQUENCE COMMON_USER_RESUME_SKILL_SEQ;         --시퀸스 삭제



CREATE SEQUENCE COMMON_USER_RESUME_SKILL_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE;           
    
    
    
INSERT INTO COMMON_USER_RESUME_SKILL (COMMON_USER_IDX, SKILL_NAME, USER_RESUME_IDX)
VALUES                               (COMMON_USER_RESUME_SKILL_SEQ.NEXTVAL,'JAVA',1);
INSERT INTO COMMON_USER_RESUME_SKILL (COMMON_USER_IDX, SKILL_NAME, USER_RESUME_IDX)
VALUES                               (COMMON_USER_RESUME_SKILL_SEQ.NEXTVAL,'JAVA',2);
INSERT INTO COMMON_USER_RESUME_SKILL (COMMON_USER_IDX, SKILL_NAME, USER_RESUME_IDX)
VALUES                               (COMMON_USER_RESUME_SKILL_SEQ.NEXTVAL,'JAVA',4);
INSERT INTO COMMON_USER_RESUME_SKILL (COMMON_USER_IDX, SKILL_NAME, USER_RESUME_IDX)
VALUES                               (COMMON_USER_RESUME_SKILL_SEQ.NEXTVAL,'JAVA',5);
INSERT INTO COMMON_USER_RESUME_SKILL (COMMON_USER_IDX, SKILL_NAME, USER_RESUME_IDX)
VALUES                               (COMMON_USER_RESUME_SKILL_SEQ.NEXTVAL,'JAVA',6);



-- 기업 공통 스킬 --------------------------------------------------------------
-- 기업 공통 스킬 --------------------------------------------------------------
DROP TABLE COMMON_COMPANY_RECRUIT_SKILL;                --테이블 삭제
DELETE FROM COMMON_COMPANY_RECRUIT_SKILL;               --칼럼 삭제
DROP SEQUENCE COMMON_COMPANY_RECRUIT_SKILL_SEQ;         --시퀸스 삭제



CREATE SEQUENCE COMMON_COMPANY_RECRUIT_SKILL_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE;   
    
    
    
INSERT INTO COMMON_COMPANY_RECRUIT_SKILL (COMMON_COMPANY_IDX, SKILL_NAME, COMPANY_RECRUIT_IDX)
VALUES                                   (COMMON_COMPANY_RECRUIT_SKILL_SEQ.NEXTVAL,'JAVA',1);
INSERT INTO COMMON_COMPANY_RECRUIT_SKILL (COMMON_COMPANY_IDX, SKILL_NAME, COMPANY_RECRUIT_IDX)
VALUES                                   (COMMON_COMPANY_RECRUIT_SKILL_SEQ.NEXTVAL,'JAVA',3);
INSERT INTO COMMON_COMPANY_RECRUIT_SKILL (COMMON_COMPANY_IDX, SKILL_NAME, COMPANY_RECRUIT_IDX)
VALUES                                   (COMMON_COMPANY_RECRUIT_SKILL_SEQ.NEXTVAL,'JAVA',4);
INSERT INTO COMMON_COMPANY_RECRUIT_SKILL (COMMON_COMPANY_IDX, SKILL_NAME, COMPANY_RECRUIT_IDX)
VALUES                                   (COMMON_COMPANY_RECRUIT_SKILL_SEQ.NEXTVAL,'JAVA',5);
INSERT INTO COMMON_COMPANY_RECRUIT_SKILL (COMMON_COMPANY_IDX, SKILL_NAME, COMPANY_RECRUIT_IDX)
VALUES                                   (COMMON_COMPANY_RECRUIT_SKILL_SEQ.NEXTVAL,'JAVA',6);


                   
-- 유저 서비스 센터 INSERT FORM -----------------------------------------------------
-- 유저 서비스 센터 -----------------------------------------------------------------
DROP TABLE USER_SERVICE_CENTER;                --테이블 삭제
DELETE FROM USER_SERVICE_CENTER;               --칼럼 삭제
DROP SEQUENCE USER_SERVICE_CENTER_SEQ;         --시퀸스 삭제



CREATE SEQUENCE USER_SERVICE_CENTER_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE;
    
    
    
INSERT INTO USER_SERVICE_CENTER (SERVICE_CENTER_IDX, USER_ID,WRITER,TITLE,CONTENT)
VALUES                          (USER_SERVICE_CENTER_SEQ.NEXTVAL,'user50','user50','문의합니다','비번을 까먹었어요');
INSERT INTO USER_SERVICE_CENTER (SERVICE_CENTER_IDX, USER_ID,WRITER,TITLE,CONTENT)
VALUES                          (USER_SERVICE_CENTER_SEQ.NEXTVAL,'user51','user51','아이디를 까먹었어요','아이디를 까먹었어요');
INSERT INTO USER_SERVICE_CENTER (SERVICE_CENTER_IDX, USER_ID,WRITER,TITLE,CONTENT)
VALUES                          (USER_SERVICE_CENTER_SEQ.NEXTVAL,'user52','user52','안녕하세요','아이디 수정 되나요');
INSERT INTO USER_SERVICE_CENTER (SERVICE_CENTER_IDX, USER_ID,WRITER,TITLE,CONTENT)
VALUES                          (USER_SERVICE_CENTER_SEQ.NEXTVAL,'user53','user53','비밀번호 변경','비밀번호를 변경하고 싶어요');
INSERT INTO USER_SERVICE_CENTER (SERVICE_CENTER_IDX, USER_ID,WRITER,TITLE,CONTENT)
VALUES                          (USER_SERVICE_CENTER_SEQ.NEXTVAL,'user54', 'user54','회원탈퇴','회원탈퇴를 하고싶어요');



-- 기업 서비스 센터 INSERT FORM ------------------------------------------------
-- 기업 서비스 센터 ------------------------------------------------------------
DROP TABLE COMPANY_SERVICE_CENTER;                --테이블 삭제
DELETE FROM COMPANY_SERVICE_CENTER;               --칼럼 삭제
DROP SEQUENCE COMPANY_SERVICE_CENTER_SEQ;         --시퀸스 삭제



CREATE SEQUENCE COMPANY_SERVICE_CENTER_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE;
    
    
    
INSERT INTO COMPANY_SERVICE_CENTER (COMPANY_SERVICE_CENTER_IDX, COMPANY_ID,WRITER,TITLE,CONTENT)
VALUES                             (COMPANY_SERVICE_CENTER_SEQ.NEXTVAL,'InnoTech02','InnoTech02','문의합니다','비번을 까먹었어요');
INSERT INTO COMPANY_SERVICE_CENTER (COMPANY_SERVICE_CENTER_IDX, COMPANY_ID,WRITER,TITLE,CONTENT)
VALUES                             (COMPANY_SERVICE_CENTER_SEQ.NEXTVAL,'hyundai05','hyundai05','아이디를 까먹었어요','아이디를 까먹었어요');
INSERT INTO COMPANY_SERVICE_CENTER (COMPANY_SERVICE_CENTER_IDX, COMPANY_ID,WRITER,TITLE,CONTENT)
VALUES                             (COMPANY_SERVICE_CENTER_SEQ.NEXTVAL,'hanjin01','hanjin01','안녕하세요','아이디 수정 되나요');
INSERT INTO COMPANY_SERVICE_CENTER (COMPANY_SERVICE_CENTER_IDX, COMPANY_ID,WRITER,TITLE,CONTENT)
VALUES                             (COMPANY_SERVICE_CENTER_SEQ.NEXTVAL,'gsCaltex01','gsCaltex01','비밀번호 변경','비밀번호를 변경하고 싶어요');
INSERT INTO COMPANY_SERVICE_CENTER (COMPANY_SERVICE_CENTER_IDX, COMPANY_ID,WRITER,TITLE,CONTENT)
VALUES                             (COMPANY_SERVICE_CENTER_SEQ.NEXTVAL,'coupang07', 'coupang07','회원탈퇴','회원탈퇴를 하고싶어요');



-- 지역 INSERT FORM ------------------------------------------------------------
-- 지역 ------------------------------------------------------------------------
DROP TABLE REGION;             --테이블 삭제
DELETE FROM REGION;            --칼럼 삭제



INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 00, '전국');
INSERT INTO REGION (REGION_NUMBER, REGION_NAME)
VALUES             ( 21, '부산');
INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 11, '서울');
INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 24, '광주');
INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 25, '대전');
INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 22, '대구');
INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 26, '울산');
INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 39, '제주');
INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 23, '인천');
INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 38, '경상남도');
INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 37, '경상북도');
INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 36, '전라남도');
INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 35, '전라북도');
INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 34, '충청남도');
INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 33, '충청북도');
INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 32, '강원도');
INSERT INTO REGION (REGION_IDX, REGION_NAME)
VALUES             ( 31, '경기도');



-- 스킬 INSERT FORM ------------------------------------------------------------
-- 백엔드 ======================================================================
DROP TABLE SKILLS;               --테이블 삭제
DELETE FROM SKILLS;              --칼럼 삭제

INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME) 
VALUES            ('백엔드', 'JAVA');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME) 
VALUES            ('백엔드', 'JAVASCRIPT');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME) 
VALUES            ('백엔드', 'PYTHON');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME) 
VALUES            ('백엔드', 'RUBY');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME) 
VALUES            ('백엔드', 'PHP');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME) 
VALUES            ('백엔드', 'C#');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME) 
VALUES            ('백엔드', 'GO');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME) 
VALUES            ('백엔드', 'RUST');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME) 
VALUES            ('백엔드', 'KOTLIN');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME) 
VALUES            ('백엔드', 'SPRING');
-- 데이터베이스 ================================================================
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES            ('데이터베이스', 'MYSQL');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES            ('데이터베이스', 'POSTGRESQL');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES            ('데이터베이스', 'ORACLE');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES            ('데이터베이스', 'MIRCROSOFT SQL SERVER');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES            ('데이터베이스', 'SQLITE');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES            ('데이터베이스', 'MONGODB');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES            ('데이터베이스', 'CASSANDRA');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES            ('데이터베이스', 'REDIS');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES            ('데이터베이스', 'MARIADB');
-- 프론트엔드 ==================================================================
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '프론트엔드', 'HTML');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '프론트엔드', 'CSS');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '프론트엔드', 'JAVASCRIPT');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '프론트엔드', 'REACT');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '프론트엔드', 'VUE.JS');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '프론트엔드', 'ANGULAR');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '프론트엔드', 'SVELTE');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '프론트엔드', 'TYPESCRIPT');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '프론트엔드', 'BOOTSTRAP');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '프론트엔드', 'TAILWIND');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '프론트엔드', 'WEBPACK');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '프론트엔드', 'BABEL');
-- 협업툴 ======================================================================
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '협업툴', 'SLACK');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '협업툴', 'TRELLO');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '협업툴', 'ASANA');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '협업툴', 'JIRA');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '협업툴', 'NOTION');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '협업툴', 'ZOOM');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '협업툴', 'GITHUB');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '협업툴', 'CONFLUENCE');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '협업툴', 'MONDAY.COM');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '협업툴', 'CLICKUP');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '협업툴', 'FIGMA');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '협업툴', 'MIRO');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '협업툴', 'AIRTABLE');
-- 모바일 ======================================================================
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'KAKAOTALK');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'LINE');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'WHATSAPP');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'FACEBOOK MESSENGER');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'WECHAR');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'TELEGRAM');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'VIBER');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'SIGNAL');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'DISCORD');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'SLACK');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'SKYPE');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'MICROSOFT TEAMS');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'GOOGLE CHAT');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'I MESSAGE');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)-
VALUES( '모바일', 'KIK');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'ZALO');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'HIKE');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'THREEMA');
INSERT INTO SKILLS (SKILL_STACK, SKILL_NAME)
VALUES( '모바일', 'GROUPME');

COMMIT;
