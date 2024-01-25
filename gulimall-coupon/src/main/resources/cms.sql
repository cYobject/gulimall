create table cms_coupon
(
    `id`              bigint         not null auto_increment comment 'id',
    `create_user_id`  bigint         not null COMMENT '创建者id',
    `create_time`     timestamp      NOT NULL COMMENT '创建时间',
    `modify_user_id`  bigint         not null COMMENT '更新者id',
    `modify_time`     timestamp      NOT NULL COMMENT '更新时间',
    coupon_type       tinyint(1) unsigned not null DEFAULT 0 comment '优惠卷类型：0：全场赠券，1：会员赠券，2：购物赠券，3：注册赠券',
    coupon_img        varchar(32)    NOT NULL comment '优惠券图片',
    coupon_name       varchar(32)    NOT NULL comment '优惠卷名字',
    num               int            not null default 0 comment '数量',
    amount            decimal(18, 4) NOT NULL comment '金额',
    per_limit         int            NOT NULL comment '每人限领张数',
    min_point         decimal(18, 4) NOT NULL comment '使用门槛',
    use_start_time    timestamp      NOT NULL comment '开始时间',
    use_end_time      timestamp      NOT NULL comment '结束时间',
    use_type          tinyint(1) unsigned NOT NULL DEFAULT 0 comment '使用类型：0：全场通用，1：指定分类，2：指定商品',
    note              varchar(200) comment '备注',
    publish_count     int            not null default 0 comment '发行数量',
    use_count         int            not null default 0 comment '已使用数量',
    receive_count     int            not null default 0 comment '领取数量',
    enable_start_time timestamp      NOT NULL comment '可以领取的开始日期',
    enable_end_time   timestamp      NOT NULL comment '可以领取的结束日期',
    code              varchar(32)    NOT NULL comment '优惠码',
    user_level        tinyint(1) unsigned NOT NULL DEFAULT 0 comment '可以领取的会员等级：0：不限等级，其他：对应等级',
    is_publish        tinyint(1) unsigned NOT NULL DEFAULT 0 comment '发布状态：0：未发布，1：已发布',
    `is_delete`       tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',
    primary key (id)
);

alter table cms_coupon comment '优惠券信息';

/*==============================================================*/
/* Table: cms_coupon_history                                    */
/*==============================================================*/
create table cms_coupon_history
(
    `id`             bigint      not null auto_increment comment 'id',
    `create_user_id` bigint      not null COMMENT '创建者id',
    `create_time`    timestamp   NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint      not null COMMENT '更新者id',
    `modify_time`    timestamp   NOT NULL COMMENT '更新时间',
    coupon_id        bigint      not null comment '优惠券id',
    user_id          bigint      not null comment '会员id',
    user_name        varchar(32) NOT NULL comment '会员名字',
    get_type         tinyint(1) unsigned NOT NULL DEFAULT 0 comment '获取方式：0：后台赠送，1：主动领取',
    use_type         tinyint(1) unsigned NOT NULL DEFAULT 0 comment '使用状态：0：未使用，1：已使用，2：已过期',
    use_time         timestamp default null comment '使用时间',
    order_id         bigint    default null comment '订单id',
    order_sn         bigint    default null comment '订单号',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',
    primary key (id)
);

alter table cms_coupon_history comment '优惠券历史记录';

/*==============================================================*/
/* Table: cms_coupon_spu_category_relation                      */
/*==============================================================*/
create table cms_coupon_spu_category_relation
(
    `id`             bigint      not null auto_increment comment 'id',
    `create_user_id` bigint      not null COMMENT '创建者id',
    `create_time`    timestamp   NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint      not null COMMENT '更新者id',
    `modify_time`    timestamp   NOT NULL COMMENT '更新时间',
    coupon_id        bigint      not null comment '优惠券id',
    category_id      bigint      not null comment '产品分类id',
    category_name    varchar(32) NOT NULL comment '产品分类名称',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    primary key (id)
);

alter table cms_coupon_spu_category_relation comment '优惠券分类关联';

/*==============================================================*/
/* Table: cms_coupon_spu_relation                               */
/*==============================================================*/
create table cms_coupon_spu_relation
(
    `id`             bigint      not null auto_increment comment 'id',
    `create_user_id` bigint      not null COMMENT '创建者id',
    `create_time`    timestamp   NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint      not null COMMENT '更新者id',
    `modify_time`    timestamp   NOT NULL COMMENT '更新时间',
    coupon_id        bigint      not null comment '优惠券id',
    spu_id           bigint      not null comment 'spu_id',
    spu_name         varchar(32) NOT NULL comment 'spu_name',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    primary key (id)
);

alter table cms_coupon_spu_relation comment '优惠券与产品关联';

/*==============================================================*/
/* Table: cms_home_adv                                          */
/*==============================================================*/
create table cms_home_adv
(
    `id`             bigint      not null auto_increment comment 'id',
    `create_user_id` bigint      not null COMMENT '创建者id',
    `create_time`    timestamp   NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint      not null COMMENT '更新者id',
    `modify_time`    timestamp   NOT NULL COMMENT '更新时间',
    name             varchar(32) NOT NULL comment '名字',
    pic              varchar(32) NOT NULL comment '图片地址',
    start_time       timestamp   NOT NULL comment '开始时间',
    end_time         timestamp   NOT NULL comment '结束时间',
    status           tinyint(1) comment '状态???????待补充',
    click_count      int         not null default 0 comment '点击数',
    url              varchar(32) comment '广告详情连接地址(?????????后续补充短链接)',
    note             varchar(200) comment '备注',
    sort             int         NOT NULL default 0 comment '排序',
    auth_id          bigint      not null comment '审核通过者id',
    `auth_time`      timestamp   NOT NULL COMMENT '审核通过时间',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    primary key (id)
);

alter table cms_home_adv comment '首页轮播广告';

/*==============================================================*/
/* Table: cms_home_subject                                      */
/*==============================================================*/
create table cms_home_subject
(
    `id`             bigint      not null auto_increment comment 'id',
    `create_user_id` bigint      not null COMMENT '创建者id',
    `create_time`    timestamp   NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint      not null COMMENT '更新者id',
    `modify_time`    timestamp   NOT NULL COMMENT '更新时间',
    name             varchar(32) NOT NULL comment '专题名字',
    title            varchar(32) NOT NULL comment '专题标题',
    sub_title        varchar(32) NOT NULL comment '专题副标题',
    is_visit         tinyint(1) unsigned NOT NULL DEFAULT 0 comment '是否显示：0：未显示，1：已显示',
    url              varchar(32) comment '详情连接',
    sort             int         NOT NULL default 0 comment '排序',
    img              varchar(32) comment '专题图片地址',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    primary key (id)
);

alter table cms_home_subject comment '首页专题表【jd首页下面很多专题，每个专题链接新的页面，展示专题商品信息】';

/*==============================================================*/
/* Table: cms_home_subject_spu                                  */
/*==============================================================*/
create table cms_home_subject_spu
(
    `id`             bigint      not null auto_increment comment 'id',
    `create_user_id` bigint      not null COMMENT '创建者id',
    `create_time`    timestamp   NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint      not null COMMENT '更新者id',
    `modify_time`    timestamp   NOT NULL COMMENT '更新时间',
    name             varchar(32) NOT NULL comment '专题名字',
    subject_id       bigint      not null comment '专题id',
    spu_id           bigint      not null comment 'spu_id',
    sort             int         NOT NULL default 0 comment '排序',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    primary key (id)
);

alter table cms_home_subject_spu comment '专题商品';

/*==============================================================*/
/* Table: cms_user_price                                      */
/*==============================================================*/
create table cms_user_price
(
    `id`             bigint         not null auto_increment comment 'id',
    `create_user_id` bigint         not null COMMENT '创建者id',
    `create_time`    timestamp      NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint         not null COMMENT '更新者id',
    `modify_time`    timestamp      NOT NULL COMMENT '更新时间',
    sku_id           bigint         not null comment 'sku_id',
    user_level_id    bigint         not null comment '会员等级id',
    user_level_name  varchar(32)    NOT NULL comment '会员等级名',
    user_price       decimal(18, 4) NOT NULL comment '会员对应价格',
    is_add_other     tinyint(1) unsigned NOT NULL DEFAULT 0 comment '可否叠加其他优惠：0-不可叠加优惠，1-可叠加',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    primary key (id)
);

alter table cms_user_price comment '商品会员价格';

/*==============================================================*/
/* Table: cms_seckill_promotion                                 */
/*==============================================================*/
create table cms_seckill_promotion
(
    `id`             bigint      not null auto_increment comment 'id',
    `create_user_id` bigint      not null COMMENT '创建者id',
    `create_time`    timestamp   NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint      not null COMMENT '更新者id',
    `modify_time`    timestamp   NOT NULL COMMENT '更新时间',
    title            varchar(32) NOT NULL comment '活动标题',
    start_time       timestamp   NOT NULL comment '开始时间',
    end_time         timestamp   NOT NULL comment '结束时间',
    is_down          tinyint(1) unsigned NOT NULL DEFAULT 0 comment '是否在线：0：下线，1：在线',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    primary key (id)
);

alter table cms_seckill_promotion comment '秒杀活动';

/*==============================================================*/
/* Table: cms_seckill_session                                   */
/*==============================================================*/
create table cms_seckill_session
(
    `id`             bigint      not null auto_increment comment 'id',
    `create_user_id` bigint      not null COMMENT '创建者id',
    `create_time`    timestamp   NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint      not null COMMENT '更新者id',
    `modify_time`    timestamp   NOT NULL COMMENT '更新时间',
    name             varchar(32) NOT NULL comment '场次名称',
    start_time       timestamp   NOT NULL comment '开始时间',
    end_time         timestamp   NOT NULL comment '结束时间',
    is_down          tinyint(1) unsigned NOT NULL DEFAULT 0 comment '是否在线：0：在线，1：下线',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    primary key (id)
);

alter table cms_seckill_session comment '秒杀活动场次';

/*==============================================================*/
/* Table: cms_seckill_sku_notice                                */
/*==============================================================*/
create table cms_seckill_sku_notice
(
    `id`             bigint    not null auto_increment comment 'id',
    `create_user_id` bigint    not null COMMENT '创建者id',
    `create_time`    timestamp NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint    not null COMMENT '更新者id',
    `modify_time`    timestamp NOT NULL COMMENT '更新时间',
    user_id          bigint    not null comment 'user_id',
    sku_id           bigint    not null comment 'sku_id',
    session_id       bigint    not null comment '活动场次id',
    subcribe_time    timestamp NOT NULL comment '订阅时间',
    send_time        timestamp NOT NULl comment '发送时间',
    notice_type      tinyint(1) unsigned NOT NULL DEFAULT 0 comment '通知方式：0：不通知，1：短信，2：邮件，3：短信和邮件',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    primary key (id)
);

alter table cms_seckill_sku_notice comment '秒杀商品通知订阅';

/*==============================================================*/
/* Table: cms_seckill_sku_relation                              */
/*==============================================================*/
create table cms_seckill_sku_relation
(
    `id`                 bigint         not null auto_increment comment 'id',
    `create_user_id`     bigint         not null COMMENT '创建者id',
    `create_time`        timestamp      NOT NULL COMMENT '创建时间',
    `modify_user_id`     bigint         not null COMMENT '更新者id',
    `modify_time`        timestamp      NOT NULL COMMENT '更新时间',
    promotion_id         bigint         not null comment '活动id',
    promotion_session_id bigint         not null comment '活动场次id',
    sku_id               bigint         not null comment '商品id',
    seckill_price        decimal(18, 4) NOT NULL comment '秒杀价格',
    seckill_count        int            not null default 0 comment '秒杀总量',
    seckill_limit        int            not null default 0 comment '每人限购数量',
    seckill_sort         int            not null default 0 comment '排序',
    `is_delete`          tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    primary key (id)
);

alter table cms_seckill_sku_relation comment '秒杀活动商品关联';

/*==============================================================*/
/* Table: cms_sku_full_reduction                                */
/*==============================================================*/
create table cms_sku_full_reduction
(
    `id`             bigint         not null auto_increment comment 'id',
    `create_user_id` bigint         not null COMMENT '创建者id',
    `create_time`    timestamp      NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint         not null COMMENT '更新者id',
    `modify_time`    timestamp      NOT NULL COMMENT '更新时间',
    sku_id           bigint         not null comment 'spu_id',
    full_price       decimal(18, 4) NOT NULL comment '满多少',
    reduce_price     decimal(18, 4) NOT NULL comment '减多少',
    is_add_other     tinyint(1) unsigned NOT NULL DEFAULT 0 comment '可否叠加其他优惠：0-不可叠加优惠，1-可叠加',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    primary key (id)
);

alter table cms_sku_full_reduction comment '商品满减信息';

/*==============================================================*/
/* Table: cms_sku_ladder                                        */
/*==============================================================*/
create table cms_sku_ladder
(
    `id`             bigint         not null auto_increment comment 'id',
    `create_user_id` bigint         not null COMMENT '创建者id',
    `create_time`    timestamp      NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint         not null COMMENT '更新者id',
    `modify_time`    timestamp      NOT NULL COMMENT '更新时间',
    sku_id           bigint         not null comment 'spu_id',
    full_count       int            not null default 0 comment '满几件',
    discount         decimal(4, 2)  NOT NULL comment '打几折',
    price            decimal(18, 4) NOT NULL comment '折后价',
    is_add_other     tinyint(1) unsigned NOT NULL DEFAULT 0 comment '可否叠加其他优惠：0-不可叠加优惠，1-可叠加',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',

    primary key (id)
);

alter table cms_sku_ladder comment '商品阶梯价格';

create table cms_spu_bounds
(
    `id`             bigint         not null auto_increment comment 'id',
    `create_user_id` bigint         not null COMMENT '创建者id',
    `create_time`    timestamp      NOT NULL COMMENT '创建时间',
    `modify_user_id` bigint         not null COMMENT '更新者id',
    `modify_time`    timestamp      NOT NULL COMMENT '更新时间',
    spu_id           bigint         not null COMMENT 'spu_id',
    grow_bounds      decimal(18, 4) NOT NULL comment '成长积分',
    buy_bounds       decimal(18, 4) NOT NULL comment '购物积分',
    work             tinyint(1) unsigned NOT NULL DEFAULT 0 comment '优惠生效情况：0：无优惠，不赠送成长积分;1：无优惠，赠送成长积分;2：有优惠，不赠送成长积分;3：有优惠，赠送成长积分',
    `is_delete`      tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否删除：0：未删除，1：已删除',
    primary key (id)
);

alter table cms_spu_bounds comment '商品spu积分设置';
