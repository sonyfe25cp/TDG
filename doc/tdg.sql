use tdg;
-- auth tables --
create table customer(
	id int NOT NULL AUTO_INCREMENT,
	email varchar(45) NOT NULL,
	password varchar(255) NOT NULL,
	accountstatus int default 0,
	UNIQUE (email),
	PRIMARY KEY (id)
);
create table admin(
	id int NOT NULL AUTO_INCREMENT,
	email varchar(45) NOT NULL,
	password varchar(255) NOT NULL,
	UNIQUE (email),
	PRIMARY KEY (id)
);
create table seller(
	id int NOT NULL AUTO_INCREMENT,
	email varchar(45) NOT NULL,
	password varchar(255) NOT NULL,
	businessName varchar(255),
	firstName varchar(255),
	lastName varchar(255),
	businessAddress varchar(255),
	city varchar(255),
	country varchar(255),
	primaryPhoneNumber varchar(255),
	productLines varchar(255),
	secondPhoneNumber varchar(255),
	companyWebsiteAddress varchar(255),
	createdAt date,
	lastLoginAt date,
	UNIQUE (email),
	PRIMARY KEY (id)
);
create table translator(
	id int NOT NULL AUTO_INCREMENT,
	email varchar(45) NOT NULL,
	password varchar(255) NOT NULL,
	accountstatus int default 0,
	UNIQUE (email),
	PRIMARY KEY (id)
);

CREATE TABLE `itemproperty`(
  `cid`  int NOT NULL ,
  `pid`  int NOT NULL ,
  `pname`  text NULL ,
  `vid`  longtext NULL ,
  `mustproperty`  char(60) NULL ,
  PRIMARY KEY (`cid`, `pid`)
);

CREATE TABLE `itempropertyvalue` (
  `vid`  int NOT NULL ,
  `vname`  text NULL ,
  PRIMARY KEY (`vid`)
);

CREATE TABLE `itemcat` (
  `cid`  int NOT NULL ,
  `name`  longtext NULL ,
  `parentId`  int NULL ,
  `isParent`  char(255) NULL ,
  PRIMARY KEY (`cid`)
);

CREATE TABLE `saleproperty` (
  `cid`  int NOT NULL ,
  `pid`  int NOT NULL ,
  `pname`  longtext NULL ,
  `vid`  longtext NULL ,
  `mustproperty`  varchar(255) NULL ,
  PRIMARY KEY (`cid`, `pid`)
);

CREATE TABLE `salepropertyvalue` (
  `vid`  int NOT NULL ,
  `vname`  longtext NULL ,
  PRIMARY KEY (`vid`)
);

create table brand(
	id int NOT NULL AUTO_INCREMENT,
	name varchar(45) NOT NULL,
	description text NOT NULL,
	nameinchinese varchar(45),
	descriptioninchinese text,
	ischinese int default 0,
	sellerId int NOT NULL,
	PRIMARY KEY (id)
);

create table product(
	id int NOT NULL AUTO_INCREMENT,
	name varchar(45),
	description text,
	nameinchinese varchar(45),
	descriptioninchinese text,
	ischinese int default 0,
	retailPrice float,
	promotionPrice float,
	promotionTime date,
	wholePrice float,
	minimumQuantity int,
	maximumAcceptQuantity int,
	availableQuantity int,
	safeStock int,
	active int,
	netWeight float,
	grossWeight float,
	sizeWithPackage varchar(45),
	mainImage varchar(200),
	subImages text,
	brandId int,
	sellerId int,
	productTypeId int,
	PRIMARY KEY (id)
);

create table item(
	id int NOT NULL AUTO_INCREMENT,
	sku int,
	featureJson varchar(500),
	image varchar(200),
	retailPrice float,
	promotionPrice float,
	promotionTime date,
	wholePrice float,
	minimumQuantity int,
	maximumAcceptQuantity int,
	availableQuantity int,
	safeStock int,
	productid int NOT NULL,
	sellerid int NOT NULL,
	PRIMARY KEY (id)
);
create table shopsetting(
	id int NOT NULL AUTO_INCREMENT,
	shippingCountry varchar(200),
	shippingPromiseDays int,
	description text,
	descriptionInChinese text,
	defaultCoinage int,
	ischinese int,
	sellerid int NOT NULL,
	PRIMARY KEY (id)
);