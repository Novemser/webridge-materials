/* duplicate customer */
INSERT INTO `BLC_CUSTOMER` VALUES (301,0,'2020-08-17 20:15:56','2020-08-17 20:15:56',0,NULL,_binary '\0','1@gmail.com',NULL,'Stephen1',_binary '\0','Wang1','123qwe',_binary '\0',NULL,_binary '\0',_binary '',NULL,'1@gmail.com',NULL,NULL);

INSERT INTO `BLC_CUSTOMER_ROLE` VALUES (301,301,1);

INSERT INTO `BLC_EMAIL_TRACKING` VALUES (301,'2020-08-17 20:15:56','1@gmail.com',NULL);

/* duplicate product */
INSERT INTO `BLC_PRODUCT` VALUES (1002,NULL,NULL,NULL,NULL,_binary '\0','Spice Exchange',NULL,NULL,NULL,_binary '\0','/hot-sauces/day_of_the_dead_chipotle_hot_sauce',NULL,NULL,NULL),
(1003,NULL,NULL,NULL,NULL,_binary '\0','Spice Exchange',NULL,NULL,NULL,_binary '\0','/hot-sauces/day_of_the_dead_habanero_hot_sauce',NULL,NULL,NULL);

INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (1002,_binary '',20.000000,2002,1002),
(1003,_binary '',21.000000,2002,1003);

INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (1002,'heatRange','2',1002),
(1003,'heatRange','4',1003);

INSERT INTO `BLC_SKU` VALUES (1002,NULL,'2020-08-16 20:10:51',NULL,3.00000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Tangy, ripe cayenne peppes flow together with garlic, onion, tomato paste and a hint of cane sugar to make this a smooth sauce with a bite.  Wonderful on eggs, poultry, pork, or fish, this sauce blends to make rich marinades and soups.','Hoppin\' Hot Sauce',NULL,4.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,1002,NULL),
(1003,NULL,'2020-08-16 20:10:51',NULL,4.50000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'When any pepper is dried and smoked, it is referred to as a Chipotle. Usually with a wrinkled, drak brown appearance, the Chipotle delivers a smokey, sweet flavor which is generally used for adding a smokey, roasted flavor to salsas, stews and marinades.','Day of the Dead Chipotle Hot Sauce',NULL,6.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,1003,NULL);

/* update foreign key in BLC_PRODUCT*/
UPDATE `BLC_PRODUCT` SET DEFAULT_SKU_ID = 1002 WHERE PRODUCT_ID = 1002;
UPDATE `BLC_PRODUCT` SET DEFAULT_SKU_ID = 1003 WHERE PRODUCT_ID = 1003;

INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (1002,'heatRange','2',1002),
(1003,'heatRange','4',1003);

INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-1002,'primary',401,1002), (-1003,'primary',501,1003);

