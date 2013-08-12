use tdg;
-- auth tables --
create table customer(
	id int NOT NULL AUTO_INCREMENT,
	email varchar(45) NOT NULL,
	password varchar(255) NOT NULL,
	accountstatus int default 0,
	accessToken varchar(100),
	refreshToken varchar(200),
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
	accountstatus int default 0,
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
  `english` text,
  `isChinese` int default 1,
  PRIMARY KEY (`vid`)
);

CREATE TABLE `itemcat` (
  `cid`  int NOT NULL ,
  `name`  longtext NULL ,
  `parentId`  int NULL ,
  `isParent`  char(255) NULL ,
  `english` text,
  `isChinese` int default 1,
  PRIMARY KEY (`cid`)
);

CREATE TABLE `saleproperty` (
  `cid`  int NOT NULL ,
  `pid`  int NOT NULL ,
  `pname`  longtext NULL ,
  `english` text,
  `isChinese` int default 1,
  `vid`  longtext NULL ,
  `mustproperty`  varchar(255) NULL ,
  PRIMARY KEY (`cid`, `pid`)
);

CREATE TABLE `salepropertyvalue` (
  `vid`  int NOT NULL ,
  `vname`  longtext NULL ,
  `english` text,
  `isChinese` int default 1,
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
	basicParams varchar(500),
	hasChildren int,
	brandId int,
	sellerId int,
	productTypeId int,
	categoryId int,
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
	coinage int,
	categoryId int NOT NULL,
	sellerId int NOT NULL,
	PRIMARY KEY (id)
);
create table shopsetting(
	id int NOT NULL AUTO_INCREMENT,
	shippingCountry varchar(200),
	shippingPromiseDays int,
	title varchar(100),
	titleInChinese varchar(100),
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
create table orderRecord(
	id int NOT NULL AUTO_INCREMENT,
	orderId bigint,
	username varchar(45),
	userId int,
	comment varchar(500),
	commentInEnglish varchar(500),
	createAt date,
	PRIMARY KEY(id)
);
CREATE TABLE `helpservice` (
  `tradeRules` text,
  `shoppingProcess` text,
  `orderStatus` text,
  `FAQ` text,
  `contactCustomService` text,
  `afterSalePolicy` text,
  `cashAfterDelivery` text,
  `priceProtect` text,
  `refundInstruction` text,
  `thirdPartyExpress` text,
  `vipIntroduction` text,
  `isChinese` int(11) DEFAULT '1',
  `payOnline` text,
  `id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `helpservice` VALUES ('<p>\r\n	1.注册账号\r\n</p>\r\n<p>\r\n	2.查找商品\r\n</p>\r\n<p>\r\n	3.放入购物车\r\n</p>\r\n<p>\r\n	4.提交订单\r\n</p>\r\n<p>\r\n	5.查看订单状态\r\n</p>','1. 注册帐号。&lt;br&gt;2. 查找商品。&lt;br&gt;3. 放入购物车。&lt;br&gt;4. 提交订单。&lt;br&gt;5. 查看订单状态',' 1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态','1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态 ','ytetretrter','1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态 ',' 1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态',' 1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态',' 1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态','1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态 ','1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态 ',1,'1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态 ',0);

