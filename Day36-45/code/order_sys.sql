-- Transaction table
CREATE TABLE `transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'transaction number',
  `member_id` bigint(20) NOT NULL COMMENT 'user id for the transaction',
  `amount` decimal(8,2) NOT NULL COMMENT 'transaction amount',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT 'used points',
  `pay_state` tinyint(4) NOT NULL COMMENT 'payment type: 0 balance, 1 WeChat, 2 Alipay, 3 xxx',
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'payment source: wx app web wap',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'payment status: -1 canceled, 0 incomplete, 1 completed, -2 exception',
  `completion_time` int(11) NOT NULL COMMENT 'transaction completion time',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'note',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_order_sn_member_id_pay_state_source_status_index` (`order_sn`(191),`member_id`,`pay_state`,`source`(191),`status`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Transaction record table
CREATE TABLE `transaction_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `events` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'event details',
  `result` text COLLATE utf8mb4_unicode_ci COMMENT 'result details',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Order table
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'order number',
  `order_sn` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'transaction number',
  `member_id` int(11) NOT NULL COMMENT 'customer id',
  `supplier_id` int(11) NOT NULL COMMENT 'merchant id',
  `supplier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'merchant name',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'order status: 0 unpaid, 1 paid, 2 shipped, 3 delivered, -1 return requested, -2 returning, -3 returned, -4 canceled',
  `after_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'after-sales status: 0 none, 1 requested, -1 canceled, 2 in progress, 200 finished',
  `product_count` int(11) NOT NULL DEFAULT '0' COMMENT 'product quantity',
  `product_amount_total` decimal(12,4) NOT NULL COMMENT 'total product price',
  `order_amount_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'actual payment amount',
  `logistics_fee` decimal(12,4) NOT NULL COMMENT 'shipping fee',
  `address_id` int(11) NOT NULL COMMENT 'shipping address id',
  `pay_channel` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'payment channel: 0 balance, 1 WeChat, 2 Alipay',
  `out_trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'payment order number',
  `escrow_trade_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'third-party payment flow number',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT 'payment time',
  `delivery_time` int(11) NOT NULL DEFAULT '0' COMMENT 'shipment time',
  `order_settlement_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'settlement status: 0 unsettled, 1 settled',
  `order_settlement_time` int(11) NOT NULL DEFAULT '0' COMMENT 'settlement time',
  `is_package` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'whether this is a package product',
  `is_integral` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'whether this is a points product',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_order_sn_unique` (`order_sn`),
  KEY `order_order_sn_member_id_order_status_out_trade_no_index` (`order_sn`,`member_id`,`order_status`,`out_trade_no`(191))
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- After-sales application table
CREATE TABLE `order_returns_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'order number',
  `order_detail_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'sub-order id',
  `return_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'after-sales number',
  `member_id` int(11) NOT NULL COMMENT 'user id',
  `state` tinyint(4) NOT NULL COMMENT 'type: 0 refund only, 1 return and refund',
  `product_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'product status: 0 received, 1 not received',
  `why` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'reason for return or exchange',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'review status: -1 rejected, 0 pending, 1 approved',
  `audit_time` int(11) NOT NULL DEFAULT '0' COMMENT 'review time',
  `audit_why` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'review reason',
  `note` text COLLATE utf8mb4_unicode_ci COMMENT 'note',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- After-sales record table
CREATE TABLE `order_returns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `returns_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'return number for customer lookup',
  `order_id` int(11) NOT NULL COMMENT 'order id',
  `express_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'tracking number',
  `consignee_realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'consignee name',
  `consignee_telphone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'contact phone number',
  `consignee_telphone2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'backup contact phone number',
  `consignee_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'shipping address',
  `consignee_zip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'postal code',
  `logistics_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'logistics type',
  `logistics_fee` decimal(12,2) NOT NULL COMMENT 'shipping logistics fee',
  `order_logistics_status` int(11) DEFAULT NULL COMMENT 'logistics status',
  `logistics_settlement_status` int(11) DEFAULT NULL COMMENT 'logistics settlement status',
  `logistics_result_last` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'last logistics status description',
  `logistics_result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'logistics description',
  `logistics_create_time` int(11) DEFAULT NULL COMMENT 'shipment time',
  `logistics_update_time` int(11) DEFAULT NULL COMMENT 'logistics update time',
  `logistics_settlement_time` int(11) DEFAULT NULL COMMENT 'logistics settlement time',
  `returns_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 full return, 1 partial return',
  `handling_way` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'PUPAWAY return to warehouse; REDELIVERY reship; RECLAIM-REDELIVERY no return required and reship; REFUND refund; COMPENSATION no return and compensation',
  `returns_amount` decimal(8,2) NOT NULL COMMENT 'refund amount',
  `return_submit_time` int(11) NOT NULL COMMENT 'return request time',
  `handling_time` int(11) NOT NULL COMMENT 'return handling time',
  `remark` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'reason for return',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Review table
CREATE TABLE `order_appraise` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT 'order id',
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'review content',
  `level` enum('-1','0','1') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'rating level: -1 negative, 0 neutral, 1 positive',
  `desc_star` tinyint(4) NOT NULL COMMENT 'description match score 1-5',
  `logistics_star` tinyint(4) NOT NULL COMMENT 'logistics service score 1-5',
  `attitude_star` tinyint(4) NOT NULL COMMENT 'service attitude score 1-5',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_appraise_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
