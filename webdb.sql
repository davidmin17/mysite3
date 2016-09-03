--drop table emaillist;
--drop table guestbook;
--drop table board;
--drop table user;

-- �̸��ϸ��
CREATE TABLE `emaillist` (
	`no`         INTEGER UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '��ȣ',   -- ��ȣ
	`first_name` VARCHAR(50)      NOT NULL                COMMENT '��',     -- ��
	`last_name`  VARCHAR(50)      NOT NULL                COMMENT '�̸�',   -- �̸�
	`email`      VARCHAR(200)     NOT NULL                COMMENT '�̸���', -- �̸���
	PRIMARY KEY(no)
)ENGINE=INNODB COMMENT '�̸��ϸ��';



-- ����
CREATE TABLE `guestbook` (
	`no`       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '��ȣ', -- ��ȣ
	`name`     VARCHAR(100)     NOT NULL COMMENT '�̸�',                -- �̸�
	`reg_date` DATETIME         NOT NULL COMMENT '�����',              -- �����
	`message`  TEXT             NOT NULL COMMENT '�޼���',              -- �޼���
	`password`   VARCHAR(64)    NOT NULL COMMENT '��й�ȣ',            -- ��й�ȣ
	PRIMARY KEY(no)
)ENGINE=INNODB COMMENT '����';


-- ȸ��
CREATE TABLE `user` (
	`no`     INTEGER UNSIGNED      NOT NULL AUTO_INCREMENT COMMENT '��ȣ',     -- ��ȣ
	`name`   VARCHAR(100)          NOT NULL                COMMENT '�̸�',     -- �̸�
	`email`  VARCHAR(200)          NOT NULL                COMMENT '�̸���',   -- �̸���
	`passwd` VARCHAR(80)           NOT NULL                COMMENT '��й�ȣ', -- ��й�ȣ
	`gender` ENUM('FEMALE','MALE') NOT NULL                COMMENT '����',     -- ����
	PRIMARY KEY(no)
)ENGINE=INNODB COMMENT 'ȸ��';

-- �Խ���
CREATE TABLE `board` (
	`no`         INTEGER UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '��ȣ',     -- ��ȣ
	`title`      VARCHAR(200)     NOT NULL                COMMENT '����',     -- ����
	`content`    TEXT             NOT NULL                COMMENT '����',     -- ����
	`view_count` INTEGER UNSIGNED NOT NULL                COMMENT '��ȸ��',   -- ��ȸ��
	`reg_date`   DATETIME         NOT NULL                COMMENT '�ۼ���',   -- �ۼ���
	`user_no`    INTEGER UNSIGNED NOT NULL                COMMENT 'ȸ����ȣ', -- ȸ����ȣ
        PRIMARY KEY(no),
        CONSTRAINT `FK_user_TO_board` FOREIGN KEY (`user_no`) REFERENCES `user` (`no`)
)ENGINE=INNODB COMMENT '�Խ���';


