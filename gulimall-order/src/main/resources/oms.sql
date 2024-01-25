CREATE TABLE `osm_order`
(
    `id`                      bigint         not null auto_increment comment 'id',
    `create_user_id`          bigint         not null COMMENT '创建者id',
    `create_time`             timestamp      NOT NULL COMMENT '创建时间',
    `modify_user_id`          bigint         not null COMMENT '更新者id',
    `modify_time`             timestamp      NOT NULL COMMENT '更新时间',
    `sn`                      bigint         not NULL COMMENT '订单号',
    `user_id`                 bigint         not NULL COMMENT 'user_id',
    `user_name`               varchar(32)    not NULL COMMENT '用户名',
    `coupon_id`               bigint                  default NULL COMMENT '使用的优惠券',
    `total_amount`            decimal(18, 4) not NULL default 0 COMMENT '订单总额',
    `pay_amount`              decimal(18, 4) not NULL default 0 COMMENT '应付总额',
    `freight_amount`          decimal(18, 4) not NULL default 0 COMMENT '运费金额',
    `promotion_amount`        decimal(18, 4) not NULL default 0 COMMENT '促销优化金额（促销价、满减、阶梯价）',
    `integration_amount`      decimal(18, 4) not NULL default 0 COMMENT '积分抵扣金额',
    `coupon_amount`           decimal(18, 4) not NULL default 0 COMMENT '优惠券抵扣金额',
    `discount_amount`         decimal(18, 4) not NULL default 0 COMMENT '后台调整订单使用的折扣金额',
    `pay_type`                tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '支付方式：0：未支付，1：货到付款，1：支付宝，2：微信，3：银联',
    `source_type`             tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '下单方式：0：PC订单，1：app订单',
    `status`                  tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '订单状态：0：待付款，1：待发货，2：已发货，3：已完成，4：已关闭，5：无效订单',
    `delivery_company`        varchar(32)             DEFAULT NULL COMMENT '物流公司(配送方式)',
    `delivery_sn`             bigint                  DEFAULT NULL COMMENT '物流单号',
    `auto_confirm_day`        int            NOT NULL DEFAULT 14 COMMENT '自动确认时间（天）',
    `integration`             varchar(16)    NOT NULL DEFAULT 0 COMMENT '可以获得的积分',
    `growth`                  int            NOT NULL DEFAULT 0 COMMENT '可以获得的成长值',
    `bill_type`               tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '发票类型：0：未开发票，1：电子发票，2：纸质发票',
    `bill_header`             varchar(64)             DEFAULT NULL COMMENT '发票抬头',
    `bill_content`            varchar(4096)           DEFAULT NULL COMMENT '发票内容',
    `bill_receiver_phone`     varchar(13)             DEFAULT NULL COMMENT '收票人电话',
    `bill_receiver_email`     varchar(64)             DEFAULT NULL COMMENT '收票人邮箱',
    `receiver_name`           varchar(32)    NOT NULL COMMENT '收货人姓名',
    `receiver_phone`          varchar(13)    NOT NULL COMMENT '收货人电话',
    `receiver_post_code`      varchar(16)    NOT NULL COMMENT '收货人邮编',
    `receiver_province`       varchar(8)     NOT NULL COMMENT '省份/直辖市',
    `receiver_city`           varchar(16)    NOT NULL COMMENT '城市',
    `receiver_region`         varchar(16)    NOT NULL COMMENT '区',
    `receiver_detail_address` varchar(128)   NOT NULL COMMENT '详细地址',
    `note`                    varchar(64)             DEFAULT NULL COMMENT '订单备注',
    `is_confirm`              tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '确认收货状态：0：未确认，1：已确认',
    `use_integration`         varchar(16)    NOT NULL DEFAULT 0 COMMENT '下单时使用的积分',
    `payment_time`            timestamp               DEFAULT NULL COMMENT '支付时间',
    `delivery_time`           timestamp               DEFAULT NULL COMMENT '发货时间',
    `receive_time`            timestamp               DEFAULT NULL COMMENT '确认收货时间',
    `comment_time`            timestamp               DEFAULT NULL COMMENT '评价时间',
    `modify_time`             timestamp               DEFAULT NULL COMMENT '修改时间',
    `is_delete`               tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单';


CREATE TABLE `osm_order_item`
(
    `id`                 bigint         not null auto_increment comment 'id',
    `create_user_id`     bigint         not null COMMENT '创建者id',
    `create_time`        timestamp      NOT NULL COMMENT '创建时间',
    `modify_user_id`     bigint         not null COMMENT '更新者id',
    `modify_time`        timestamp      NOT NULL COMMENT '更新时间',
    `order_id`           bigint         not null COMMENT 'order_id',
    `order_sn`           bigint         not null COMMENT 'order_sn',
    `spu_id`             bigint         not null COMMENT 'spu_id',
    `spu_name`           varchar(32)    not NULL COMMENT 'spu_name',
    `spu_pic`            varchar(32)    not NULL COMMENT 'spu_pic',
    `spu_brand`          varchar(32)    not NULL COMMENT '品牌',
    `category_id`        bigint                  DEFAULT NULL COMMENT '商品分类id',
    `sku_id`             bigint                  DEFAULT NULL COMMENT '商品sku编号',
    `sku_name`           varchar(32)    not NULL COMMENT '商品sku名字',
    `sku_pic`            varchar(32)    not NULL COMMENT '商品sku图片',
    `sku_price`          decimal(18, 4) not NULL DEFAULT 0 COMMENT '商品sku价格',
    `sku_quantity`       int            not NULL DEFAULT 1 COMMENT '商品购买的数量',
    `sku_attrs_vals`     varchar(256)            DEFAULT NULL COMMENT '商品销售属性组合（JSON）',
    `promotion_amount`   decimal(18, 4) not NULL DEFAULT 0 COMMENT '商品促销分解金额',
    `coupon_amount`      decimal(18, 4) not NULL DEFAULT 0 COMMENT '优惠券优惠分解金额',
    `integration_amount` decimal(18, 4) not NULL DEFAULT 0 COMMENT '积分优惠分解金额',
    `real_amount`        decimal(18, 4) not NULL DEFAULT 0 COMMENT '该商品经过优惠后的分解金额',
    `gift_integration`   varchar(16)    not NULL DEFAULT 0 COMMENT '赠送积分',
    `gift_growth`        varchar(16)    not NULL DEFAULT 0 COMMENT '赠送成长值',
    `is_delete`          tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单项信息';


CREATE TABLE `osm_order_operate_history`
(
    `id`             bigint    not null auto_increment comment 'id',
    `create_user_id` bigint    not null COMMENT '创建者id',
    `create_time`    timestamp NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint    not null COMMENT '更新者id',
    `modify_time`    timestamp NOT NULL COMMENT '更新时间',
    `order_id`       bigint    not NULL COMMENT '订单id',
    `order_status`   tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '订单状态：0：待付款，1：待发货，2：已发货，3：已完成，4：已关闭，5：无效订单',
    `note`           varchar(500) DEFAULT NULL COMMENT '备注',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单操作历史记录';
--     `operate_man`    tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '操作人：0：用户，1：系统，2：后台管理员', 后续枚举相应的管理员和系统账号


CREATE TABLE `osm_order_return_apply`
(
    `id`              bigint         not null auto_increment comment 'id',
    `create_user_id`  bigint         not null COMMENT '创建者id',
    `create_time`     timestamp      NOT NULL COMMENT '创建时间',
    `modify_user_id`  bigint         not null COMMENT '更新者id',
    `modify_time`     timestamp      NOT NULL COMMENT '更新时间',
    `order_id`        bigint                  DEFAULT NULL COMMENT 'order_id',
    `sku_id`          bigint                  DEFAULT NULL COMMENT '退货商品id',
    `order_sn`        INT            not null COMMENT '订单编号',
    `user_username`   varchar(32)    not NULL COMMENT '会员用户名',
    `return_amount`   decimal(18, 4) not NULL default 0 COMMENT '退款金额',
    `return_name`     varchar(32)    not NULL COMMENT '退货人姓名',
    `return_phone`    varchar(13)    not NULL COMMENT '退货人电话',
    `status`          tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '申请状态：0：待处理，1：退货中，2：已完成，3：已拒绝',
    `handle_time`     timestamp               DEFAULT NULL COMMENT '处理时间',
    `sku_img`         varchar(32)    not NULL COMMENT '商品图片',
    `sku_name`        varchar(32)    not NULL COMMENT '商品名称',
    `sku_brand`       varchar(32)    not NULL COMMENT '商品品牌',
    `sku_attrs_vals`  varchar(512)   not NULL COMMENT '商品销售属性(JSON)',
    `sku_count`       int            not NULL default 0 COMMENT '退货数量',
    `sku_price`       decimal(18, 4) not NULL default 0 COMMENT '商品单价',
    `sku_real_price`  decimal(18, 4) not NULL default 0 COMMENT '商品实际支付单价',
    `reason`          varchar(16)    not NULL COMMENT '原因',
    `description述`   varchar(1024)  not NULL COMMENT '描述',
    `desc_pics`       varchar(2048)  not NULL COMMENT '凭证图片，以逗号隔开',
    `handle_note`     varchar(256)            DEFAULT NULL COMMENT '处理备注',
    `handle_man_id`   bigint                  DEFAULT NULL COMMENT '处理人员',
    `receive_man`     varchar(32)    not NULL COMMENT '收货人',
    `receive_time`    timestamp               DEFAULT NULL COMMENT '收货时间',
    `receive_note`    varchar(256)   not NULL COMMENT '收货备注',
    `receive_phone`   varchar(13)    not NULL COMMENT '收货电话',
    `receive_address` varchar(64)    not NULL COMMENT '收货地址',
    `is_delete`       tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单退货申请';


CREATE TABLE `osm_order_setting`
(
    `id`                    bigint    not null auto_increment comment 'id',
    `create_user_id`        bigint    not null COMMENT '创建者id',
    `create_time`           timestamp NOT NULL COMMENT '创建时间',
    `modify_user_id`        bigint    not null COMMENT '更新者id',
    `modify_time`           timestamp NOT NULL COMMENT '更新时间',
    `flash_order_overtime`  int       not null default 30 COMMENT '秒杀订单超时关闭时间(分)',
    `normal_order_overtime` int       not null default 1440 COMMENT '正常订单超时时间(分)',
    `confirm_overtime`      int       not null default 30 COMMENT '发货后自动确认收货时间（天）',
    `finish_overtime`       int       not null default 14 COMMENT '自动完成交易时间，不能申请退货（天）',
    `comment_overtime`      int       not null default 45 COMMENT '订单完成后自动好评时间（天）',
    `user_level`            tinyint(1) not null default 0 COMMENT '会员等级：0：不限会员等级，12345：对应的其他会员等级',
    `is_delete`             tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单配置信息';



CREATE TABLE `osm_payment_info`
(
    `id`               bigint    not null auto_increment comment 'id',
    `create_user_id`   bigint    not null COMMENT '创建者id',
    `create_time`      timestamp NOT NULL COMMENT '创建时间',
    `modify_user_id`   bigint    not null COMMENT '更新者id',
    `modify_time`      timestamp NOT NULL COMMENT '更新时间',
    `order_sn`         bigint    not null COMMENT '订单号（对外业务号）',
    `order_id`         bigint    not null COMMENT '订单id',
    `alipay_trade_no`  bigint         DEFAULT NULL COMMENT '支付宝交易流水号',
    `total_amount`     decimal(18, 4) DEFAULT NULL COMMENT '支付总金额',
    `subject`          varchar(128)   DEFAULT NULL COMMENT '交易内容',
    `is_payment`       tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '支付状态：0：支付成功，1：支付失败',
    `confirm_time`     timestamp      DEFAULT NULL COMMENT '确认时间',
    `callback_content` varchar(4000)  DEFAULT NULL COMMENT '回调内容',
    `callback_time`    timestamp      DEFAULT NULL COMMENT '回调时间',
    `is_delete`        tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='支付信息表';


CREATE TABLE `osm_refund_info`
(
    `id`              bigint         not null auto_increment comment 'id',
    `create_user_id`  bigint         not null COMMENT '创建者id',
    `create_time`     timestamp      NOT NULL COMMENT '创建时间',
    `modify_user_id`  bigint         not null COMMENT '更新者id',
    `modify_time`     timestamp      NOT NULL COMMENT '更新时间',
    `order_return_id` bigint         not null COMMENT '退款的订单',
    `refund`          decimal(18, 4) not NULL default 0 COMMENT '退款金额',
    `refund_sn`       bigint         not NULL COMMENT '退款交易流水号',
    `is_refund`       tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '支付状态：0：退款成功，1：退款失败',
    `refund_channel`  tinyint (1) unsigned NOT NULL DEFAULT 0 COMMENT '退款渠道：0：原路退还，1：支付宝，2：微信，3：银联，4：汇款',
    `refund_content`  varchar(5000)           DEFAULT NULL COMMENT '退款说明',
    `is_delete`       tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='退款信息';