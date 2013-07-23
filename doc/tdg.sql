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
	active int default 1,
	netWeight float,
	grossWeight float,
	sizeWithPackage varchar(45),
	mainImage varchar(200),
	subImages text,
	brandId int,
	basicParams varchar(500),
	hasChildren int,
	sellerId int,
	productTypeId int,
	PRIMARY KEY (id)
);

create table item(
	id int NOT NULL AUTO_INCREMENT,
	sku int,
	name varchar(500),
	nameInChinese varchar(500),
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
	productId int NOT NULL,
	categoryId int NOT NULL,
	sellerId int NOT NULL,
	PRIMARY KEY (id)
);
create table shopsetting(
	id int NOT NULL AUTO_INCREMENT,
	shippingCountry varchar(200),
	shippingPromiseDays int,
	description text,
	descriptionInChinese text,
	defaultCoinage int default 1,
	ischinese int,
	sellerid int NOT NULL,
	PRIMARY KEY (id)
);
create table message(
	id int NOT NULL AUTO_INCREMENT,
	title varchar(45) NOT NULL,
	content text NOT NULL,
	userType varchar(45) NOT NULL,
	userId int NOT NULL,
	createAt Date NOT NULL,
	responseId int,
	finishAt Date,
	PRIMARY KEY (id)
);
create table customerAddress(
	id int NOT NULL AUTO_INCREMENT,
	name varchar(500),
	address varchar(500),
	city varchar(500),
	country varchar(500),
	postCode varchar(500),
	customerId int NOT NULL,
	PRIMARY KEY (id)
);
create table orders(
	id bigint NOT NULL AUTO_INCREMENT,
	productId bigint NOT NULL,
	orderPrice float,
	transferPrice float,
	price float,
	createAt Date,
	comment text,
	name varchar(500),
	address varchar(500),
	city varchar(500),
	country varchar(500),
	postCode varchar(500),
	customerId int NOT NULL,
	sellerId int NOT NULL,
	parentId bigint NOT NULL,
	orderStatus int NOT NULL,
	PRIMARY KEY (id)
);
create table orderItem(
	id int NOT NULL AUTO_INCREMENT,
	skuId int,
	itemId bigint,
	productId bigint,
	name varchar(500),
	coinage int,
	sellerId int,
	num int,
	price float,
	orderId bigint,
	PRIMARY KEY (id)
);