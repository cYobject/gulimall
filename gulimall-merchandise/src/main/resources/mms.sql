CREATE TABLE `psm_category`
(
    `id`             bigint      not null auto_increment comment 'id',
    `create_user_id` bigint      not null COMMENT '创建者id',
    `create_time`    timestamp   NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint      not null COMMENT '更新者id',
    `modify_time`    timestamp   NOT NULL COMMENT '更新时间',
    `name`           varchar(32) NOT NULL COMMENT '分类名称',
    `parent_id`      bigint      not null COMMENT '父分类id(顶层为-1)',
    `level`          int         NOT NULL default 0 COMMENT '层级(顶层为0)',
    sort             int         NOT NULL default 0 comment '排序',
    `icon`           varchar(32) NOT NULL COMMENT '图标',
    `product_unit`   varchar(32) NOT NULL COMMENT '商品计量单位',
    `product_count`  int         not null default 0 COMMENT '商品数量',
    is_visit         tinyint(1) unsigned NOT NULL DEFAULT 0 comment '是否显示：0：未显示，1：已显示',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='三级分类';

CREATE TABLE `psm_brand`
(
    `id`             bigint        not null auto_increment comment 'id',
    `create_user_id` bigint        not null COMMENT '创建者id',
    `create_time`    timestamp     NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint        not null COMMENT '更新者id',
    `modify_time`    timestamp     NOT NULL COMMENT '更新时间',
    `name`           varchar(32)   NOT NULL COMMENT '品牌名',
    `logo`           varchar(32)   NOT NULL COMMENT '品牌logo',
    `description`    varchar(1024) NOT NULL COMMENT '品牌介绍',
    `first_letter`   char(1)       NOT NULL COMMENT '检索首字母',
    sort             int           NOT NULL default 0 comment '排序',
    is_visit         tinyint(1) unsigned NOT NULL DEFAULT 0 comment '是否显示：0：未显示，1：已显示',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='品牌';

CREATE TABLE `psm_spu`
(
    `id`             bigint         not null auto_increment comment 'id',
    `create_user_id` bigint         not null COMMENT '创建者id',
    `create_time`    timestamp      NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint         not null COMMENT '更新者id',
    `modify_time`    timestamp      NOT NULL COMMENT '更新时间',
    `name`           varchar(32)    NOT NULL COMMENT '名称',
    `description`    varchar(1024)  NOT NULL COMMENT '描述',
    `category_id`    bigint         not null COMMENT '分类id',
    `brand_id`       bigint         not null COMMENT '品牌id',
    `weight`         decimal(18, 4) NOT NULL COMMENT '重量',
    `default_img`    varchar(32)    NOT NULL COMMENT '默认图片(冗余)',
    is_publish       tinyint(1) unsigned NOT NULL DEFAULT 0 comment '发布状态：0：未发布，1：已发布',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='spu信息';

CREATE TABLE `psm_spu_images`
(
    `id`             bigint      not null auto_increment comment 'id',
    `create_user_id` bigint      not null COMMENT '创建者id',
    `create_time`    timestamp   NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint      not null COMMENT '更新者id',
    `modify_time`    timestamp   NOT NULL COMMENT '更新时间',
    `spu_id`         bigint      not null COMMENT 'spuId',
    `name`           varchar(32) NOT NULL COMMENT '图片名',
    `url`            varchar(32) NOT NULL COMMENT '图片地址',
    `is_default`     tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否默认图(0否,1是)',
    sort             int         NOT NULL default 0 comment '排序',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='spu图片';

CREATE TABLE `psm_sku`
(
    `id`             bigint         not null auto_increment comment 'id',
    `create_user_id` bigint         not null COMMENT '创建者id',
    `create_time`    timestamp      NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint         not null COMMENT '更新者id',
    `modify_time`    timestamp      NOT NULL COMMENT '更新时间',
    `spu_id`         bigint         not null COMMENT 'spuId',
    `name`           varchar(32)             DEFAULT NULL COMMENT '名称',
    `description`    varchar(1024)  NOT NULL COMMENT '描述',
    `category_id`    bigint         NOT NULL COMMENT '分类id',
    `brand_id`       bigint         NOT NULL COMMENT '品牌id',
    `default_img`    varchar(32)    NOT NULL COMMENT '默认图片(冗余)',
    `title`          varchar(32)    NOT NULL COMMENT '标题',
    `subtitle`       varchar(64)    NOT NULL COMMENT '副标题',
    `price`          decimal(18, 4) NOT NULL COMMENT '价格',
    `sale_count`     int            not null default 0 COMMENT '销量',
    is_publish       tinyint(1) unsigned NOT NULL DEFAULT 0 comment '发布状态：0：未发布，1：已发布',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='sku信息';

CREATE TABLE `psm_sku_images`
(
    `id`             bigint      not null auto_increment comment 'id',
    `create_user_id` bigint      not null COMMENT '创建者id',
    `create_time`    timestamp   NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint      not null COMMENT '更新者id',
    `modify_time`    timestamp   NOT NULL COMMENT '更新时间',
    `sku_id`         bigint      not null COMMENT 'skuId',
    `name`           varchar(32) NOT NULL COMMENT '图片名',
    `url`            varchar(32) NOT NULL COMMENT '图片地址',
    sort             int         NOT NULL default 0 comment '排序',
    `is_default`     tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否默认图(0否,1是)',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='sku图片';

CREATE TABLE `psm_spec_group`
(
    `id`             bigint        not null auto_increment comment 'id',
    `create_user_id` bigint        not null COMMENT '创建者id',
    `create_time`    timestamp     NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint        not null COMMENT '更新者id',
    `modify_time`    timestamp     NOT NULL COMMENT '更新时间',
    `category_id`    bigint        NOT NULL COMMENT '所属分类id',
    `name`           varchar(32)   NOT NULL COMMENT '规格组名',
    sort             int           NOT NULL default 0 comment '排序',
    `description`    varchar(1024) NOT NULL COMMENT '描述',
    `icon`           varchar(32)   not NULL COMMENT '组图标',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='规格分组';

CREATE TABLE `psm_spec_group_relation`
(
    `id`             bigint    not null auto_increment comment 'id',
    `create_user_id` bigint    not null COMMENT '创建者id',
    `create_time`    timestamp NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint    not null COMMENT '更新者id',
    `modify_time`    timestamp NOT NULL COMMENT '更新时间',
    `spec_id`        bigint    NOT NULL COMMENT '规格id',
    `spec_group_id`  bigint    NOT NULL COMMENT '规格分组id',
    sort             int       NOT NULL default 0 comment '排序',
    `category_id`    bigint    NOT NULL COMMENT '商品分类id(冗余)',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='规格&规格分组关联';

CREATE TABLE `psm_spec`
(
    `id`             bigint      not null auto_increment comment 'id',
    `create_user_id` bigint      not null COMMENT '创建者id',
    `create_time`    timestamp   NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint      not null COMMENT '更新者id',
    `modify_time`    timestamp   NOT NULL COMMENT '更新时间',
    `name`           varchar(32) NOT NULL COMMENT '规格名称',
    `icon`           varchar(32) NOT NULL COMMENT '规格图标',
    `value_select`   char(255) DEFAULT NULL COMMENT '可选值列表(用英文,分隔)',
    `type`           tinyint(1) unsigned not null DEFAULT 0 COMMENT '属性类型：0：销售属性，1：基本属性，2：销售属性&基本属性',
    `is_search`      tinyint(1) unsigned not null DEFAULT 0 COMMENT '是否可以检索：0：不可以，1：可以',
    is_visit         tinyint(1) unsigned NOT NULL DEFAULT 0 comment '是否展示在介绍上显示：0：未显示，1：已显示，在sku中仍然可以调整',
    `is_enable`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否启用：0：禁用，1：启用',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品规格';

CREATE TABLE `psm_spu_spec_value`
(
    `id`             bigint      not null auto_increment comment 'id',
    `create_user_id` bigint      not null COMMENT '创建者id',
    `create_time`    timestamp   NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint      not null COMMENT '更新者id',
    `modify_time`    timestamp   NOT NULL COMMENT '更新时间',
    `spu_id`         bigint      NOT NULL COMMENT 'spuId',
    `spec_id`        bigint      NOT NULL COMMENT '规格id',
    `spec_name`      varchar(32) NOT NULL COMMENT '规格名',
    `spec_value`     int         NOT NULL default 0 COMMENT '规格值',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='spu规格值';

CREATE TABLE `psm_sku_spec_value`
(
    `id`             bigint      not null auto_increment comment 'id',
    `create_user_id` bigint      not null COMMENT '创建者id',
    `create_time`    timestamp   NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint      not null COMMENT '更新者id',
    `modify_time`    timestamp   NOT NULL COMMENT '更新时间',
    `sku_id`         bigint      NOT NULL COMMENT 'skuId',
    `spec_id`        bigint      NOT NULL COMMENT '规格id',
    `spec_name`      varchar(32) NOT NULL COMMENT '规格名',
    `spec_value`     int         NOT NULL default 0 COMMENT '规格值',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='sku销售属性的值';

CREATE TABLE `psm_comment`
(
    `id`             bigint      not null auto_increment comment 'id',
    `create_user_id` bigint      not null COMMENT '创建者id',
    `create_time`    timestamp   NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint      not null COMMENT '更新者id',
    `modify_time`    timestamp   NOT NULL COMMENT '更新时间',
    `sku_id`         bigint      NOT NULL COMMENT 'sku_id',
    `spu_id`         bigint      NOT NULL COMMENT 'spu_id',
    `user_id`        bigint      NOT NULL COMMENT '用户id',
    `star`           tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '星级',
    `user_city`      varchar(8)  NOT NULL COMMENT '会员所在城市',
    `spu_attributes` varchar(16) NOT NULL COMMENT '购买时属性组合',
    `like_count`     int         NOT NULL DEFAULT 0 COMMENT '点赞数',
    `dislike_count`  int         NOT NULL DEFAULT 0 COMMENT '点踩数',
    `reply_count`    int         NOT NULL DEFAULT 0 COMMENT '回复数',
    `resources`      varchar(1024)        DEFAULT NULL COMMENT '评论图片/视频内容[json数据；[{type:文件类型,url:资源路径}]]',
    `content`        varchar(2048)        DEFAULT NULL COMMENT '文字内容',
    `comment_type`   tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '评论类型：0：对商品的直接评论，1：对评论的回复',
    is_visit         tinyint(1) unsigned NOT NULL DEFAULT 0 comment '是否显示：0：未显示，1：已显示',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品评价';

CREATE TABLE `psm_comment_replay`
(
    `id`             bigint    not null auto_increment comment 'id',
    `create_user_id` bigint    not null COMMENT '创建者id',
    `create_time`    timestamp NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint    not null COMMENT '更新者id',
    `modify_time`    timestamp NOT NULL COMMENT '更新时间',
    `comment_id`     bigint    NOT NULL COMMENT '评论id',
    `reply_id`       bigint    NOT NULL COMMENT '回复id',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品评价回复关系';