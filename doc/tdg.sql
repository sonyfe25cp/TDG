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
	state varchar(255),
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

CREATE TABLE `ProductLine`(
	id int NOT NULL AUTO_INCREMENT,
	name varchar(45) NOT NULL,
	english varchar(45),
	parentId int NOT NULL,
	level int NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `ProductParameter`(
	id int NOT NULL AUTO_INCREMENT,
	name varchar(45) NOT NULL,
	english varchar(45),
	pvalue varchar(45),
	parentId int NOT NULL,
	level int NOT NULL,
  PRIMARY KEY (`id`)
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
	nameinchinese varchar(45),
	description text,
	descriptioninchinese text,
	status int default 1,
	internationalShippingService int default 0, 
	internationalShippingFee float default 0,
	internationalPromiseDays int default 7,
	coinage int,
	retailPrice float,
	promotionPrice float,
	promotionTime date,
	promotionEnd date,
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
	hasChildren int,
	brandId int,
	sellerId int,
	productTypeId int,
	categoryId int,
	PRIMARY KEY (id)
);

create table item(
	id int NOT NULL AUTO_INCREMENT,
	sku varchar(100),
	name varchar(500),
	nameInChinese varchar(500),
	featureJson varchar(500),
	image varchar(200),
	retailPrice float,
	promotionPrice float,
	promotionTime date,
	promotionEnd date,
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
	shippingCountry int,
	shippingPromiseDays int,
	title varchar(100),
	titleInChinese varchar(100),
	description text,
	descriptionInChinese text,
	bankName varchar(100),
	swiftCode varchar(100),
	bankCity varchar(100),
	bankAddress varchar(300),
	accountName varchar(100),
	accountNumber varchar(300),
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
	sendAt Date,
	carrier varchar(200),
	trackingWeb varchar(200),
	trackingId varchar(200),
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

create table notice(
	id int NOT NULL AUTO_INCREMENT,
	content text,
	userType varchar(255) NOT NULL,
	PRIMARY KEY (id)
);
create table passwordkey(
	id int NOT NULL AUTO_INCREMENT,
	userType varchar(45) NOT NULL,
	email varchar(45) NOT NULL,
	secret varchar(255) NOT NULL,
	PRIMARY KEY (id)
);
create table translationTask(
	id int NOT NULL AUTO_INCREMENT,
	taskId int NOT NULL,
	sellerId int NOT NULL,
	translatorId int NOT NULL,
	taskType varchar(45) NOT NULL,
	status int,
	createdAt Date NOT NULL,
	PRIMARY KEY (id)
);
create table country(
	id int NOT NULL AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	nameInChinese varchar(255) NOT NULL,
	PRIMARY KEY (id)
);
	private int previousStatus; //被投诉的对象之前的状态
	private String comment; //投诉的补充说明
create table claimItem(
	id int NOT NULL AUTO_INCREMENT,
	claimType varchar(45) NOT NULL,
	claimTypeId int,
	sellerId int,
	claimItemId int,
	customerId int,
	status int,
	previousStatus int,
	comment varchar(500),
	PRIMARY KEY (id)
);

create table cart(
	id int NOT NULL AUTO_INCREMENT,
	itemId int,
	customerId int,
	number int,
	PRIMARY KEY (id)
);

create table financeUnit(
	id int NOT NULL AUTO_INCREMENT,
	receiver varchar(100),
	sender varchar(100),
	money float,
	createAt datetime,
	financeType int,
	relatedId int,
	status int default 0,
	comment varchar(500),
	over int default 0,
	PRIMARY KEY (id)
);
create table financeRecord(
	id int NOT NULL AUTO_INCREMENT,
	sellerId int,
	unitIds varchar(500),
	createAt date,
	status int,
	orderMoney float,
	translationMoney float,
	storeMoney float,
	serviceMoney float,
	otherMoney float,
	totalGetFromAdmin float,
	totalPayAdmin float,
	total float,
	PRIMARY KEY(id)
);

alter table orders add column returnDate datetime;
alter table orders add column returnFlag int default 0;
alter table translationTask change column createdAt createdAt datetime;

create table systemSetting(
	id int NOT NULL AUTO_INCREMENT,
	storeAddress varchar(200),
	PRIMARY KEY(id)
);

alter table orders add column customerObserveFlag int default 0;
alter table orders add column sellerObserveFlag int default 0;
alter table orders add column paidAt datetime ;
alter table orders add column overAt datetime ;
