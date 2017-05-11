CREATE database database3;

-- 建表department，主码为dept_name
CREATE TABLE `database3`.`department` (
  `dept_name` VARCHAR(45) NOT NULL,
  `building` VARCHAR(45),
  `budget` INT UNSIGNED NULL,
   PRIMARY KEY (`dept_name`)
   )ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 建表student，主码为ID，外码为dept_name，参照department表中的dept_name
CREATE TABLE `database3`.`student` (
  `ID` INT NOT NULL,
  `name` VARCHAR(45),
  `sex` VARCHAR(1),
  `age` INT(10) UNSIGNED NULL,
  `dept_name` VARCHAR(45),
  PRIMARY KEY (`ID`),
    FOREIGN KEY (`dept_name`)
    REFERENCES `database2`.`department` (`dept_name`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 建表exam，主码为student_ID和exam，外码为student_ID，参考student表中的ID    
CREATE TABLE `database3`.`exam` (
  `student_ID` INT NOT NULL,
  `exam` VARCHAR(45) NOT NULL,
  `grade` INT UNSIGNED NULL,
  PRIMARY KEY (`student_ID`, `exam`),
  CONSTRAINT `student_ID`
    FOREIGN KEY (`student_ID`)
    REFERENCES `database2`.`students` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);