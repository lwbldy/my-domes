

DROP TABLE IF EXISTS `single_page`;

CREATE TABLE `single_page` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `title` NVARCHAR(255) COMMENT '标题',
  `type_id` CHAR(19) DEFAULT NULL COMMENT '类型',
  `url` NVARCHAR(255) COMMENT 'url',
  `synopsis` NVARCHAR(255) COMMENT '简介',
  `context` TEXT COMMENT '内容',
  `pic` NVARCHAR(50) COMMENT '主图',
  `show_time` DATETIME DEFAULT NULL COMMENT '显示时间',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_url` (`url`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COMMENT='单页';

/*Data for the table `single_page` */

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` VARCHAR(19) NOT NULL COMMENT '配置标识',
  `config_name` CHAR(20) DEFAULT NULL COMMENT '配置名称',
  `config_code` CHAR(20) DEFAULT NULL COMMENT '配置标识',
  `config_value` VARCHAR(255) DEFAULT NULL COMMENT '配置值',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `create_by` CHAR(20) DEFAULT NULL COMMENT '创建人',
  `update_by` CHAR(1) DEFAULT NULL COMMENT '修改人',
  `update_time` DATETIME DEFAULT NULL COMMENT '修改时间',
  `remark` VARCHAR(255) DEFAULT NULL COMMENT '备注',
  `config_type` CHAR(10) DEFAULT NULL COMMENT '配置类型',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_config` */

INSERT  INTO `sys_config`(`config_id`,`config_name`,`config_code`,`config_value`,`create_time`,`create_by`,`update_by`,`update_time`,`remark`,`config_type`) VALUES ('1307313917164257280','网站描述','system_desc','网站描述',NULL,NULL,NULL,NULL,'网站描述','STRING');
INSERT  INTO `sys_config`(`config_id`,`config_name`,`config_code`,`config_value`,`create_time`,`create_by`,`update_by`,`update_time`,`remark`,`config_type`) VALUES ('1309118169381601280','网站数据','system_meta','网站数据',NULL,NULL,NULL,NULL,'网站数据','STRING');
INSERT  INTO `sys_config`(`config_id`,`config_name`,`config_code`,`config_value`,`create_time`,`create_by`,`update_by`,`update_time`,`remark`,`config_type`) VALUES ('1309120861596286976','网站主题','system_theme','网站主题',NULL,NULL,NULL,NULL,'网站主题','STRING');
INSERT  INTO `sys_config`(`config_id`,`config_name`,`config_code`,`config_value`,`create_time`,`create_by`,`update_by`,`update_time`,`remark`,`config_type`) VALUES ('网站名称','网站名称','system_name','网站名称',NULL,NULL,NULL,NULL,'系统配置\n','STRING');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` VARCHAR(20) NOT NULL COMMENT '部门名称',
  `parent_id` VARCHAR(20) DEFAULT NULL COMMENT '父级编号',
  `dept_name` VARCHAR(50) DEFAULT NULL COMMENT '部门名称',
  `sort` INT(255) DEFAULT NULL COMMENT '排序',
  `leader` VARCHAR(50) DEFAULT NULL COMMENT '负责人',
  `phone` VARCHAR(20) DEFAULT NULL COMMENT '联系方式',
  `email` VARCHAR(50) DEFAULT NULL COMMENT '邮箱',
  `status` VARCHAR(1) DEFAULT NULL COMMENT '部门状态',
  `create_by` VARCHAR(20) DEFAULT NULL COMMENT '创建人',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_by` VARCHAR(20) DEFAULT NULL COMMENT '修改人',
  `update_time` DATETIME DEFAULT NULL COMMENT '修改时间',
  `remark` TEXT COMMENT '备注',
  `address` VARCHAR(255) DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_dept` */

INSERT  INTO `sys_dept`(`dept_id`,`parent_id`,`dept_name`,`sort`,`leader`,`phone`,`email`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`address`) VALUES ('1','0','总部',1,'刘XX','11111111111','lwbldy@163.com','0',NULL,NULL,NULL,NULL,NULL,'江西赣州总部');

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `data_id` CHAR(19) NOT NULL COMMENT '标识',
  `data_label` VARCHAR(19) DEFAULT NULL COMMENT '字典标签',
  `data_value` VARCHAR(20) DEFAULT NULL COMMENT '字典值',
  `type_code` CHAR(20) DEFAULT NULL COMMENT '所属类型',
  `is_default` CHAR(1) DEFAULT NULL COMMENT '是否默认',
  `update_by` CHAR(19) DEFAULT NULL COMMENT '修改人',
  `update_time` DATETIME DEFAULT NULL COMMENT '修改时间',
  `create_by` VARCHAR(255) DEFAULT NULL COMMENT '创建人',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `remark` VARCHAR(255) DEFAULT NULL COMMENT '备注',
  `enable` CHAR(1) DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`data_id`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_dict_data` */

INSERT  INTO `sys_dict_data`(`data_id`,`data_label`,`data_value`,`type_code`,`is_default`,`update_by`,`update_time`,`create_by`,`create_time`,`remark`,`enable`) VALUES ('1','男','0','system_user_sex','0',NULL,NULL,NULL,NULL,'描述','1');
INSERT  INTO `sys_dict_data`(`data_id`,`data_label`,`data_value`,`type_code`,`is_default`,`update_by`,`update_time`,`create_by`,`create_time`,`remark`,`enable`) VALUES ('1302833449496739840','字典名称','字典值','dict_code','1',NULL,NULL,NULL,NULL,'aw','0');
INSERT  INTO `sys_dict_data`(`data_id`,`data_label`,`data_value`,`type_code`,`is_default`,`update_by`,`update_time`,`create_by`,`create_time`,`remark`,`enable`) VALUES ('1317401149287956480','男','boy','user_sex',NULL,NULL,NULL,NULL,NULL,'男 : body','0');
INSERT  INTO `sys_dict_data`(`data_id`,`data_label`,`data_value`,`type_code`,`is_default`,`update_by`,`update_time`,`create_by`,`create_time`,`remark`,`enable`) VALUES ('1317402976670711808','女','girl','user_sex',NULL,NULL,NULL,NULL,NULL,'女 : girl','0');
INSERT  INTO `sys_dict_data`(`data_id`,`data_label`,`data_value`,`type_code`,`is_default`,`update_by`,`update_time`,`create_by`,`create_time`,`remark`,`enable`) VALUES ('1336510050629320704','江西','jiangxi','region',NULL,NULL,NULL,NULL,NULL,'江西','0');
INSERT  INTO `sys_dict_data`(`data_id`,`data_label`,`data_value`,`type_code`,`is_default`,`update_by`,`update_time`,`create_by`,`create_time`,`remark`,`enable`) VALUES ('1336510258780045312','广州','guangzhou','region',NULL,NULL,NULL,NULL,NULL,NULL,'0');
INSERT  INTO `sys_dict_data`(`data_id`,`data_label`,`data_value`,`type_code`,`is_default`,`update_by`,`update_time`,`create_by`,`create_time`,`remark`,`enable`) VALUES ('1340923072080773120','保健防护','bjfh','ybkp',NULL,NULL,NULL,NULL,NULL,'保健防护','0');
INSERT  INTO `sys_dict_data`(`data_id`,`data_label`,`data_value`,`type_code`,`is_default`,`update_by`,`update_time`,`create_by`,`create_time`,`remark`,`enable`) VALUES ('1340923135276351488','牙疼','yt','ybkp',NULL,NULL,NULL,NULL,NULL,NULL,'0');
INSERT  INTO `sys_dict_data`(`data_id`,`data_label`,`data_value`,`type_code`,`is_default`,`update_by`,`update_time`,`create_by`,`create_time`,`remark`,`enable`) VALUES ('1340923452051161088','牙齿损伤','ycss','ybkp',NULL,NULL,NULL,NULL,NULL,NULL,'0');
INSERT  INTO `sys_dict_data`(`data_id`,`data_label`,`data_value`,`type_code`,`is_default`,`update_by`,`update_time`,`create_by`,`create_time`,`remark`,`enable`) VALUES ('1340923579549614080','乳牙问题','rywt','ybkp',NULL,NULL,NULL,NULL,NULL,NULL,'0');
INSERT  INTO `sys_dict_data`(`data_id`,`data_label`,`data_value`,`type_code`,`is_default`,`update_by`,`update_time`,`create_by`,`create_time`,`remark`,`enable`) VALUES ('1340923959314481152','缺牙','qy','ybkp',NULL,NULL,NULL,NULL,NULL,NULL,'0');
INSERT  INTO `sys_dict_data`(`data_id`,`data_label`,`data_value`,`type_code`,`is_default`,`update_by`,`update_time`,`create_by`,`create_time`,`remark`,`enable`) VALUES ('1340924214625959936','牙龈红肿','yyhz','ybkp',NULL,NULL,NULL,NULL,NULL,NULL,'0');
INSERT  INTO `sys_dict_data`(`data_id`,`data_label`,`data_value`,`type_code`,`is_default`,`update_by`,`update_time`,`create_by`,`create_time`,`remark`,`enable`) VALUES ('2','女','1','system_user_sex','1',NULL,NULL,NULL,NULL,'描述','0');
INSERT  INTO `sys_dict_data`(`data_id`,`data_label`,`data_value`,`type_code`,`is_default`,`update_by`,`update_time`,`create_by`,`create_time`,`remark`,`enable`) VALUES ('447572898392182784','awd','awd','dict_code','1',NULL,NULL,NULL,NULL,'awd','0');

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `id` CHAR(19) NOT NULL COMMENT '标识',
  `type_name` VARCHAR(255) DEFAULT NULL COMMENT '字典类型名称',
  `type_code` VARCHAR(255) DEFAULT NULL COMMENT '字典类型标识',
  `description` VARCHAR(255) DEFAULT NULL COMMENT '字典类型描述',
  `enable` CHAR(1) DEFAULT NULL COMMENT '是否启用',
  `create_by` CHAR(19) DEFAULT NULL COMMENT '创建人',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_by` CHAR(19) DEFAULT NULL COMMENT '修改人',
  `update_time` DATETIME DEFAULT NULL COMMENT '修改时间',
  `remark` VARCHAR(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_dict_type` */

INSERT  INTO `sys_dict_type`(`id`,`type_name`,`type_code`,`description`,`enable`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1317360314219495424','登录类型','login','登录类型','0',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_dict_type`(`id`,`type_name`,`type_code`,`description`,`enable`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1317400519127334912','用户类型','user_status','用户类型','0',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_dict_type`(`id`,`type_name`,`type_code`,`description`,`enable`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1317400823096934400','配置类型','config_type','配置类型','0',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_dict_type`(`id`,`type_name`,`type_code`,`description`,`enable`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1336499760692985856','地区管理','region','地区管理','0',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_dict_type`(`id`,`type_name`,`type_code`,`description`,`enable`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1340922883660054528','牙病科普','ybkp','牙病科普分类','0',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_dict_type`(`id`,`type_name`,`type_code`,`description`,`enable`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('455184568505470976','用户性别','user_sex','用户性别','0',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_dict_type`(`id`,`type_name`,`type_code`,`description`,`enable`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('455184935989415936','全局状态','sys_status','状态描述\n','0',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sys_file` */

DROP TABLE IF EXISTS `sys_file`;

CREATE TABLE `sys_file` (
  `id` CHAR(19) NOT NULL COMMENT '标识',
  `file_name` VARCHAR(255) DEFAULT NULL COMMENT '文件名称',
  `file_desc` VARCHAR(255) DEFAULT NULL COMMENT '文件描述',
  `file_path` VARCHAR(255) DEFAULT NULL COMMENT '文件路径',
  `file_type` VARCHAR(255) DEFAULT NULL COMMENT '文件类型',
  `create_by` VARCHAR(255) DEFAULT NULL COMMENT '创建人',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_by` VARCHAR(255) DEFAULT NULL COMMENT '修改人',
  `update_time` DATETIME DEFAULT NULL COMMENT '修改时间',
  `remark` VARCHAR(255) DEFAULT NULL COMMENT '备注',
  `target_date` DATETIME DEFAULT NULL COMMENT '所属时间',
  `file_size` VARCHAR(255) DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_file` */

/*Table structure for table `sys_logging` */

DROP TABLE IF EXISTS `sys_logging`;

CREATE TABLE `sys_logging` (
  `id` CHAR(19) NOT NULL COMMENT '相应消息体',
  `title` VARCHAR(255) DEFAULT NULL COMMENT '标题',
  `method` VARCHAR(255) DEFAULT NULL COMMENT '请求方式',
  `business_type` VARCHAR(255) DEFAULT NULL COMMENT '业务类型',
  `request_method` VARCHAR(255) DEFAULT NULL COMMENT '请求方法',
  `operate_name` VARCHAR(255) DEFAULT NULL COMMENT '操作人',
  `operate_url` VARCHAR(255) DEFAULT NULL COMMENT '操作路径',
  `operate_address` VARCHAR(255) DEFAULT NULL COMMENT '操作地址',
  `request_param` VARCHAR(255) DEFAULT NULL COMMENT '请求参数',
  `response_body` VARCHAR(255) DEFAULT NULL COMMENT '相应消息体',
  `success` VARCHAR(255) DEFAULT NULL COMMENT '是否成功',
  `error_msg` VARCHAR(255) DEFAULT NULL COMMENT '异常信息',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `description` VARCHAR(255) DEFAULT NULL COMMENT '描述',
  `request_body` VARCHAR(255) DEFAULT NULL COMMENT '请求消息体',
  `browser` VARCHAR(255) DEFAULT NULL COMMENT '使用浏览器',
  `system_os` VARCHAR(255) DEFAULT NULL COMMENT '操作系统',
  `logging_type` VARCHAR(10) DEFAULT NULL COMMENT '日志类型，登录日志，操作日志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_logging` */

INSERT  INTO `sys_logging`(`id`,`title`,`method`,`business_type`,`request_method`,`operate_name`,`operate_url`,`operate_address`,`request_param`,`response_body`,`success`,`error_msg`,`create_time`,`description`,`request_body`,`browser`,`system_os`,`logging_type`) VALUES ('1351412692472037376','登录','/login','OTHER','POST','admin','/login','127.0.0.1',NULL,NULL,'1',NULL,'2021-01-19 14:14:28','登录成功',NULL,'谷歌浏览器','Windows','LOGIN');
INSERT  INTO `sys_logging`(`id`,`title`,`method`,`business_type`,`request_method`,`operate_name`,`operate_url`,`operate_address`,`request_param`,`response_body`,`success`,`error_msg`,`create_time`,`description`,`request_body`,`browser`,`system_os`,`logging_type`) VALUES ('1351412700982280192','主页','/index','ADD','GET','admin','/index','127.0.0.1',NULL,NULL,'1',NULL,'2021-01-19 14:14:30','返回 Index 主页视图',NULL,'谷歌浏览器','Windows','OPERATE');
INSERT  INTO `sys_logging`(`id`,`title`,`method`,`business_type`,`request_method`,`operate_name`,`operate_url`,`operate_address`,`request_param`,`response_body`,`success`,`error_msg`,`create_time`,`description`,`request_body`,`browser`,`system_os`,`logging_type`) VALUES ('1351412747790712832','查询用户','/system/user/data','QUERY','GET','admin','/system/user/data','127.0.0.1',NULL,NULL,'1',NULL,'2021-01-19 14:14:42','查询用户','page=1&limit=10','谷歌浏览器','Windows','OPERATE');
INSERT  INTO `sys_logging`(`id`,`title`,`method`,`business_type`,`request_method`,`operate_name`,`operate_url`,`operate_address`,`request_param`,`response_body`,`success`,`error_msg`,`create_time`,`description`,`request_body`,`browser`,`system_os`,`logging_type`) VALUES ('1351412957581410304','主页','/index','ADD','GET','admin','/index','127.0.0.1',NULL,NULL,'1',NULL,'2021-01-19 14:15:31','返回 Index 主页视图',NULL,'谷歌浏览器','Windows','OPERATE');
INSERT  INTO `sys_logging`(`id`,`title`,`method`,`business_type`,`request_method`,`operate_name`,`operate_url`,`operate_address`,`request_param`,`response_body`,`success`,`error_msg`,`create_time`,`description`,`request_body`,`browser`,`system_os`,`logging_type`) VALUES ('1351414202270482432','查询用户','/system/user/data','QUERY','GET','admin','/system/user/data','127.0.0.1',NULL,NULL,'1',NULL,'2021-01-19 14:20:28','查询用户','page=1&limit=10','谷歌浏览器','Windows','OPERATE');
INSERT  INTO `sys_logging`(`id`,`title`,`method`,`business_type`,`request_method`,`operate_name`,`operate_url`,`operate_address`,`request_param`,`response_body`,`success`,`error_msg`,`create_time`,`description`,`request_body`,`browser`,`system_os`,`logging_type`) VALUES ('1351414298986938368','主页','/index','ADD','GET','admin','/index','127.0.0.1',NULL,NULL,'1',NULL,'2021-01-19 14:20:51','返回 Index 主页视图',NULL,'谷歌浏览器','Windows','OPERATE');
INSERT  INTO `sys_logging`(`id`,`title`,`method`,`business_type`,`request_method`,`operate_name`,`operate_url`,`operate_address`,`request_param`,`response_body`,`success`,`error_msg`,`create_time`,`description`,`request_body`,`browser`,`system_os`,`logging_type`) VALUES ('1351415488403472384','主页','/index','ADD','GET','admin','/index','127.0.0.1',NULL,NULL,'1',NULL,'2021-01-19 14:25:35','返回 Index 主页视图',NULL,'谷歌浏览器','Windows','OPERATE');

/*Table structure for table `sys_power` */

DROP TABLE IF EXISTS `sys_power`;

CREATE TABLE `sys_power` (
  `power_id` CHAR(19) NOT NULL COMMENT '权限编号',
  `power_name` VARCHAR(255) DEFAULT NULL COMMENT '权限名称',
  `power_type` CHAR(1) DEFAULT NULL COMMENT '权限类型',
  `power_code` CHAR(30) DEFAULT NULL COMMENT '权限标识',
  `power_url` VARCHAR(255) DEFAULT NULL COMMENT '权限路径',
  `open_type` CHAR(10) DEFAULT NULL COMMENT '打开方式',
  `parent_id` CHAR(19) DEFAULT NULL COMMENT '父类编号',
  `icon` CHAR(60) DEFAULT NULL COMMENT '图标',
  `sort` INT(11) DEFAULT NULL COMMENT '排序',
  `create_by` CHAR(19) DEFAULT NULL COMMENT '创建人',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_by` CHAR(19) DEFAULT NULL COMMENT '修改人',
  `update_time` DATETIME DEFAULT NULL COMMENT '修改时间',
  `remark` VARCHAR(255) DEFAULT NULL COMMENT '备注',
  `enable` CHAR(1) DEFAULT NULL COMMENT '是否开启',
  PRIMARY KEY (`power_id`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_power` */

INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1','系统管理','0','','',NULL,'0','layui-icon layui-icon-set-fill',1,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1284020948269268992','用户列表','2','sys:user:data','','','2','layui-icon-username',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1284022967767924736','用户保存','2','sys:user:add','','','2','layui-icon-username',1,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1302180351979814912','布局构建','1','generator:from:main','component/code/index.html','_iframe','442417411065516032','layui-icon-senior',1,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1304387665067507712','数据字典','1','sys:dictType:main','/system/dictType/main','_iframe','1','layui-icon layui-icon layui-icon layui-icon layui-icon-flag',4,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1304793451996381184','文件管理','1','sys:file:main','/system/file/main','_iframe','1','layui-icon layui-icon layui-icon-read',5,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1307562519451140096','模型管理','1','/process/model/main','/process/model/main','0','1307562196556840960','layui-icon-circle',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1308571483794046976','流程定义','1','process:defined:main','/process/defined/main','0','1307562196556840960','layui-icon-chart-screen',1,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310206853057085440','用户修改','2','sys:user:edit','','','2','layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310208636370288640','用户删除','2','sys:user:remove','','','2','layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310209696916832256','角色新增','2','sys:role:add','','','3','layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310209900478988288','角色删除','2','sys:role:remove','','','3','layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310210054728712192','角色修改','2','sys:role:edit','','','3','layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310211965188046848','角色授权','2','sys:role:power','','','3','layui-icon-vercode',1,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310226416867999744','权限列表','2','sys:power:data','','','4','layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310226976593674240','权限新增','2','sys:power:add','','','4','layui-icon-vercode',1,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310227130998587392','权限修改','2','sys:power:edit','','','4','layui-icon-vercode',2,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310227300935008256','权限删除','2','sys:power:remove','','','4','layui-icon-vercode',3,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310232350285627392','操作日志','2','sys:logging:operateLog','','','450300705362808832','layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310232462562951168','登录日志','2','sys:logging:loginLog','','','450300705362808832','layui-icon-vercode',1,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310238229588344832','配置列表','2','sys:config:data','','','1307299332784914432','layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310238417082122240','配置新增','2','sys:config:add','','','1307299332784914432','layui-icon-vercode',1,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310238574355939328','配置修改','2','sys:config:edit','','','1307299332784914432','layui-icon-vercode',2,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310238700705153024','配置删除','2','sys:config:remove','','','1307299332784914432','layui-icon-vercode',3,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310243862937075712','文件列表','2','sys:file:data','','','1304793451996381184','layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310244103824343040','文件新增','2','sys:file:add','','','1304793451996381184','layui-icon-vercode',1,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310244248884346880','文件删除','2','sys:file:remove','','','1304793451996381184','layui-icon-vercode',3,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310395250908332032','日志列表','2','sch:log:data','','','442651158935375872','layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310402491631796224','数据类型列表','2','sys:dictType:data','','','1304387665067507712','layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310402688881524736','数据类型新增','2','sys:dictType:add','','','1304387665067507712','layui-icon-vercode',1,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310402817776680960','数据类型修改','2','sys:dictType:edit','','','1304387665067507712','layui-icon-vercode',3,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310403004406431744','数据类型删除','2','sys:dictType:remove','','','1304387665067507712','layui-icon-vercode',3,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310404584291696640','数据字典视图','2','sys:dictData:main','','','1304387665067507712','layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310404705934901248','数据字典列表','2','sys:dictData:data','','','1304387665067507712','layui-icon-vercode',1,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310404831407505408','数据字典新增','2','sys:dictData:add','','','1304387665067507712','layui-icon-vercode',5,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310404999599095808','数据字典删除','2','sys:dictData:remove','','','1304387665067507712','layui-icon-vercode',6,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1310405161587310592','数据字典修改','2','sys:dictData:edit','','','1304387665067507712','layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1315584471046553600','部门管理','1','sys:dept:main','/system/dept/main','_iframe','1','layui-icon layui-icon layui-icon layui-icon-vercode',3,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1316558444790022144','部门新增','2','sys:dept:add','','','1315584471046553600','layui-icon layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1316558556102656000','部门修改','2','sys:dept:edit','','','1315584471046553600','layui-icon layui-icon-vercode',1,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1316558685442408448','部门删除','2','sys:dept:remove','','','1315584471046553600','layui-icon layui-icon-vercode',3,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1317555660455411712','部门列表','2','sys:dept:data','','','1315584471046553600','layui-icon layui-icon layui-icon layui-icon-vercode',2,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1318229908526202880','模型新增','2','pro:model:add','','','1307562519451140096','layui-icon layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1318230013262168064','模型修改','2','pro:model:edit','','','1307562519451140096','layui-icon layui-icon-vercode',1,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1318230265385975808','模型删除','2','pro:model:remove','','','1307562519451140096','layui-icon layui-icon-vercode',2,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1322085079861690368','用户管理','1','sys:user:main','/system/user/main','_iframe','1','layui-icon layui-icon layui-icon-rate',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1322085270392143872','用户列表','2','sys:user:data','','','1322085079861690368','layui-icon layui-icon-vercode',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1322085393021009920','用户新增','2','sys:user:add','','','1322085079861690368','layui-icon layui-icon-vercode',NULL,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1322085497798918144','用户修改','2','sys:user:edit','','','1322085079861690368','layui-icon layui-icon layui-icon-vercode',2,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1322085659766161408','用户删除','2','sys:user:remove','','','1322085079861690368','layui-icon layui-icon-rate',3,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1342351768268308480','单页列表','1','cms:singlepage:main','/cms/singlepage/main','_iframe','1','',NULL,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1342351768268308481','增加','2','cms:singlepage:add','','','1342351768268308480','',NULL,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1342351768268308482','修改','2','cms:singlepage:edit','','','1342351768268308480','',NULL,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('1342351768268308483','删除','2','cms:singlepage:remove','','','1342351768268308480','',NULL,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('2','用户管理','2','','','_iframe','1320969572051845120','layui-icon layui-icon layui-icon-username',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('3','角色管理','1','sys:role:main','/system/role/main','_iframe','1','layui-icon layui-icon-user',1,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('4','权限管理','1','sys:power:main','/system/power/main','_iframe','1','layui-icon layui-icon-vercode',2,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('442359447487123456','角色列表','2','sys:role:data','','','3','layui-icon layui-icon-rate',1,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('442417411065516032','开发工具','0','','','','0','layui-icon layui-icon layui-icon-senior',4,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('442418188639145984','代码生成','1','exp:template:main','/system/gen/tableList','_iframe','442417411065516032','layui-icon layui-icon layui-icon-template-1',NULL,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('442520236248403968','数据监控','1','/druid/index.html','/druid/index.html','_iframe','694203021537574912','layui-icon layui-icon  layui-icon-chart',8,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('450300705362808832','行为日志','1','sys:logging:main','/system/logging/main','_iframe','694203021537574912','layui-icon layui-icon layui-icon  layui-icon-chart',7,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('451002662209589248','工作空间','0','','','','0','layui-icon layui-icon-home',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('451003242072117248','项目总览','1','process:model:main','/console','_iframe','451002662209589248','layui-icon  layui-icon-component',0,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('474356363552755712','项目介绍','1','home','/console','_iframe','474356044148117504','layui-icon layui-icon-home',1,NULL,NULL,NULL,NULL,NULL,'0');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('694203021537574912','系统监控','0','','','','0','layui-icon  layui-icon-console',3,NULL,NULL,NULL,NULL,NULL,'1');
INSERT  INTO `sys_power`(`power_id`,`power_name`,`power_type`,`power_code`,`power_url`,`open_type`,`parent_id`,`icon`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`enable`) VALUES ('694203311615639552','接口文档','1','','/swagger-ui.html','_iframe','442417411065516032','layui-icon layui-icon layui-icon  layui-icon-chart',9,NULL,NULL,NULL,NULL,NULL,'1');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` CHAR(19) NOT NULL COMMENT '角色编号',
  `role_name` VARCHAR(255) DEFAULT NULL COMMENT '角色名称',
  `role_code` VARCHAR(255) DEFAULT NULL COMMENT '角色标识',
  `enable` CHAR(1) DEFAULT NULL COMMENT '是否启用',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `create_by` CHAR(19) DEFAULT NULL COMMENT '创建人',
  `update_time` DATETIME DEFAULT NULL COMMENT '修改时间',
  `update_by` CHAR(19) DEFAULT NULL COMMENT '修改人',
  `remark` VARCHAR(255) DEFAULT NULL COMMENT '备注',
  `details` VARCHAR(255) DEFAULT NULL COMMENT '详情',
  `sort` INT(255) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_role` */

INSERT  INTO `sys_role`(`role_id`,`role_name`,`role_code`,`enable`,`create_time`,`create_by`,`update_time`,`update_by`,`remark`,`details`,`sort`) VALUES ('1309851245195821056','超级管理员','admin','0',NULL,NULL,NULL,NULL,NULL,'超级管理员',1);
INSERT  INTO `sys_role`(`role_id`,`role_name`,`role_code`,`enable`,`create_time`,`create_by`,`update_time`,`update_by`,`remark`,`details`,`sort`) VALUES ('1313761100243664896','普通管理员','manager','0',NULL,NULL,NULL,NULL,NULL,'普通管理员',2);

/*Table structure for table `sys_role_power` */

DROP TABLE IF EXISTS `sys_role_power`;

CREATE TABLE `sys_role_power` (
  `id` CHAR(19) NOT NULL,
  `role_id` CHAR(19) DEFAULT NULL,
  `power_id` CHAR(19) DEFAULT NULL,
  `create_by` CHAR(19) DEFAULT NULL,
  `create_time` DATETIME DEFAULT NULL,
  `update_by` CHAR(19) DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `remark` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_role_power` */

INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161088','1309851245195821056','451002662209589248',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161089','1309851245195821056','451003242072117248',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161090','1309851245195821056','1',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161091','1309851245195821056','1342351768268308480',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161092','1309851245195821056','1342351768268308481',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161093','1309851245195821056','1342351768268308482',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161094','1309851245195821056','1342351768268308483',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161095','1309851245195821056','1322085079861690368',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161096','1309851245195821056','1322085393021009920',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161097','1309851245195821056','1322085270392143872',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161098','1309851245195821056','1322085497798918144',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161099','1309851245195821056','1322085659766161408',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161100','1309851245195821056','3',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161101','1309851245195821056','1310209696916832256',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161102','1309851245195821056','1310209900478988288',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161103','1309851245195821056','1310210054728712192',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161104','1309851245195821056','1310211965188046848',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161105','1309851245195821056','442359447487123456',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161106','1309851245195821056','4',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161107','1309851245195821056','1310226416867999744',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161108','1309851245195821056','1310226976593674240',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161109','1309851245195821056','1310227130998587392',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161110','1309851245195821056','1310227300935008256',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161111','1309851245195821056','1315584471046553600',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161112','1309851245195821056','1316558444790022144',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161113','1309851245195821056','1316558556102656000',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161114','1309851245195821056','1317555660455411712',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161115','1309851245195821056','1316558685442408448',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161116','1309851245195821056','1304387665067507712',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161117','1309851245195821056','1310402491631796224',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161118','1309851245195821056','1310404584291696640',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161119','1309851245195821056','1310405161587310592',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161120','1309851245195821056','1310402688881524736',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161121','1309851245195821056','1310404705934901248',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161122','1309851245195821056','1310402817776680960',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161123','1309851245195821056','1310403004406431744',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161124','1309851245195821056','1310404831407505408',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161125','1309851245195821056','1310404999599095808',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161126','1309851245195821056','1304793451996381184',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161127','1309851245195821056','1310243862937075712',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161128','1309851245195821056','1310244103824343040',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161129','1309851245195821056','1310244248884346880',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161130','1309851245195821056','694203021537574912',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161131','1309851245195821056','450300705362808832',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161132','1309851245195821056','1310232350285627392',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161133','1309851245195821056','1310232462562951168',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161134','1309851245195821056','442520236248403968',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161135','1309851245195821056','442417411065516032',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161136','1309851245195821056','442418188639145984',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161137','1309851245195821056','1302180351979814912',NULL,NULL,NULL,NULL,NULL);
INSERT  INTO `sys_role_power`(`id`,`role_id`,`power_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) VALUES ('1351414258323161138','1309851245195821056','694203311615639552',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` CHAR(19) NOT NULL COMMENT '编号',
  `username` CHAR(20) DEFAULT NULL COMMENT '账户',
  `password` CHAR(60) DEFAULT NULL COMMENT '密码',
  `salt` CHAR(10) DEFAULT NULL COMMENT '姓名',
  `status` CHAR(1) DEFAULT NULL COMMENT '状态',
  `real_name` CHAR(8) DEFAULT NULL COMMENT '姓名',
  `email` CHAR(20) DEFAULT NULL COMMENT '邮箱',
  `avatar` VARCHAR(30) DEFAULT NULL COMMENT '头像',
  `sex` CHAR(1) DEFAULT NULL COMMENT '性别',
  `phone` CHAR(11) DEFAULT NULL COMMENT '电话',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `create_by` CHAR(1) DEFAULT NULL COMMENT '创建人',
  `update_time` DATETIME DEFAULT NULL COMMENT '修改时间',
  `update_by` CHAR(1) DEFAULT NULL COMMENT '修改人',
  `remark` VARCHAR(255) DEFAULT NULL COMMENT '备注',
  `enable` CHAR(1) DEFAULT NULL COMMENT '是否启用',
  `login` CHAR(1) DEFAULT NULL COMMENT '是否登录',
  `dept_id` CHAR(19) DEFAULT NULL COMMENT '部门编号',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_user` */

INSERT  INTO `sys_user`(`user_id`,`username`,`password`,`salt`,`status`,`real_name`,`email`,`avatar`,`sex`,`phone`,`create_time`,`create_by`,`update_time`,`update_by`,`remark`,`enable`,`login`,`dept_id`) VALUES ('1309861917694623744','admin','$2a$10$6T.NGloFO.mD/QOAUelMTOcjAH8N49h34TsXduDVlnNMrASIGBNz6',NULL,NULL,'刘XX','lwbldy@163.com',NULL,'0','11111111111','2020-09-26 22:26:32',NULL,NULL,NULL,'被岁月镂空，亦受其雕琢','1',NULL,'1');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` CHAR(19) NOT NULL COMMENT '标识',
  `user_id` CHAR(19) DEFAULT NULL COMMENT '用户编号',
  `role_id` CHAR(19) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_user_role` */

INSERT  INTO `sys_user_role`(`id`,`user_id`,`role_id`) VALUES ('1347737364310523904','1309861917694623744','1309851245195821056');
