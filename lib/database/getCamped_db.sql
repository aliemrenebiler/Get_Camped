CREATE TABLE users(
	ssn	varchar(11) not null,
	uname	varchar(15) not null,
	lname	varchar(15),
	phone	varchar(12),
	hesCode	varchar(10),
	isAdmin	int,
	primary key (ssn)
);

CREATE TABLE camping(
	cId	int not null,
	cname	varchar(15) not null,
	city	varchar(15),
	dailyPrice	int,
	tent	bool,
	capacity int,
	primary key (cid)
);

CREATE TABLE reservation(
	rId	int not null,
	ussn	varchar(11) not null,
	campingId	int not null,
	startDate	date,
	dayAmount	int,
	tent	bool,
	totalCost	int,
	pcount int,
	primary key (rid),
	foreign key (ussn) references users(ssn),
	foreign key (campingId) references camping(cId)
);

CREATE TABLE relation(
	ussn varchar(11),
	rssn varchar(11),
	rsvId int,
	foreign key (ussn) references users(ssn),
	foreign key (rssn) references users(ssn),
	foreign key (rsvId) references reservation(rId)
);

INSERT INTO users VALUES ('1','admin','admin','0000','0000',1);

--------------------------

--Silinen kullanıcıyı relation ve reservation tablosundan da silme
CREATE FUNCTION trig_fonk_deleteUser()
RETURNS TRIGGER AS $$
BEGIN
	DELETE FROM relation
	WHERE ussn = old.ussn AND rssn=old.ussn;
	DELETE FROM reservation
	WHERE ussn =old.ussn;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER trig_deleteUser
AFTER DELETE
ON users
FOR EACH ROW EXECUTE PROCEDURE trig_fonk_deleteUser();
-----------------------------
--Kamp yerlerinin id leri için sequence
CREATE SEQUENCE seqCmp
MINVALUE 0
MAXVALUE 99
INCREMENT BY 1;

------------------------------
--Silinen kamp yerini reservation tablosundan da silme
CREATE FUNCTION trig_fonk_deleteCamping()
RETURNS TRIGGER AS $$
BEGIN
	DELETE FROM reservation
	WHERE campingId =old.cId;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER trig_deleteCamping
AFTER DELETE
ON camping
FOR EACH ROW EXECUTE PROCEDURE trig_fonk_deleteCamping();

--------------------------------
--Rezervasyonların id leri için sequence
CREATE SEQUENCE seqRsv
MINVALUE 0
MAXVALUE 99
INCREMENT BY 1;

-----------------------------------
--Girilen kamp yeri ismine göre kamp yeri bilgilerini dönderen fonksiyon
CREATE TYPE camp_info AS (cname VARCHAR(15),city VARCHAR(15),
						 dPrice int, tent bool);
CREATE or REPLACE FUNCTION search_camp(campName VARCHAR(15))
RETURNS camp_info AS $$
DECLARE
	inf camp_info;
BEGIN
	SELECT cname, city,dailyPrice,tent INTO inf
	FROM camping
	WHERE cname=campName;
	RETURN inf;
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------
--Rezervasyon yapılacak kamp yerinin kapasitesi dolu mu kontrolü
CREATE FUNCTION trig_fonk_insertReserv()
RETURNS TRIGGER AS $$
DECLARE
	sayi int;
BEGIN
	SELECT count(*) INTO sayi
	FROM reservation
	WHERE campingId=new.campingId AND startDate=new.startDate;
	IF(sayi+new.pcount<(SELECT capacity FROM camping WHERE cId=new.campingId)) THEN
		RAISE INFO 'The reservation is done.';
		RETURN new;
	ELSE
		RAISE EXCEPTION 'The capacity of the camping is full.';
		RETURN old;
	END IF;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER trig_insertReserv
BEFORE INSERT
ON reservation
FOR EACH ROW EXECUTE PROCEDURE trig_fonk_insertReserv();