-- user
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE` RESTRICT;

-- career
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE2` RESTRICT;

-- job
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE3` RESTRICT;

-- introduce
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE4` RESTRICT;

-- icon
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE5` RESTRICT;

-- dictionary
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE6` RESTRICT;

-- review
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE7` RESTRICT;

-- portfolio
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE8` RESTRICT;

-- reply
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE9` RESTRICT;

-- mentorboard
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE10` RESTRICT;

-- counselBoard
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE11` RESTRICT;

-- educational_level
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE12` RESTRICT;

-- certificate
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE13` RESTRICT;

-- mentoring
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE14` RESTRICT;

-- freeBoard
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE15` RESTRICT;

-- files
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE16` RESTRICT;

-- fileGroup
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE17` RESTRICT;

-- replyGroup
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE18` RESTRICT;

-- dic_select
DROP TABLE IF EXISTS `MY_SCHEMA`.`TABLE19` RESTRICT;

-- user
CREATE TABLE `MY_SCHEMA`.`TABLE` (
	`id`       VARCHAR(30)  NOT NULL COMMENT '아이디', -- id
	`pw`       VARCHAR(100) NOT NULL COMMENT '비밀번호', -- pw
	`name`     VARCHAR(20)  NOT NULL COMMENT '이름', -- name
	`phone`    VARCHAR(15)  NULL     COMMENT '연락처', -- phone
	`email`    VARCHAR(50)  NOT NULL COMMENT '이메일', -- email
	`birthday` DATE         NOT NULL COMMENT '생년월일', -- birthday
	`type`     VARCHAR(20)  NOT NULL COMMENT '타입', -- type
	`idx`      INT          NOT NULL COMMENT '인덱스', -- idx
	`icon_num` INT          NULL     COMMENT 'icon_num' -- icon_num
)
COMMENT 'user';

-- user
ALTER TABLE `MY_SCHEMA`.`TABLE`
	ADD CONSTRAINT `PK_TABLE` -- user 기본키
		PRIMARY KEY (
			`id` -- id
		);

-- career
CREATE TABLE `MY_SCHEMA`.`TABLE2` (
	`num`         INT          NOT NULL COMMENT 'PK', -- num
	`company_num` VARCHAR(100) NULL     COMMENT '회사명', -- company_name
	`dept_name`   VARCHAR(50)  NULL     COMMENT '부서명', -- dept_name
	`indate`      DATE         NULL     COMMENT '입사일', -- indate
	`outdate`     DATE         NULL     COMMENT '퇴사일', -- outdate
	`id`          VARCHAR(30)  NULL     COMMENT '아이디' -- id
)
COMMENT 'career';

-- career
ALTER TABLE `MY_SCHEMA`.`TABLE2`
	ADD CONSTRAINT `PK_TABLE2` -- career 기본키
		PRIMARY KEY (
			`num` -- num
		);

-- job
CREATE TABLE `MY_SCHEMA`.`TABLE3` (
	`job_num`  INT          NOT NULL COMMENT 'job_num', -- job_num
	`position` VARCHAR(100) NULL     COMMENT 'position', -- position
	`kinds`    VARCHAR(100) NULL     COMMENT 'kinds', -- kinds
	`duty`     VARCHAR(100) NULL     COMMENT 'duty', -- duty
	`id`       VARCHAR(30)  NULL     COMMENT 'id' -- id
)
COMMENT 'job';

-- job
ALTER TABLE `MY_SCHEMA`.`TABLE3`
	ADD CONSTRAINT `PK_TABLE3` -- job 기본키
		PRIMARY KEY (
			`job_num` -- job_num
		);

-- introduce
CREATE TABLE `MY_SCHEMA`.`TABLE4` (
	`introduce_num` INT           NOT NULL COMMENT 'introduce_num', -- introduce_num
	`title`         VARCHAR(200)  NULL     COMMENT 'title', -- title
	`content`       VARCHAR(1000) NULL     COMMENT 'content', -- content
	`id`            VARCHAR(30)   NULL     COMMENT 'id' -- id
)
COMMENT 'introduce';

-- introduce
ALTER TABLE `MY_SCHEMA`.`TABLE4`
	ADD CONSTRAINT `PK_TABLE4` -- introduce 기본키
		PRIMARY KEY (
			`introduce_num` -- introduce_num
		);

-- icon
CREATE TABLE `MY_SCHEMA`.`TABLE5` (
	`icon_num` INT          NOT NULL COMMENT 'icon_num', -- icon_num
	`icon_src` VARCHAR(100) NULL     COMMENT 'icon_src' -- icon_src
)
COMMENT 'icon';

-- icon
ALTER TABLE `MY_SCHEMA`.`TABLE5`
	ADD CONSTRAINT `PK_TABLE5` -- icon 기본키
		PRIMARY KEY (
			`icon_num` -- icon_num
		);

-- dictionary
CREATE TABLE `MY_SCHEMA`.`TABLE6` (
	`dic_num` INT          NOT NULL COMMENT 'dic_num', -- dic_num
	`content` VARCHAR(100) NULL     COMMENT 'content' -- content
)
COMMENT 'dictionary';

-- dictionary
ALTER TABLE `MY_SCHEMA`.`TABLE6`
	ADD CONSTRAINT `PK_TABLE6` -- dictionary 기본키
		PRIMARY KEY (
			`dic_num` -- dic_num
		);

-- review
CREATE TABLE `MY_SCHEMA`.`TABLE7` (
	`review_num` INT           NOT NULL COMMENT 'review_num', -- review_num
	`title`      VARCHAR(200)  NULL     COMMENT 'title', -- title
	`content`    VARCHAR(1000) NULL     COMMENT 'content', -- content
	`score`      INT           NULL     COMMENT 'score', -- score
	`earn_id`    VARCHAR(30)   NULL     COMMENT 'earn_id', -- earn_id
	`id`         VARCHAR(30)   NULL     COMMENT 'id' -- id
)
COMMENT 'review';

-- review
ALTER TABLE `MY_SCHEMA`.`TABLE7`
	ADD CONSTRAINT `PK_TABLE7` -- review 기본키
		PRIMARY KEY (
			`review_num` -- review_num
		);

-- portfolio
CREATE TABLE `MY_SCHEMA`.`TABLE8` (
	`portfolio_num` INT          NOT NULL COMMENT 'PK', -- portfolio_num
	`fileName`      VARCHAR(100) NULL     COMMENT 'fileName', -- fileName
	`fileSize`      INT          NULL     COMMENT 'fileSize', -- fileSize
	`fileHash`      VARCHAR(200) NULL     COMMENT 'fileHash', -- fileHash
	`id`            VARCHAR(30)  NULL     COMMENT 'id' -- id
)
COMMENT 'portfolio';

-- portfolio
ALTER TABLE `MY_SCHEMA`.`TABLE8`
	ADD CONSTRAINT `PK_TABLE8` -- portfolio 기본키
		PRIMARY KEY (
			`portfolio_num` -- portfolio_num
		);

-- reply
CREATE TABLE `MY_SCHEMA`.`TABLE9` (
	`rb_num`     INT           NOT NULL COMMENT 'rb_num', -- rb_num
	`fb_num`     INT           NULL     COMMENT 'fb_num', -- fb_num
	`cb_num`     INT           NULL     COMMENT 'cb_num', -- cb_num
	`title`      VARCHAR(200)  NULL     COMMENT 'title', -- title
	`content`    VARCHAR(1000) NULL     COMMENT 'content', -- content
	`regDate`    DATE          NULL     COMMENT 'regDate', -- regDate
	`parentNum`  INT           NULL     COMMENT 'parentNum', -- parentNum
	`childCount` INT           NULL     COMMENT 'childCount', -- childCount
	`position`   VARCHAR(30)   NULL     COMMENT 'position', -- position
	`id`         VARCHAR(30)   NULL     COMMENT 'id' -- id
)
COMMENT 'reply';

-- reply
ALTER TABLE `MY_SCHEMA`.`TABLE9`
	ADD CONSTRAINT `PK_TABLE9` -- reply 기본키
		PRIMARY KEY (
			`rb_num` -- rb_num
		);

-- mentorboard
CREATE TABLE `MY_SCHEMA`.`TABLE10` (
	`mb_num`  INT           NOT NULL COMMENT 'PK', -- mb_num
	`title`   VARCHAR(200)  NULL     COMMENT '제목', -- title
	`content` VARCHAR(1000) NULL     COMMENT '내용', -- content
	`regDate` DATE          NULL     COMMENT '등록일자', -- regDate
	`id`      VARCHAR(30)   NULL     COMMENT '아이디' -- id
)
COMMENT 'mentorboard';

-- mentorboard
ALTER TABLE `MY_SCHEMA`.`TABLE10`
	ADD CONSTRAINT `PK_TABLE10` -- mentorboard 기본키
		PRIMARY KEY (
			`mb_num` -- mb_num
		);

-- counselBoard
CREATE TABLE `MY_SCHEMA`.`TABLE11` (
	`cb_num`       INT           NOT NULL COMMENT 'cb_num', -- cb_num
	`title`        VARCHAR(200)  NULL     COMMENT 'title', -- title
	`content`      VARCHAR(1000) NULL     COMMENT 'content', -- content
	`makePublic`   VARCHAR(10)   NULL     COMMENT 'makePublic', -- makePublic
	`regDate`      DATE          NULL     COMMENT 'regDate', -- regDate
	`hit`          INT           NULL     COMMENT 'hit', -- hit
	`id`           VARCHAR(30)   NULL     COMMENT 'id', -- id
	`fileGroupNum` INT           NULL     COMMENT 'fileGroupNum' -- fileGroupNum
)
COMMENT 'counselBoard';

-- counselBoard
ALTER TABLE `MY_SCHEMA`.`TABLE11`
	ADD CONSTRAINT `PK_TABLE11` -- counselBoard 기본키
		PRIMARY KEY (
			`cb_num` -- cb_num
		);

-- educational_level
CREATE TABLE `MY_SCHEMA`.`TABLE12` (
	`eduLevel_num`    INT          NOT NULL COMMENT 'PK', -- eduLevel_num
	`degree_level`    VARCHAR(10)  NULL     COMMENT '학업수준', -- degree_level
	`school_name`     VARCHAR(50)  NULL     COMMENT '학교명', -- school_name
	`admission_date`  DATE         NULL     COMMENT '입학일', -- admission_date
	`graduation_date` DATE         NULL     COMMENT '졸업일', -- graduation_date
	`current_status`  VARCHAR(50)  NULL     COMMENT '현재상태', -- current_status
	`major`           VARCHAR(100) NULL     COMMENT '전공', -- major
	`avg_score`       DECIMAL(3,2) NULL     COMMENT '평점', -- avg_score
	`total_score`     INT          NULL     COMMENT '총점', -- total_score
	`id`              VARCHAR(30)  NULL     COMMENT '아이디' -- id
)
COMMENT 'educational_level';

-- educational_level
ALTER TABLE `MY_SCHEMA`.`TABLE12`
	ADD CONSTRAINT `PK_TABLE12` -- educational_level 기본키
		PRIMARY KEY (
			`eduLevel_num` -- eduLevel_num
		);

-- certificate
CREATE TABLE `MY_SCHEMA`.`TABLE13` (
	`certificate_num`      INT          NOT NULL COMMENT 'certificate_num', -- certificate_num
	`certificate_name`     VARCHAR(50)  NULL     COMMENT 'certificate_name', -- certificate_name
	`published_by_license` VARCHAR(100) NULL     COMMENT 'published_by_license', -- published_by_license
	`acquisition_date`     DATE         NULL     COMMENT 'acquisition_date', -- acquisition_date
	`id`                   VARCHAR(30)  NULL     COMMENT 'id' -- id
)
COMMENT 'certificate';

-- certificate
ALTER TABLE `MY_SCHEMA`.`TABLE13`
	ADD CONSTRAINT `PK_TABLE13` -- certificate 기본키
		PRIMARY KEY (
			`certificate_num` -- certificate_num
		);

-- mentoring
CREATE TABLE `MY_SCHEMA`.`TABLE14` (
	`mentoring_num` INT           NOT NULL COMMENT 'mentoring_num', -- mentoring_num
	`cb_num`        INT           NULL     COMMENT 'cb_num', -- cb_num
	`mb_num`        INT           NULL     COMMENT 'mb_num', -- mb_num
	`status`        VARCHAR(20)   NULL     COMMENT 'status', -- status
	`content`       VARCHAR(1000) NULL     COMMENT 'content' -- content
)
COMMENT 'mentoring';

-- mentoring
ALTER TABLE `MY_SCHEMA`.`TABLE14`
	ADD CONSTRAINT `PK_TABLE14` -- mentoring 기본키
		PRIMARY KEY (
			`mentoring_num` -- mentoring_num
		);

-- freeBoard
CREATE TABLE `MY_SCHEMA`.`TABLE15` (
	`fb_num`       INT           NOT NULL COMMENT 'fb_num', -- fb_num
	`title`        VARCHAR(200)  NULL     COMMENT 'title', -- title
	`content`      VARCHAR(1000) NULL     COMMENT 'content', -- content
	`regDate`      DATE          NULL     COMMENT 'regDate', -- regDate
	`hit`          INT           NULL     COMMENT 'hit', -- hit
	`id`           VARCHAR(30)   NULL     COMMENT 'id', -- id
	`fileGroupNum` INT           NULL     COMMENT 'fileGroupNum' -- fileGroupNum
)
COMMENT 'freeBoard';

-- freeBoard
ALTER TABLE `MY_SCHEMA`.`TABLE15`
	ADD CONSTRAINT `PK_TABLE15` -- freeBoard 기본키
		PRIMARY KEY (
			`fb_num` -- fb_num
		);

-- files
CREATE TABLE `MY_SCHEMA`.`TABLE16` (
	`fileGroupNum`  INT          NOT NULL COMMENT 'fileGroupNum', -- fileGroupNum
	`file_num`      INT          NOT NULL COMMENT 'file_num', -- file_num
	`original_name` VARCHAR(50)  NULL     COMMENT 'original_name', -- original_name
	`fileName`      VARCHAR(100) NULL     COMMENT 'fileName', -- fileName
	`fileSize`      INT          NULL     COMMENT 'fileSize', -- fileSize
	`fileHash`      VARCHAR(200) NULL     COMMENT 'fileHash', -- fileHash
	`fileExtension` VARCHAR(20)  NULL     COMMENT 'fileExtension', -- fileExtension
	`regDate`       DATE         NULL     COMMENT 'regDate' -- regDate
)
COMMENT 'files';

-- files
ALTER TABLE `MY_SCHEMA`.`TABLE16`
	ADD CONSTRAINT `PK_TABLE16` -- files 기본키
		PRIMARY KEY (
			`fileGroupNum`, -- fileGroupNum
			`file_num`      -- file_num
		);

-- fileGroup
CREATE TABLE `MY_SCHEMA`.`TABLE17` (
	`fileGroupNum`  INT          NOT NULL COMMENT 'fileGroupNum', -- fileGroupNum
	`fileGroupPath` VARCHAR(200) NULL     COMMENT 'fileGroupPath' -- fileGroupPath
)
COMMENT 'fileGroup';

-- fileGroup
ALTER TABLE `MY_SCHEMA`.`TABLE17`
	ADD CONSTRAINT `PK_TABLE17` -- fileGroup 기본키
		PRIMARY KEY (
			`fileGroupNum` -- fileGroupNum
		);

-- replyGroup
CREATE TABLE `MY_SCHEMA`.`TABLE18` (
	`COL`  <데이터 타입 없음> NOT NULL COMMENT 'rg_num', -- rg_num
	`COL2` <데이터 타입 없음> NULL     COMMENT 'name' -- name
)
COMMENT 'replyGroup';

-- replyGroup
ALTER TABLE `MY_SCHEMA`.`TABLE18`
	ADD CONSTRAINT `PK_TABLE18` -- replyGroup 기본키
		PRIMARY KEY (
			`COL` -- rg_num
		);

-- dic_select
CREATE TABLE `MY_SCHEMA`.`TABLE19` (
	`dic_num` INT         NULL COMMENT 'dic_num', -- dic_num
	`id`      VARCHAR(30) NULL COMMENT 'id' -- id
)
COMMENT 'dic_select';

-- user
ALTER TABLE `MY_SCHEMA`.`TABLE`
	ADD CONSTRAINT `FK_TABLE5_TO_TABLE` -- icon -> user
		FOREIGN KEY (
			`icon_num` -- icon_num
		)
		REFERENCES `MY_SCHEMA`.`TABLE5` ( -- icon
			`icon_num` -- icon_num
		);

-- career
ALTER TABLE `MY_SCHEMA`.`TABLE2`
	ADD CONSTRAINT `FK_TABLE_TO_TABLE2` -- user -> career
		FOREIGN KEY (
			`id` -- id
		)
		REFERENCES `MY_SCHEMA`.`TABLE` ( -- user
			`id` -- id
		);

-- job
ALTER TABLE `MY_SCHEMA`.`TABLE3`
	ADD CONSTRAINT `FK_TABLE_TO_TABLE3` -- user -> job
		FOREIGN KEY (
			`id` -- id
		)
		REFERENCES `MY_SCHEMA`.`TABLE` ( -- user
			`id` -- id
		);

-- introduce
ALTER TABLE `MY_SCHEMA`.`TABLE4`
	ADD CONSTRAINT `FK_TABLE_TO_TABLE4` -- user -> introduce
		FOREIGN KEY (
			`id` -- id
		)
		REFERENCES `MY_SCHEMA`.`TABLE` ( -- user
			`id` -- id
		);

-- review
ALTER TABLE `MY_SCHEMA`.`TABLE7`
	ADD CONSTRAINT `FK_TABLE_TO_TABLE7` -- user -> review
		FOREIGN KEY (
			`id` -- id
		)
		REFERENCES `MY_SCHEMA`.`TABLE` ( -- user
			`id` -- id
		);

-- portfolio
ALTER TABLE `MY_SCHEMA`.`TABLE8`
	ADD CONSTRAINT `FK_TABLE_TO_TABLE8` -- user -> portfolio
		FOREIGN KEY (
			`id` -- id
		)
		REFERENCES `MY_SCHEMA`.`TABLE` ( -- user
			`id` -- id
		);

-- reply
ALTER TABLE `MY_SCHEMA`.`TABLE9`
	ADD CONSTRAINT `FK_TABLE_TO_TABLE9` -- user -> reply
		FOREIGN KEY (
			`id` -- id
		)
		REFERENCES `MY_SCHEMA`.`TABLE` ( -- user
			`id` -- id
		);

-- reply
ALTER TABLE `MY_SCHEMA`.`TABLE9`
	ADD CONSTRAINT `FK_TABLE15_TO_TABLE9` -- freeBoard -> reply
		FOREIGN KEY (
			`fb_num` -- fb_num
		)
		REFERENCES `MY_SCHEMA`.`TABLE15` ( -- freeBoard
			`fb_num` -- fb_num
		);

-- reply
ALTER TABLE `MY_SCHEMA`.`TABLE9`
	ADD CONSTRAINT `FK_TABLE11_TO_TABLE9` -- counselBoard -> reply
		FOREIGN KEY (
			`cb_num` -- cb_num
		)
		REFERENCES `MY_SCHEMA`.`TABLE11` ( -- counselBoard
			`cb_num` -- cb_num
		);

-- mentorboard
ALTER TABLE `MY_SCHEMA`.`TABLE10`
	ADD CONSTRAINT `FK_TABLE_TO_TABLE10` -- user -> mentorboard
		FOREIGN KEY (
			`id` -- id
		)
		REFERENCES `MY_SCHEMA`.`TABLE` ( -- user
			`id` -- id
		);

-- counselBoard
ALTER TABLE `MY_SCHEMA`.`TABLE11`
	ADD CONSTRAINT `FK_TABLE_TO_TABLE11` -- user -> counselBoard
		FOREIGN KEY (
			`id` -- id
		)
		REFERENCES `MY_SCHEMA`.`TABLE` ( -- user
			`id` -- id
		);

-- counselBoard
ALTER TABLE `MY_SCHEMA`.`TABLE11`
	ADD CONSTRAINT `FK_TABLE17_TO_TABLE11` -- fileGroup -> counselBoard
		FOREIGN KEY (
			`fileGroupNum` -- fileGroupNum
		)
		REFERENCES `MY_SCHEMA`.`TABLE17` ( -- fileGroup
			`fileGroupNum` -- fileGroupNum
		);

-- educational_level
ALTER TABLE `MY_SCHEMA`.`TABLE12`
	ADD CONSTRAINT `FK_TABLE_TO_TABLE12` -- user -> educational_level
		FOREIGN KEY (
			`id` -- id
		)
		REFERENCES `MY_SCHEMA`.`TABLE` ( -- user
			`id` -- id
		);

-- certificate
ALTER TABLE `MY_SCHEMA`.`TABLE13`
	ADD CONSTRAINT `FK_TABLE_TO_TABLE13` -- user -> certificate
		FOREIGN KEY (
			`id` -- id
		)
		REFERENCES `MY_SCHEMA`.`TABLE` ( -- user
			`id` -- id
		);

-- mentoring
ALTER TABLE `MY_SCHEMA`.`TABLE14`
	ADD CONSTRAINT `FK_TABLE11_TO_TABLE14` -- counselBoard -> mentoring
		FOREIGN KEY (
			`cb_num` -- cb_num
		)
		REFERENCES `MY_SCHEMA`.`TABLE11` ( -- counselBoard
			`cb_num` -- cb_num
		);

-- mentoring
ALTER TABLE `MY_SCHEMA`.`TABLE14`
	ADD CONSTRAINT `FK_TABLE10_TO_TABLE14` -- mentorboard -> mentoring
		FOREIGN KEY (
			`mb_num` -- mb_num
		)
		REFERENCES `MY_SCHEMA`.`TABLE10` ( -- mentorboard
			`mb_num` -- mb_num
		);

-- freeBoard
ALTER TABLE `MY_SCHEMA`.`TABLE15`
	ADD CONSTRAINT `FK_TABLE_TO_TABLE15` -- user -> freeBoard
		FOREIGN KEY (
			`id` -- id
		)
		REFERENCES `MY_SCHEMA`.`TABLE` ( -- user
			`id` -- id
		);

-- freeBoard
ALTER TABLE `MY_SCHEMA`.`TABLE15`
	ADD CONSTRAINT `FK_TABLE17_TO_TABLE15` -- fileGroup -> freeBoard
		FOREIGN KEY (
			`fileGroupNum` -- fileGroupNum
		)
		REFERENCES `MY_SCHEMA`.`TABLE17` ( -- fileGroup
			`fileGroupNum` -- fileGroupNum
		);

-- files
ALTER TABLE `MY_SCHEMA`.`TABLE16`
	ADD CONSTRAINT `FK_TABLE17_TO_TABLE16` -- fileGroup -> files
		FOREIGN KEY (
			`fileGroupNum` -- fileGroupNum
		)
		REFERENCES `MY_SCHEMA`.`TABLE17` ( -- fileGroup
			`fileGroupNum` -- fileGroupNum
		);

-- dic_select
ALTER TABLE `MY_SCHEMA`.`TABLE19`
	ADD CONSTRAINT `FK_TABLE6_TO_TABLE19` -- dictionary -> dic_select
		FOREIGN KEY (
			`dic_num` -- dic_num
		)
		REFERENCES `MY_SCHEMA`.`TABLE6` ( -- dictionary
			`dic_num` -- dic_num
		);

-- dic_select
ALTER TABLE `MY_SCHEMA`.`TABLE19`
	ADD CONSTRAINT `FK_TABLE_TO_TABLE19` -- user -> dic_select
		FOREIGN KEY (
			`id` -- id
		)
		REFERENCES `MY_SCHEMA`.`TABLE` ( -- user
			`id` -- id
		);drop user inturn cascade;

create user inturn identified by 1234;
grant dba to inturn;
conn inturn/1234;

drop table users;
drop table job;
drop table career;
drop table educational_level;
drop table certificate;
drop table introduce;
drop table mentorBoard;
drop table review;
drop table counselStatus;
drop table counselReply;
drop table counselBoard;
drop table replyBoard;
drop table csBoard;
drop table freeBoard;
drop table fileGroup;
drop table files;

/**********************************/
/* Table Name: users */
/**********************************/
CREATE TABLE users(
		id                            		VARCHAR2(20)		 NULL ,
		pw                            		VARCHAR2(100)		 NOT NULL,
		name                          		VARCHAR2(20)		 NOT NULL,
		phone                         		VARCHAR2(15)		 NOT NULL,
		birthday                      		DATE		 NOT NULL,
		type                          		VARCHAR2(20)		 NOT NULL
);

/**********************************/
/* Table Name: job */
/**********************************/
CREATE TABLE job(
		job_num                       		NUMBER		 NULL ,
		position                      		VARCHAR2(30)		 NOT NULL,
		kinds                         		VARCHAR2(30)		 NOT NULL,
		duty                          		VARCHAR2(100)		 NOT NULL,
		id                            		VARCHAR2(20)		 NULL
);

/**********************************/
/* Table Name: career */
/**********************************/
CREATE TABLE career(
		num                           		NUMBER		 NULL ,
		company_name                  		VARCHAR2(30)		 NULL ,
		department_name               		VARCHAR2(50)		 NULL ,
		join_date                     		DATE		 NULL ,
		retirement_date               		DATE		 NULL ,
		id                            		VARCHAR2(20)		 NULL 
);

/**********************************/
/* Table Name: educational_level */
/**********************************/
CREATE TABLE educational_level(
		num                           		NUMBER		 NULL ,
		degree_level                  		VARCHAR2(30)		 NULL ,
		school_name                   		VARCHAR2(30)		 NULL ,
		admission_date                		DATE		 NULL ,
		graduation_date               		DATE		 NULL ,
		current_status                		VARCHAR2(30)		 NULL ,
		major                         		VARCHAR2(30)		 NULL ,
		avg_credit                    		DOUBLE PRECISION		 NULL ,
		total_credit                  		DOUBLE PRECISION		 NULL ,
		id                            		VARCHAR2(20)		 NULL 
);

/**********************************/
/* Table Name: certificate */
/**********************************/
CREATE TABLE certificate(
		num                           		NUMBER		 NULL ,
		certificate_name              		VARCHAR2(100)		 NULL ,
		published_by_license          		VARCHAR2(100)		 NULL ,
		Acquisition_date              		DATE		 NULL ,
		id                            		VARCHAR2(20)		 NULL 
);

/**********************************/
/* Table Name: introduce */
/**********************************/
CREATE TABLE introduce(
		num                           		NUMBER		 NULL ,
		title                         		VARCHAR2(200)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		id                            		VARCHAR2(20)		 NULL 
);

/**********************************/
/* Table Name: mentorBoard */
/**********************************/
CREATE TABLE mentorBoard(
		num                           		NUMBER		 NOT NULL,
		id                            		VARCHAR2(20)		 NULL,
		title                         		VARCHAR2(100)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		dicNum                        		NUMBER		 NOT NULL,
		regDate                       		DATE		 NOT NULL
);

/**********************************/
/* Table Name: review */
/**********************************/
CREATE TABLE review(
		num                           		NUMBER		 NOT NULL,
		dicNum                        		NUMBER		 NOT NULL,
		id                            		VARCHAR2(20)		 NOT NULL,
		title                         		VARCHAR2(100)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		score                         		DOUBLE PRECISION		 NOT NULL,
		earn_id                       		VARCHAR2(40)		 NOT NULL
);

/**********************************/
/* Table Name: counselBoard */
/**********************************/
CREATE TABLE counselBoard(
		counselBoardNum               		NUMBER		 NOT NULL,
		id                            		VARCHAR2(20)		 NULL ,
		title                         		VARCHAR2(100)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		makePublic                    		VARCHAR(3)		 NOT NULL,
		dicNum                        		NUMBER		 NULL ,
		regDate                       		DATE		 NOT NULL
);

/**********************************/
/* Table Name: counselStatus */
/**********************************/
CREATE TABLE counselStatus(
		counselNum                    		NUMBER		 NOT NULL,
		mentee_id                     		VARCHAR2(20)		 NOT NULL,
		mentor_id                     		VARCHAR2(20)		 NOT NULL,
		status                        		VARCHAR2(10)		 NOT NULL,
		counselBoardNum               		NUMBER		 NULL 
);

/**********************************/
/* Table Name: counselReply */
/**********************************/
CREATE TABLE counselReply(
		num                           		NUMBER		 NULL ,
		title                         		VARCHAR2(100)		 NULL ,
		content                       		VARCHAR2(4000)		 NULL ,
		regDate                       		DATE		 NULL ,
		counselBoardNum               		NUMBER(10)		 NULL 
);

/**********************************/
/* Table Name: replyBoard */
/**********************************/
CREATE TABLE replyBoard(
		num                           		NUMBER		 NOT NULL,
		id                            		VARCHAR2(20)		 NULL,
		title                         		VARCHAR2(100)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		regDate                       		DATE		 NOT NULL,
		parentNum                     		NUMBER		 NOT NULL,
		childCount                    		NUMBER		 NOT NULL,
		position                      		VARCHAR2(30)		 NOT NULL,
		freeBoardNum                  		NUMBER		 NOT NULL
);

/**********************************/
/* Table Name: csBoard */
/**********************************/
CREATE TABLE csBoard(
		csBoardNum                    		NUMBER		 NOT NULL,
		id                            		VARCHAR2(20)		 NULL,
		title                         		VARCHAR2(100)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		regDate                       		DATE		 NOT NULL,
		count                         		NUMBER		 NOT NULL,
		secret                        		VARCHAR2(3)		 NOT NULL,
		parentNum                     		VARCHAR2(10)		 NOT NULL,
		childCount                    		NUMBER		 NOT NULL,
		position                      		NUMBER		 NOT NULL
);

/**********************************/
/* Table Name: freeBoard */
/**********************************/
CREATE TABLE freeBoard(
		freeBoardNum                  		NUMBER		 NOT NULL,
		id                            		VARCHAR2(20)		 NULL, 
		title                         		VARCHAR2(100)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		regDate                       		DATE		 NOT NULL,
		count                         		NUMBER		 NOT NULL
);

/**********************************/
/* Table Name: fileGroup */
/**********************************/
CREATE TABLE fileGroup(
		fileGroupNum                  		NUMBER		 NOT NULL,
		freeBoardNum                  		NUMBER		 NULL ,
		csBoardNum                    		NUMBER		 NULL 
);

/**********************************/
/* Table Name: files */
/**********************************/
CREATE TABLE files(
		fileNum                       		NUMBER		 NOT NULL,
		fileName                      		VARCHAR2(100)		 NOT NULL,
		fileSize                      		NUMBER		 NOT NULL,
		fileHash                      		VARCHAR2(4000)		 NOT NULL,
		fileGroupNum                  		NUMBER		 NOT NULL
);

ALTER TABLE users ADD CONSTRAINT IDX_users_PK PRIMARY KEY (id);

ALTER TABLE job ADD CONSTRAINT IDX_job_PK PRIMARY KEY (job_num);
ALTER TABLE job ADD CONSTRAINT IDX_job_FK0 FOREIGN KEY (id) REFERENCES users (id);

ALTER TABLE career ADD CONSTRAINT IDX_career_PK PRIMARY KEY (num);
ALTER TABLE career ADD CONSTRAINT IDX_career_FK0 FOREIGN KEY (id) REFERENCES users (id);

ALTER TABLE educational_level ADD CONSTRAINT IDX_educational_level_PK PRIMARY KEY (num);
ALTER TABLE educational_level ADD CONSTRAINT IDX_educational_level_FK0 FOREIGN KEY (id) REFERENCES users (id);

ALTER TABLE certificate ADD CONSTRAINT IDX_certificate_PK PRIMARY KEY (num);
ALTER TABLE certificate ADD CONSTRAINT IDX_certificate_FK0 FOREIGN KEY (id) REFERENCES users (id);

ALTER TABLE introduce ADD CONSTRAINT IDX_introduce_PK PRIMARY KEY (num);
ALTER TABLE introduce ADD CONSTRAINT IDX_introduce_FK0 FOREIGN KEY (id) REFERENCES users (id);

ALTER TABLE mentorBoard ADD CONSTRAINT IDX_mentorBoard_PK PRIMARY KEY (num);
ALTER TABLE mentorBoard ADD CONSTRAINT IDX_mentorBoard_FK0 FOREIGN KEY (id) REFERENCES users (id);

ALTER TABLE review ADD CONSTRAINT IDX_review_PK PRIMARY KEY (num);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK0 FOREIGN KEY (id) REFERENCES users (id);

ALTER TABLE counselBoard ADD CONSTRAINT IDX_counselBoard_PK PRIMARY KEY (counselBoardNum);
ALTER TABLE counselBoard ADD CONSTRAINT IDX_counselBoard_FK0 FOREIGN KEY (id) REFERENCES users (id);

ALTER TABLE counselReply ADD CONSTRAINT IDX_counselReply_PK PRIMARY KEY (num);
ALTER TABLE counselReply ADD CONSTRAINT IDX_counselReply_FK0 FOREIGN KEY (counselBoardNum) REFERENCES counselBoard (counselBoardNum);

ALTER TABLE counselStatus ADD CONSTRAINT IDX_counselStatus_PK PRIMARY KEY (counselNum);
ALTER TABLE counselStatus ADD CONSTRAINT IDX_counselStatus_FK0 FOREIGN KEY (counselBoardNum) REFERENCES counselBoard (counselBoardNum);

ALTER TABLE freeBoard ADD CONSTRAINT IDX_freeBoard_PK PRIMARY KEY (freeBoardNum);
ALTER TABLE freeBoard ADD CONSTRAINT IDX_freeBoard_FK0 FOREIGN KEY (id) REFERENCES users (id);

ALTER TABLE csBoard ADD CONSTRAINT IDX_csBoard_PK PRIMARY KEY (csBoardNum);
ALTER TABLE csBoard ADD CONSTRAINT IDX_csBoard_FK0 FOREIGN KEY (id) REFERENCES users (id);

ALTER TABLE replyBoard ADD CONSTRAINT IDX_replyBoard_PK PRIMARY KEY (num);
ALTER TABLE replyBoard ADD CONSTRAINT IDX_replyBoard_FK0 FOREIGN KEY (freeBoardNum) REFERENCES freeBoard (freeBoardNum);
ALTER TABLE replyBoard ADD CONSTRAINT IDX_replyBoard_FK1 FOREIGN KEY (id) REFERENCES users (id);

ALTER TABLE fileGroup ADD CONSTRAINT IDX_fileGroup_PK PRIMARY KEY (fileGroupNum);
ALTER TABLE fileGroup ADD CONSTRAINT IDX_fileGroup_FK0 FOREIGN KEY (csBoardNum) REFERENCES csBoard (csBoardNum);
ALTER TABLE fileGroup ADD CONSTRAINT IDX_fileGroup_FK1 FOREIGN KEY (freeBoardNum) REFERENCES freeBoard (freeBoardNum);

ALTER TABLE files ADD CONSTRAINT IDX_files_PK PRIMARY KEY (fileNum);
ALTER TABLE files ADD CONSTRAINT IDX_files_FK0 FOREIGN KEY (fileGroupNum) REFERENCES fileGroup (fileGroupNum);

