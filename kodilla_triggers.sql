USE MS;

CREATE TABLE BOOKS_AUD(
  event_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  event_date DATETIME NOT NULL,
  event_type VARCHAR(30) DEFAULT NULL,
  new_book_id INT,
  old_book_id INT

);


DELIMITER #
CREATE TRIGGER books_audit_insert AFTER INSERT ON BOOKS
  FOR EACH ROW
  BEGIN
    INSERT INTO BOOKS_AUD(event_date, event_type, new_book_id, old_book_id) VALUES (sysdate(),'insert',NEW.book_id,null);
  END #
DELIMITER ;

DELIMITER #
CREATE TRIGGER books_audit_update AFTER UPDATE ON BOOKS
  FOR EACH ROW
  BEGIN
    INSERT INTO BOOKS_AUD(event_date, event_type, new_book_id, old_book_id) VALUES (sysdate(),'update',NEW.book_id,OLD.BOOK_ID);
  END #
DELIMITER ;


DELIMITER #
CREATE TRIGGER books_audit_delete AFTER DELETE ON BOOKS
  FOR EACH ROW
  BEGIN
    INSERT INTO BOOKS_AUD(event_date, event_type, new_book_id, old_book_id) VALUES (sysdate(),'delete',NULL ,OLD.BOOK_ID);
  END #
DELIMITER ;


CREATE TABLE READERS_AUD(
  event_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  event_date DATETIME NOT NULL,
  event_type VARCHAR(30) DEFAULT NULL,
  new_reader_id INT,
  old_reader_id INT

);

DELIMITER #
CREATE TRIGGER readers_audit_insert AFTER INSERT ON readers
  FOR EACH ROW
  BEGIN
    INSERT INTO READERS_AUD(event_date, event_type, new_reader_id) VALUES (sysdate(),'insert',NEW.READER_ID);
  END #
DELIMITER ;

DELIMITER #
CREATE TRIGGER readers_audit_update AFTER UPDATE ON readers
  FOR EACH ROW
  BEGIN
    INSERT INTO BOOKS_AUD(event_date, event_type,  new_reader_id,old_reader_id) VALUES (sysdate(),'update',NEW.READER_ID,OLD.READER_ID);
  END #
DELIMITER ;


DELIMITER #
CREATE TRIGGER readers_audit_delete AFTER DELETE ON readers
  FOR EACH ROW
  BEGIN
    INSERT INTO BOOKS_AUD(event_date, event_type,old_reader_id) VALUES (sysdate(),'delete',OLD.READER_ID);
  END #
DELIMITER ;