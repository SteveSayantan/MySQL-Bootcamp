-- @block
CREATE TABLE sailor (
    sid VARCHAR(4) PRIMARY KEY CONSTRAINT start_with_s CHECK ( sid LIKE 's%'),
    sname VARCHAR(15) CONSTRAINT start_with_capital_letter CHECK ( ASCII(sname)>=65 AND ASCII(sname)<=90),
    mname VARCHAR(15),
    surname VARCHAR(15) NOT NULL,
    rating DECIMAL(2) DEFAULT 0,
    age DECIMAL(3,1) NOT NULL
);


-- @block
CREATE TABLE boat (
    bid DECIMAL(3) PRIMARY KEY ,
    bname VARCHAR(20) ,
    color VARCHAR(6) CHECK (color IN ('red','green','blue'))
);

-- @block
CREATE TABLE reserve (
    sid VARCHAR(4) REFERENCES sailor(sid) ,
    bid DECIMAL(3) REFERENCES boat(bid),
    day DATE CHECK (day < '2000-01-01'),
    PRIMARY KEY (sid,bid)
);

-- @block
-- Inserting values in sailor

INSERT INTO sailor VALUES (
    's22',
    'Fredrico',NULL, 'Roberts',7,45
);
INSERT INTO sailor VALUES (
    's31',
    'Lubber',NULL, 'Sheen',8,55.5
);
INSERT INTO sailor VALUES (
    's32',
    'Charlotte',NULL, 'Gordin',8,25.5
);
INSERT INTO sailor VALUES (
    's58',
    'Mary','Beth', 'Lyon',10,35
);
INSERT INTO sailor VALUES (
    's64',
    'Horatio',NULL, 'Powell',7,35.4
);
INSERT INTO sailor VALUES (
    's71',
    'Zorba',NULL, 'Alex',10,16
);
INSERT INTO sailor VALUES (
    's29',
    'Brutus',NULL, 'Slater',1,33.8
);
INSERT INTO sailor VALUES (
    's95',
    'Deep','Graceb', 'Davis',3,63.5
);
INSERT INTO sailor VALUES (
    's74',
    'Horatio',NULL, 'Forrest',9,35
);
INSERT INTO sailor VALUES (
    's85',
    'Sara','Art', 'Powell',3,25.5
);
INSERT INTO sailor VALUES (
    's80',
    'Deep','Kumar', 'Kumar',6,17
);
INSERT INTO sailor VALUES (
    's87',
    'Deep','Kumar', 'Jha',8,51
);


-- @block
-- Inserting values in boat

INSERT INTO boat VALUES(
    101, 'Interlake','blue'
);
INSERT INTO boat VALUES(
    102, 'Interlake','red'
);
INSERT INTO boat VALUES(
    103, 'Clipper','green'
);
INSERT INTO boat VALUES(
    104, 'Marine','red'
);


-- @block
-- Inserting values in reserve

INSERT INTO reserve VALUES (
    's22',101,'98-10-10'
);
INSERT INTO reserve VALUES (
    's22',103,'98-08-10'
);
INSERT INTO reserve VALUES (
    's22',102,'98-10-10'
);
INSERT INTO reserve VALUES (
    's22',104,'98-07-10'
);
INSERT INTO reserve VALUES (
    's31',102,'98-10-11'
);

INSERT INTO reserve VALUES (
    's31',104,'98-12-11'
);
INSERT INTO reserve VALUES (
    's64',101,'98-05-09'
);
INSERT INTO reserve VALUES (
    's64',102,'98-8-09'
);
INSERT INTO reserve VALUES (
    's74',103,'98-08-09'
);
INSERT INTO reserve VALUES (
    's80',102,'98-7-7'
);
INSERT INTO reserve VALUES (
    's87',101,'98-7-8'
);
INSERT INTO reserve VALUES (
    's87',102,'98-12-12'
);



-- @block
-- names of sailors who have reserved boat 104
SELECT sname FROM sailor INNER JOIN reserve ON sailor.sid=reserve.sid WHERE bid=104 ;

-- @block
-- sid of sailors who have reserved red boat
SELECT sid FROM boat INNER JOIN reserve ON boat.bid=reserve.bid WHERE color='red' ;

-- @block
-- color of boats reserved by Lubber
SELECT color FROM sailor,reserve,boat WHERE sailor.sid= reserve.sid AND reserve.bid=boat.bid AND sname='Lubber';

-- @block
-- sailor name that has reserved at least one boat
SELECT sname FROM sailor INNER JOIN reserve ON sailor.sid = reserve.sid ;

-- @block
-- sailors who have reserved a red boat or a green boat
SELECT sname FROM sailor,reserve,boat WHERE sailor.sid= reserve.sid AND reserve.bid=boat.bid AND color IN ('red','green');

-- @block
-- sailors who have reserved a red boat but not a green boat
SELECT sname FROM sailor,reserve,boat WHERE sailor.sid= reserve.sid AND reserve.bid=boat.bid AND color = 'red'
EXCEPT
SELECT sname FROM sailor,reserve,boat WHERE sailor.sid= reserve.sid AND reserve.bid=boat.bid AND color = 'green';

-- @block
-- sailors who have not reserved a red boat
SELECT sname,surname FROM sailor,reserve,boat WHERE sailor.sid= reserve.sid AND reserve.bid=boat.bid
EXCEPT
SELECT sname,surname FROM sailor,reserve,boat WHERE sailor.sid= reserve.sid AND reserve.bid=boat.bid AND color = 'red';



