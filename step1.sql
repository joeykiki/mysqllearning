CREATE database database3;

-- 建表department，主码为dept_name
CREATE TABLE `department` (
  `dept_name` varchar(45) NOT NULL,
  `building` varchar(45) DEFAULT NULL,
  `budget` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 建表student，主码为ID，外码为dept_name，参照department表中的dept_name
CREATE TABLE `students` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `age` int(10) unsigned DEFAULT NULL,
  `emotion_state` varchar(45) DEFAULT NULL,
  `dept_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name_idx` (`dept_name`),
  CONSTRAINT `dept_name`
  FOREIGN KEY (`dept_name`) 
  REFERENCES `department` (`dept_name`) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 建表exam，主码为student_ID和exam，外码为student_ID，参考student表中的ID    
CREATE TABLE `exam` (
  `student_ID` int(11) NOT NULL,
  `exam` varchar(45) NOT NULL,
  `grade` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`student_ID`,`exam`),
  CONSTRAINT `student_ID` 
  FOREIGN KEY (`student_ID`)
  REFERENCES `students` (`ID`) 
  ON DELETE NO ACTION 
  ON UPDATE CASCADE
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8