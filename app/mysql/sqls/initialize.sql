CREATE TABLE buildings (
  `id`                  INT(10) UNSIGNED AUTO_INCREMENT NOT NULL  COMMENT 'file id of uploaded',
  `vendor_id`           INT(10) UNSIGNED NOT NULL                 COMMENT 'vendor id',
  `project_id`          INT(10) UNSIGNED NOT NULL                 COMMENT 'project id',
  `upload_user_id`      INT(10) UNSIGNED NOT NULL                 COMMENT 'project id',
  `kind`                tinyint NOT NULL                          COMMENT '0:ipa, 1:apk',
  `app_name`            VARCHAR(700)                              COMMENT 'app name',
  `icon`                VARCHAR(200)                              COMMENT 'icon name',
  `current_version`     VARCHAR(20)                               COMMENT 'current app version',
  `min_os_version`      float                                     COMMENT 'app install target version',
  `bundle_id`           VARCHAR(100)                              COMMENT 'bundle id of apple app',
  `package_name`        VARCHAR(100)                              COMMENT 'package name of android app',
  `file_name`           VARCHAR(100) NOT NULL                     COMMENT 'uuid+timestamp+original_file_name',
  `original_file_name`  VARCHAR(100) NOT NULL                     COMMENT 'upload file name by user',
  `plist_file_name`     VARCHAR(100)                              COMMENT 'plist file name for ipa download',
  `release_note`        TEXT                                      COMMENT 'release note for this application',
  `enabled`             tinyint NOT NULL                          COMMENT 'flag for to download application',
  `created`     DATETIME NOT NULL                                 COMMENT 'created date of this record',
  `updated`     DATETIME                                          COMMENT 'updated date of this record',
  `unregisted`  DATETIME                                          COMMENT 'deleted date of this record',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE reports (
  `id`                  INT(10) UNSIGNED AUTO_INCREMENT NOT NULL  COMMENT 'report id',
  `report_building_id`  INT(10) UNSIGNED NOT NULL                 COMMENT 'buildings id',
  `report_user_id`      INT(10) UNSIGNED NOT NULL                 COMMENT 'user id',
  `note`                TEXT                                      COMMENT 'note for this app',
  `created`             DATETIME NOT NULL                         COMMENT 'created date of this record',
  `updated`             DATETIME                                  COMMENT 'updated date of this record',
  `unregisted`          DATETIME                                  COMMENT 'deleted date of this record',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE vendors (
  `id`                  INT(10) UNSIGNED AUTO_INCREMENT NOT NULL  COMMENT 'vendor id',
  `name`                VARCHAR(700) NOT NULL                     COMMENT 'vendor name',
  `api_key`             VARCHAR(700) NOT NULL                     COMMENT 'api key',
  `contractor_user_id`  INT(10) UNSIGNED                          COMMENT 'user id who contracted',
  `country`             VARCHAR(700) NOT NULL                     COMMENT 'vendors country',
  `province`            VARCHAR(700) NOT NULL                     COMMENT 'vendors province',
  `city`                VARCHAR(700) NOT NULL                     COMMENT 'vendors city',
  `address`             VARCHAR(700) NOT NULL                     COMMENT 'vendors address',
  `zip_code`            VARCHAR(100) NOT NULL                     COMMENT 'vendors zipcode',
  `tel`                 VARCHAR(100) NOT NULL                     COMMENT 'vendors telephone number',
  `created`     DATETIME NOT NULL                                 COMMENT 'created date of this record',
  `updated`     DATETIME                                          COMMENT 'updated date of this record',
  `unregisted`  DATETIME                                          COMMENT 'deleted date of this record',
  PRIMARY KEY (`id`),
  UNIQUE KEY api_key_unique_key (`api_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE projects (
  `id`                  INT(10) UNSIGNED AUTO_INCREMENT NOT NULL  COMMENT 'project id',
  `vendor_id`           INT(10) UNSIGNED NOT NULL                 COMMENT 'vendor id',
  `name`                VARCHAR(700) NOT NULL                     COMMENT 'project name',
  `image_1`             VARCHAR(200)                              COMMENT 'image name 1',
  `image_2`             VARCHAR(200)                              COMMENT 'image name 2',
  `image_3`             VARCHAR(200)                              COMMENT 'image name 3',
  `image_4`             VARCHAR(200)                              COMMENT 'image name 4',
  `image_5`             VARCHAR(200)                              COMMENT 'image name 5',
  `overview`            TEXT                                      COMMENT 'note for this project',
  `created`     DATETIME NOT NULL                                 COMMENT 'created date of this record',
  `updated`     DATETIME                                          COMMENT 'updated date of this record',
  `unregisted`  DATETIME                                          COMMENT 'deleted date of this record',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE users (
  `id`                  INT(10) UNSIGNED AUTO_INCREMENT NOT NULL  COMMENT 'user id',
  `vendor_id`           INT(10) UNSIGNED                          COMMENT 'vendor id',
  `first_name`          VARCHAR(700)  NOT NULL                    COMMENT 'user first name',
  `last_name`           VARCHAR(700)  NOT NULL                    COMMENT 'user last name',
  `authority_type`      INT(10) UNSIGNED                          COMMENT 'user type',
  `name`                VARCHAR(700) NOT NULL                     COMMENT 'user name for login',
  `email`               VARCHAR(700) NOT NULL                     COMMENT 'user email address',
  `password`            VARCHAR(700) NOT NULL                     COMMENT 'user pass word',
  `secret_key`          VARCHAR(700) NOT NULL                     COMMENT 'secret key',
  `code`                VARCHAR(6)                                COMMENT 'signup verified code',
  `verified`            tinyint NOT NULL                          COMMENT 'signup verified result. 0: not verified, 1: verified',
  `created`     DATETIME NOT NULL                                 COMMENT 'created date of this record',
  `updated`     DATETIME                                          COMMENT 'updated date of this record',
  `unregisted`  DATETIME                                          COMMENT 'deleted date of this record',
  PRIMARY KEY (`id`),
  UNIQUE KEY name_unique_key (`name`),
  UNIQUE KEY secret_key_unique_key (`secret_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE user_manage_projects (
  `id`                  INT(10) UNSIGNED AUTO_INCREMENT NOT NULL  COMMENT 'manage project id',
  `user_id`             INT(10) UNSIGNED                          COMMENT 'user id',
  `vendor_id`           INT(10) UNSIGNED                          COMMENT 'vendor id',
  `project_id`          INT(10) UNSIGNED                          COMMENT 'project id',
  `created`     DATETIME NOT NULL                                 COMMENT 'created date of this record',
  `updated`     DATETIME                                          COMMENT 'updated date of this record',
  `unregisted`  DATETIME                                          COMMENT 'deleted date of this record',
  PRIMARY KEY (`id`),
  UNIQUE KEY user_and_project_unique_key (`user_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE m_authority (
  `type`                 INT(10) UNSIGNED NOT NULL                COMMENT 'type id',
  `name`                 VARCHAR(100) NOT NULL                    COMMENT 'type name',
  `add`                  tinyint NOT NULL                         COMMENT 'the user can add',
  `edit`                 tinyint NOT NULL                         COMMENT 'the user can edit',
  `delete`               tinyint NOT NULL                         COMMENT 'the user can delete',
  `management`           tinyint NOT NULL                         COMMENT 'the user can manage in the vendor',
  `management_add`       tinyint NOT NULL                         COMMENT 'the user can add in management',
  `management_edit`      tinyint NOT NULL                         COMMENT 'the user can edit in management',
  `management_delete`    tinyint NOT NULL                         COMMENT 'the user can delete in management',
  `created`     DATETIME NOT NULL                                 COMMENT 'created date of this record',
  `updated`     DATETIME                                          COMMENT 'updated date of this record',
  `unregisted`  DATETIME                                          COMMENT 'deleted date of this record',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- constraint

-- vendorsには設定しない

-- alter table projects add FOREIGN KEY (`vendor_id`) REFERENCES vendors(`id`) ON UPDATE ON DELETE CASCADE;
-- alter table users add FOREIGN KEY (`vendor_id`) REFERENCES vendors(`id`) ON UPDATE CASCADE;
-- alter table users add FOREIGN KEY (`authority_type`) REFERENCES m_authority(`type`) ON UPDATE CASCADE;
-- alter table buildings add FOREIGN KEY (`vendor_id`) REFERENCES vendors(`id`) ON UPDATE CASCADE;
-- alter table buildings add FOREIGN KEY (`project_id`) REFERENCES projects(`id`) ON UPDATE CASCADE;
-- alter table buildings add FOREIGN KEY (`upload_user_id`) REFERENCES users(`id`) ON UPDATE CASCADE;
-- alter table reports add FOREIGN KEY (`report_building_id`) REFERENCES buildings(`id`) ON UPDATE CASCADE;
-- alter table reports add FOREIGN KEY (`report_user_id`) REFERENCES users(`id`) ON UPDATE CASCADE;
-- alter table user_manage_projects add FOREIGN KEY(`user_id`) REFERENCES users(`id`) ON UPDATE CASCADE;
-- alter table user_manage_projects add FOREIGN KEY(`project_id`) REFERENCES projects(`id`) ON UPDATE CASCADE;

-- commit;


-- data

insert into m_authority(`type`,`add`,`edit`,`delete`,`management`, `management_add`,`management_edit`, `management_delete`, `name`, created, updated, unregisted)
values(0,1,1,1,1,1,1,1, "admin", now(), null, null);
insert into m_authority(`type`,`add`,`edit`,`delete`,`management`, `management_add`,`management_edit`, `management_delete`, `name`, created, updated, unregisted)
values(1,1,1,1,0,0,0,0, "user", now(), null, null);
insert into m_authority(`type`,`add`,`edit`,`delete`,`management`, `management_add`,`management_edit`, `management_delete`, `name`, created, updated, unregisted)
values(2,0,0,0,0,0,0,0, "tester", now(), null, null);

commit;
