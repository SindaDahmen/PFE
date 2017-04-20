--
-- Script was generated by Devart dbForge Studio for MySQL, Version 7.2.34.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 20/04/2017 11:22:41
-- Server version: 5.1.73-community
-- Client version: 4.1
--


-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

-- 
-- Set default database
--
USE batchs;

--
-- Definition for table batch
--
DROP TABLE IF EXISTS batch;
CREATE TABLE batch (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  url VARCHAR(255) NOT NULL,
  http_verb VARCHAR(45) DEFAULT NULL,
  description VARCHAR(255) DEFAULT NULL,
  parameters VARCHAR(255) DEFAULT NULL,
  project_id INT(11) NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_batch_project_idx (project_id),
  CONSTRAINT fk_batch_project FOREIGN KEY (project_id)
    REFERENCES project(id) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 4096
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table batch_job_execution
--
DROP TABLE IF EXISTS batch_job_execution;
CREATE TABLE batch_job_execution (
  JOB_EXECUTION_ID BIGINT(20) NOT NULL AUTO_INCREMENT,
  VERSION BIGINT(20) DEFAULT NULL,
  JOB_INSTANCE_ID BIGINT(20) DEFAULT NULL,
  CREATE_TIME TIMESTAMP NULL DEFAULT NULL,
  START_TIME TIMESTAMP NULL DEFAULT NULL,
  END_TIME TIMESTAMP NULL DEFAULT NULL,
  STATUS VARCHAR(10) DEFAULT NULL,
  EXIT_CODE VARCHAR(2500) DEFAULT NULL,
  EXIT_MESSAGE VARCHAR(2500) DEFAULT NULL,
  LAST_UPDATED TIMESTAMP NULL DEFAULT NULL,
  JOB_CONFIGURATION_LOCATION VARCHAR(2500) DEFAULT NULL,
  batch_id INT(11) DEFAULT NULL,
  bean_id INT(11) DEFAULT NULL,
  PRIMARY KEY (JOB_EXECUTION_ID),
  INDEX fk_exec_batch_idx (batch_id),
  INDEX fk_exec_bean_idx (bean_id),
  INDEX JOB_INST_EXEC_FK_idx (JOB_INSTANCE_ID),
  CONSTRAINT fk_exec_batch FOREIGN KEY (batch_id)
    REFERENCES batch(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_exec_bean FOREIGN KEY (bean_id)
    REFERENCES bean(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT JOB_INST_EXEC_FK FOREIGN KEY (JOB_INSTANCE_ID)
    REFERENCES batch_job_instance(JOB_INSTANCE_ID) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table batch_job_execution_context
--
DROP TABLE IF EXISTS batch_job_execution_context;
CREATE TABLE batch_job_execution_context (
  JOB_EXECUTION_ID BIGINT(20) NOT NULL,
  SHORT_CONTEXT VARCHAR(2500) DEFAULT NULL,
  SERIALIZED_CONTEXT VARCHAR(2500) DEFAULT NULL,
  PRIMARY KEY (JOB_EXECUTION_ID),
  CONSTRAINT JOB_EXEC_CTX_FK FOREIGN KEY (JOB_EXECUTION_ID)
    REFERENCES batch_job_execution(JOB_EXECUTION_ID) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table batch_job_execution_params
--
DROP TABLE IF EXISTS batch_job_execution_params;
CREATE TABLE batch_job_execution_params (
  JOB_EXECUTION_ID BIGINT(11) NOT NULL,
  TYPE_CD VARCHAR(45) DEFAULT NULL,
  KEY_NAME VARCHAR(45) DEFAULT NULL,
  STRING_VAL VARCHAR(45) DEFAULT NULL,
  DATE_VAL TIMESTAMP NULL DEFAULT NULL,
  LONG_VAL BIGINT(20) DEFAULT NULL,
  DOUBLE_VAL DOUBLE DEFAULT NULL,
  IDENTIFYING CHAR(1) DEFAULT NULL,
  PRIMARY KEY (JOB_EXECUTION_ID),
  CONSTRAINT JOB_EXEC_PARAMS_FK FOREIGN KEY (JOB_EXECUTION_ID)
    REFERENCES batch_job_execution(JOB_EXECUTION_ID) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table batch_job_instance
--
DROP TABLE IF EXISTS batch_job_instance;
CREATE TABLE batch_job_instance (
  JOB_INSTANCE_ID BIGINT(20) NOT NULL AUTO_INCREMENT,
  VERSION BIGINT(20) DEFAULT NULL,
  JOB_NAME VARCHAR(45) DEFAULT NULL,
  JOB_KEY VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (JOB_INSTANCE_ID)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table batch_step_execution
--
DROP TABLE IF EXISTS batch_step_execution;
CREATE TABLE batch_step_execution (
  STEP_EXECUTION_ID BIGINT(20) NOT NULL AUTO_INCREMENT,
  VERSION BIGINT(20) DEFAULT NULL,
  STEP_NAME VARCHAR(45) DEFAULT NULL,
  JOB_EXECUTION_ID BIGINT(20) DEFAULT NULL,
  START_TIME TIMESTAMP NULL DEFAULT NULL,
  END_TIME TIMESTAMP NULL DEFAULT NULL,
  STATUS VARCHAR(10) DEFAULT NULL,
  COMMIT_COUNT BIGINT(20) DEFAULT NULL,
  READ_COUNT BIGINT(20) DEFAULT NULL,
  FILTER_COUNT BIGINT(20) DEFAULT NULL,
  WRITE_COUNT BIGINT(20) DEFAULT NULL,
  READ_SKIP_COUNT BIGINT(20) DEFAULT NULL,
  WRITE_SKIP_COUNT BIGINT(20) DEFAULT NULL,
  PROCESS_SKIP_COUNT BIGINT(20) DEFAULT NULL,
  ROLLBACK_COUNT BIGINT(20) DEFAULT NULL,
  EXIT_CODE VARCHAR(2500) DEFAULT NULL,
  EXIT_MESSAGE VARCHAR(2500) DEFAULT NULL,
  LAST_UPDATED TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (STEP_EXECUTION_ID),
  INDEX JOB_EXEC_STEP_FK_idx (JOB_EXECUTION_ID),
  CONSTRAINT JOB_EXEC_STEP_FK FOREIGN KEY (JOB_EXECUTION_ID)
    REFERENCES batch_job_execution(JOB_EXECUTION_ID) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table batch_step_execution_context
--
DROP TABLE IF EXISTS batch_step_execution_context;
CREATE TABLE batch_step_execution_context (
  STEP_EXECUTION_ID BIGINT(20) NOT NULL AUTO_INCREMENT,
  SHORT_CONTEXT VARCHAR(2500) DEFAULT NULL,
  SERIALIZED_CONTEXT VARCHAR(2500) DEFAULT NULL,
  PRIMARY KEY (STEP_EXECUTION_ID),
  CONSTRAINT STEP_EXEC_CTX_FK FOREIGN KEY (STEP_EXECUTION_ID)
    REFERENCES batch_step_execution(STEP_EXECUTION_ID) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table bean
--
DROP TABLE IF EXISTS bean;
CREATE TABLE bean (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  class VARCHAR(255) NOT NULL,
  project_id INT(11) NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_bean_project1_idx (project_id),
  CONSTRAINT fk_bean_project1 FOREIGN KEY (project_id)
    REFERENCES project(id) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table chunk
--
DROP TABLE IF EXISTS chunk;
CREATE TABLE chunk (
  id INT(11) NOT NULL AUTO_INCREMENT,
  reader INT(11) NOT NULL,
  writer INT(11) NOT NULL,
  commit_interval INT(11) NOT NULL,
  processor INT(11) NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_chunk_bean1_idx (processor),
  INDEX fk_chunk_bean2_idx (reader),
  INDEX fk_chunk_bean3_idx (writer),
  CONSTRAINT fk_chunk_bean1 FOREIGN KEY (processor)
    REFERENCES bean(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_chunk_bean2 FOREIGN KEY (reader)
    REFERENCES bean(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_chunk_bean3 FOREIGN KEY (writer)
    REFERENCES bean(id) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table job
--
DROP TABLE IF EXISTS job;
CREATE TABLE job (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  bean_id INT(11) NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_job_bean1_idx (bean_id),
  CONSTRAINT fk_job_bean1 FOREIGN KEY (bean_id)
    REFERENCES bean(id) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table listener
--
DROP TABLE IF EXISTS listener;
CREATE TABLE listener (
  id INT(11) NOT NULL AUTO_INCREMENT,
  step_id INT(11) NOT NULL,
  ref INT(11) NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_listener_bean1_idx (ref),
  INDEX fk_listener_step1_idx (step_id),
  CONSTRAINT fk_listener_bean1 FOREIGN KEY (ref)
    REFERENCES bean(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_listener_step1 FOREIGN KEY (step_id)
    REFERENCES step(id) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table project
--
DROP TABLE IF EXISTS project;
CREATE TABLE project (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  description VARCHAR(255) DEFAULT NULL,
  version VARCHAR(45) DEFAULT NULL,
  services_url VARCHAR(255) DEFAULT NULL,
  swagger_url VARCHAR(255) DEFAULT NULL,
  create_time TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 8192
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table property
--
DROP TABLE IF EXISTS property;
CREATE TABLE property (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  value TEXT DEFAULT NULL,
  ref INT(11) DEFAULT NULL,
  bean_id INT(11) DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX fk_property_bean_id_idx (ref),
  INDEX fk_property_bean_id_idx1 (bean_id),
  CONSTRAINT fk_property_bean_id FOREIGN KEY (bean_id)
    REFERENCES bean(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_property_ref FOREIGN KEY (ref)
    REFERENCES bean(id) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Definition for table schedular
--
DROP TABLE IF EXISTS schedular;
CREATE TABLE schedular (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  method VARCHAR(45) NOT NULL,
  cron TINYTEXT NOT NULL,
  bean_id INT(11) DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX fk_schedular_bean1_idx (bean_id),
  CONSTRAINT fk_schedular_bean1 FOREIGN KEY (bean_id)
    REFERENCES bean(id) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table step
--
DROP TABLE IF EXISTS step;
CREATE TABLE step (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) DEFAULT NULL,
  job_id INT(11) NOT NULL,
  tasklet_id INT(11) NOT NULL,
  next_on_success INT(11) DEFAULT NULL,
  next_on_fail INT(11) DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX fk_step_job1_idx (job_id),
  INDEX fk_step_step_fail_idx (next_on_fail),
  INDEX fk_step_step_success_idx (next_on_success),
  INDEX fk_step_tasklet1_idx (tasklet_id),
  CONSTRAINT fk_step_job1 FOREIGN KEY (job_id)
    REFERENCES job(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_step_step_fail FOREIGN KEY (next_on_fail)
    REFERENCES step(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_step_step_success FOREIGN KEY (next_on_success)
    REFERENCES step(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_step_tasklet1 FOREIGN KEY (tasklet_id)
    REFERENCES tasklet(id) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table tasklet
--
DROP TABLE IF EXISTS tasklet;
CREATE TABLE tasklet (
  id INT(11) NOT NULL AUTO_INCREMENT,
  ref INT(11) DEFAULT NULL,
  chunk_id INT(11) DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX fk_tasklet_bean1_idx (ref),
  INDEX fk_tasklet_chunk1_idx (chunk_id),
  CONSTRAINT fk_tasklet_bean1 FOREIGN KEY (ref)
    REFERENCES bean(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_tasklet_chunk1 FOREIGN KEY (chunk_id)
    REFERENCES chunk(id) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;