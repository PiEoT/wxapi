/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : eb123

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-07-10 09:43:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ebcms5_app
-- ----------------------------
DROP TABLE IF EXISTS `ebcms5_app`;
CREATE TABLE `ebcms5_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `app_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '应用ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `version` varchar(255) NOT NULL DEFAULT '' COMMENT '版本',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='已经安装的APP表';

-- ----------------------------
-- Records of ebcms5_app
-- ----------------------------
INSERT INTO `ebcms5_app` VALUES ('1', '1', '核心', 'ebcms', '1.7.0', '1479890844', '1475398105', '1');

-- ----------------------------
-- Table structure for ebcms5_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `ebcms5_auth_access`;
CREATE TABLE `ebcms5_auth_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Records of ebcms5_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for ebcms5_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `ebcms5_auth_group`;
CREATE TABLE `ebcms5_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT '分组',
  `title` char(100) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text COMMENT '规则',
  `c_rules` text COMMENT '栏目权限规则',
  `menus` text COMMENT '菜单权限',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of ebcms5_auth_group
-- ----------------------------
INSERT INTO `ebcms5_auth_group` VALUES ('1', '系统', '管理员', '', '1', '', '', '', '5');
INSERT INTO `ebcms5_auth_group` VALUES ('2', '系统', '工程师', '', '1', '', '', '', '4');
INSERT INTO `ebcms5_auth_group` VALUES ('3', '系统', '编辑', '', '1', '', '', '', '3');
INSERT INTO `ebcms5_auth_group` VALUES ('4', '系统', '客服', '', '1', '', '', '', '2');

-- ----------------------------
-- Table structure for ebcms5_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `ebcms5_auth_rule`;
CREATE TABLE `ebcms5_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '操作说明',
  `name` char(80) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `sort` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `app` varchar(255) NOT NULL DEFAULT '' COMMENT '应用',
  `opstr` varchar(255) NOT NULL DEFAULT '' COMMENT '操作说明',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6595 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of ebcms5_auth_rule
-- ----------------------------
INSERT INTO `ebcms5_auth_rule` VALUES ('1', '0', '后台', 'ebcms_api_index', '1', '', '10', 'ebcms', '后台');
INSERT INTO `ebcms5_auth_rule` VALUES ('2', '1', '配置管理', 'ebcms_config_index', '1', '', '0', 'ebcms', '配置管理');
INSERT INTO `ebcms5_auth_rule` VALUES ('3', '2', '设置', 'ebcms_config_setting', '1', '', '0', 'ebcms', '系统设置');
INSERT INTO `ebcms5_auth_rule` VALUES ('34', '1', '扩展管理', 'ebcms_extend_index', '1', '', '0', 'ebcms', '扩展管理');
INSERT INTO `ebcms5_auth_rule` VALUES ('35', '34', '添加', 'ebcms_extend_add', '1', '', '0', 'ebcms', '添加扩展');
INSERT INTO `ebcms5_auth_rule` VALUES ('36', '34', '修改', 'ebcms_extend_edit', '1', '', '0', 'ebcms', '修改扩展');
INSERT INTO `ebcms5_auth_rule` VALUES ('37', '34', '删除', 'ebcms_extend_delete', '1', '', '0', 'ebcms', '删除扩展');
INSERT INTO `ebcms5_auth_rule` VALUES ('40', '34', '排序', 'ebcms_extend_resort', '1', '', '0', 'ebcms', '排序扩展');
INSERT INTO `ebcms5_auth_rule` VALUES ('41', '1', '扩展字段管理', 'ebcms_extendfield_index', '1', '', '0', 'ebcms', '扩展字段管理');
INSERT INTO `ebcms5_auth_rule` VALUES ('42', '41', '添加', 'ebcms_extendfield_add', '1', '', '0', 'ebcms', '添加扩展字段');
INSERT INTO `ebcms5_auth_rule` VALUES ('43', '41', '编辑', 'ebcms_extendfield_edit', '1', '', '0', 'ebcms', '修改扩展字段');
INSERT INTO `ebcms5_auth_rule` VALUES ('44', '41', '删除', 'ebcms_extendfield_delete', '1', '', '0', 'ebcms', '删除扩展字段');
INSERT INTO `ebcms5_auth_rule` VALUES ('45', '41', '变更状态', 'ebcms_extendfield_status', '1', '', '0', 'ebcms', '变更扩展字段状态');
INSERT INTO `ebcms5_auth_rule` VALUES ('47', '41', '排序', 'ebcms_extendfield_resort', '1', '', '0', 'ebcms', '排序扩展字段');
INSERT INTO `ebcms5_auth_rule` VALUES ('48', '1', '后台首页', 'ebcms_index_index', '1', '', '0', 'ebcms', '后台首页');
INSERT INTO `ebcms5_auth_rule` VALUES ('49', '48', '主页', 'ebcms_index_main', '1', '', '0', 'ebcms', '主页');
INSERT INTO `ebcms5_auth_rule` VALUES ('50', '48', '删除缓存', 'ebcms_index_runtime', '1', '', '0', 'ebcms', '删除缓存');
INSERT INTO `ebcms5_auth_rule` VALUES ('51', '48', '修改自己的密码', 'ebcms_index_password', '1', '', '0', 'ebcms', '修改自己的密码');
INSERT INTO `ebcms5_auth_rule` VALUES ('52', '48', '附件上传', 'ebcms_index_upload', '1', '', '0', 'ebcms', '附件上传');
INSERT INTO `ebcms5_auth_rule` VALUES ('53', '48', '编辑器附件上传', 'ebcms_index_ueditor', '1', '', '0', 'ebcms', '编辑器附件上传');
INSERT INTO `ebcms5_auth_rule` VALUES ('58', '1', '角色管理', 'ebcms_group_index', '1', '', '0', 'ebcms', '角色管理');
INSERT INTO `ebcms5_auth_rule` VALUES ('59', '58', '添加', 'ebcms_group_add', '1', '', '0', 'ebcms', '添加角色');
INSERT INTO `ebcms5_auth_rule` VALUES ('60', '58', '编辑', 'ebcms_group_edit', '1', '', '0', 'ebcms', '修改角色');
INSERT INTO `ebcms5_auth_rule` VALUES ('61', '58', '删除', 'ebcms_group_delete', '1', '', '0', 'ebcms', '删除角色');
INSERT INTO `ebcms5_auth_rule` VALUES ('62', '58', '分配权限', 'ebcms_group_rule', '1', '', '0', 'ebcms', '对角色分配权限');
INSERT INTO `ebcms5_auth_rule` VALUES ('63', '58', '分配菜单', 'ebcms_group_menu', '1', '', '0', 'ebcms', '对角色分配菜单权限');
INSERT INTO `ebcms5_auth_rule` VALUES ('64', '58', '变更状态', 'ebcms_group_status', '1', '', '0', 'ebcms', '审核角色');
INSERT INTO `ebcms5_auth_rule` VALUES ('66', '58', '排序', 'ebcms_group_resort', '1', '', '0', 'ebcms', '对角色排序');
INSERT INTO `ebcms5_auth_rule` VALUES ('72', '1318', '分配角色', 'ebcms_manager_group', '1', '', '0', 'ebcms', '给后台账户分配角色');
INSERT INTO `ebcms5_auth_rule` VALUES ('77', '1', '操作日志管理', 'ebcms_oplog_index', '1', '', '0', 'ebcms', '操作日志管理');
INSERT INTO `ebcms5_auth_rule` VALUES ('78', '77', '删除', 'ebcms_oplog_delete', '1', '', '0', 'ebcms', '删除操作日志');
INSERT INTO `ebcms5_auth_rule` VALUES ('79', '77', '查看详情', 'ebcms_oplog_show', '1', '', '0', 'ebcms', '查看操作日志');
INSERT INTO `ebcms5_auth_rule` VALUES ('862', '1', '导航管理', 'ebcms_nav_index', '1', '', '0', 'ebcms', '导航管理');
INSERT INTO `ebcms5_auth_rule` VALUES ('863', '862', '添加', 'ebcms_nav_add', '1', '', '0', 'ebcms', '添加导航');
INSERT INTO `ebcms5_auth_rule` VALUES ('864', '862', '编辑', 'ebcms_nav_edit', '1', '', '0', 'ebcms', '编辑导航');
INSERT INTO `ebcms5_auth_rule` VALUES ('865', '862', '审核', 'ebcms_nav_status', '1', '', '0', 'ebcms', '审核导航');
INSERT INTO `ebcms5_auth_rule` VALUES ('867', '862', '删除', 'ebcms_nav_delete', '1', '', '0', 'ebcms', '删除导航');
INSERT INTO `ebcms5_auth_rule` VALUES ('1318', '1', '账户管理', 'ebcms_manager_index', '1', '', '3', 'ebcms', '账户管理');
INSERT INTO `ebcms5_auth_rule` VALUES ('1319', '1318', '查看信息', 'ebcms_manager_info', '1', '', '0', 'ebcms', '查看后台账户信息');
INSERT INTO `ebcms5_auth_rule` VALUES ('1320', '1318', '添加', 'ebcms_manager_add', '1', '', '0', 'ebcms', '添加后台账户');
INSERT INTO `ebcms5_auth_rule` VALUES ('1321', '1318', '编辑', 'ebcms_manager_edit', '1', '', '0', 'ebcms', '编辑后台账户');
INSERT INTO `ebcms5_auth_rule` VALUES ('1322', '1318', '删除', 'ebcms_manager_delete', '1', '', '0', 'ebcms', '删除后台账户');
INSERT INTO `ebcms5_auth_rule` VALUES ('1323', '1318', '重置密码', 'ebcms_manager_password', '1', '', '0', 'ebcms', '重置后台账户密码');
INSERT INTO `ebcms5_auth_rule` VALUES ('1324', '1318', '变更状态', 'ebcms_manager_status', '1', '', '0', 'ebcms', '变更后台账户状态');
INSERT INTO `ebcms5_auth_rule` VALUES ('3636', '48', '发邮件', 'ebcms_index_email', '1', '', '0', 'ebcms', '发邮件');
INSERT INTO `ebcms5_auth_rule` VALUES ('6365', '862', '排序', 'ebcms_nav_resort', '1', '', '0', 'ebcms', '导航排序');

-- ----------------------------
-- Table structure for ebcms5_config
-- ----------------------------
DROP TABLE IF EXISTS `ebcms5_config`;
CREATE TABLE `ebcms5_config` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT '分组',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `title` varchar(250) NOT NULL DEFAULT '' COMMENT '标题',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '配置项',
  `value` text COMMENT '配置值',
  `render` varchar(255) NOT NULL DEFAULT '' COMMENT '类型',
  `form` varchar(255) NOT NULL DEFAULT '' COMMENT '表单类型',
  `config` text COMMENT '类型配置',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许用户配置',
  `remark` text COMMENT '说明',
  `sort` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1420 DEFAULT CHARSET=utf8 COMMENT='核心配置表';

-- ----------------------------
-- Records of ebcms5_config
-- ----------------------------
INSERT INTO `ebcms5_config` VALUES ('5', '系统配置@base', '1', '操作权限认证', 'auth_type', '1', 'number', 'form_radio', '{\"disabled\":\"0\",\"readonly\":\"0\",\"values\":\"\\u5b9e\\u65f6\\u8ba4\\u8bc1|1\\r\\n\\u767b\\u5f55\\u8ba4\\u8bc1|2\"}', '1', '实时认证更安全，登陆认证更高效', '80');
INSERT INTO `ebcms5_config` VALUES ('10', '邮箱配置@email', '1', '邮箱密码', 'password', '', 'string', 'form_textbox', '', '1', '', '7');
INSERT INTO `ebcms5_config` VALUES ('11', '系统配置@base', '1', '操作日志记录', 'oplog_on', '1', 'bool', 'form_bool', '', '1', '', '1');
INSERT INTO `ebcms5_config` VALUES ('12', '邮箱配置@email', '1', '邮箱账号', 'name', '', 'string', 'form_textbox', '', '1', '', '8');
INSERT INTO `ebcms5_config` VALUES ('13', '邮箱配置@email', '1', '发送者地址', 'from', '', 'string', 'form_textbox', '', '1', '', '5');
INSERT INTO `ebcms5_config` VALUES ('14', '邮箱配置@email', '1', '发送者名称', 'fromname', '易贝科技', 'string', 'form_textbox', '', '1', '', '6');
INSERT INTO `ebcms5_config` VALUES ('15', '邮箱配置@email', '1', '服务器', 'host', 'smtp.qq.com', 'string', 'form_textbox', '', '1', '', '60');
INSERT INTO `ebcms5_config` VALUES ('16', '邮箱配置@email', '1', '端口', 'port', '25', 'string', 'form_textbox', '', '1', '', '9');
INSERT INTO `ebcms5_config` VALUES ('17', '邮箱配置@email', '1', 'SMTP验证', 'smtpauth', '1', 'bool', 'form_bool', '', '1', '', '4');
INSERT INTO `ebcms5_config` VALUES ('18', '邮箱配置@email', '1', '允许HTML', 'html', '1', 'bool', 'form_bool', '', '1', '', '3');
INSERT INTO `ebcms5_config` VALUES ('19', '系统配置@base', '1', '备份目录', 'backup_path', '../backup', 'string', 'form_textbox', '', '1', '相对于入口文件 index.php 的目录，备份目录请设置为可读可写！', '1');
INSERT INTO `ebcms5_config` VALUES ('23', '编辑器@ueditor', '1', '编辑器配置', 'config', '{\r\n&quot;iframeCssUrl&quot;:&quot;/third/bootstrap/css/bootstrap.min.css&quot;,\r\n&quot;initialStyle&quot;:&quot;body{margin:15px;}&quot;\r\n}', 'json', 'form_multitextbox', '{\"required\":\"0\",\"disabled\":\"0\",\"readonly\":\"0\",\"height\":\"5\",\"width\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"prompt\":\"\"}', '1', '请参考百度编辑器的配置文档 ueditor.config.js', '50');
INSERT INTO `ebcms5_config` VALUES ('24', '编辑器@ueditor', '1', '编辑器上传配置', 'upload', '', 'json', 'form_multitextbox', '{\"required\":\"0\",\"disabled\":\"0\",\"readonly\":\"0\",\"height\":\"10\",\"width\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"prompt\":\"\"}', '1', '参考百度编辑器的配置文件：config.json', '9');
INSERT INTO `ebcms5_config` VALUES ('25', 'SEO配置@seo', '2', '网站名称', 'sitename', '易贝内容管理系统', 'string', 'form_textbox', '', '1', '定义浏览器顶部标签显示的文字。对SEO友好。\r\n首页：网站名称 + 网站标题\r\n其他页面：页面标题 + 网站名称', '90');
INSERT INTO `ebcms5_config` VALUES ('26', 'SEO配置@seo', '2', '网站标题', 'title', '易贝内容管理系统|免费的内容管理系统|EBCMS|phpcms', 'string', 'form_textbox', '{\"required\":\"0\",\"readonly\":\"0\",\"disabled\":\"0\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"prompt\":\"\"}', '1', '定义浏览器顶部标签显示的文字。对SEO友好。\r\n首页：网站名称 + 网站标题\r\n其他页面：页面标题 + 网站名称', '8');
INSERT INTO `ebcms5_config` VALUES ('27', 'SEO配置@seo', '2', '关键字', 'keywords', '易贝内容管理系统 内容管理系统 cms ebcms 开源cms', 'string', 'form_textbox', '', '1', '用空格或英文的逗号 , 分割。', '7');
INSERT INTO `ebcms5_config` VALUES ('28', 'SEO配置@seo', '2', '网站简介', 'description', '易贝内容管理系统是一套自由的功能灵活的开源的内容管理系统。', 'string', 'form_multitextbox', '', '1', '', '6');
INSERT INTO `ebcms5_config` VALUES ('1199', '基本配置@site', '2', '关闭网站', 'closed', '0', 'bool', 'form_bool', null, '1', '', '100');
INSERT INTO `ebcms5_config` VALUES ('1200', '基本配置@site', '2', '关闭原因', 'closed_reason', '系统维护中。。。', 'string', 'form_textbox', null, '1', '', '9');
INSERT INTO `ebcms5_config` VALUES ('1203', '验证码@captcha', '2', '加密密钥', 'seKey', 'http://www.ebcms.com', 'string', 'form_textbox', null, '0', '', '0');
INSERT INTO `ebcms5_config` VALUES ('1204', '验证码@captcha', '2', '字符', 'codeSet', '2345678abcdefhijkmnpqrstuvwxyzABCDEFGHJKLMNPQRTUVWXY', 'string', 'form_textbox', null, '1', '2345678abcdefhijkmnpqrstuvwxyzABCDEFGHJKLMNPQRTUVWXY', '28');
INSERT INTO `ebcms5_config` VALUES ('1205', '验证码@captcha', '2', '有效期', 'expire', '18000', 'number', 'form_numberbox', null, '0', '', '6');
INSERT INTO `ebcms5_config` VALUES ('1206', '验证码@captcha', '2', '是否使用中文', 'useZh', '0', 'bool', 'form_bool', null, '1', '', '26');
INSERT INTO `ebcms5_config` VALUES ('1207', '验证码@captcha', '2', '中文字符', 'zhSet', '们以我到他会作时要动国产的一是工就年阶义发成部民可出能方进在了不和有大这主中人上为来分生对于学下级地个用同行面说种过命度革而多子后自社加小机也经力线本电高量长党得实家定深法表着水理化争现所二起政三好十战无农使性前等反体合斗路图把结第里正新开论之物从当两些还天资事队批点育重其思与间内去因件日利相由压员气业代全组数果期导平各基或月毛然如应形想制心样干都向变关问比展那它最及外没看治提五解系林者米群头意只明四道马认次文通但条较克又公孔领军流入接席位情运器并飞原油放立题质指建区验活众很教决特此常石强极土少已根共直团统式转别造切九你取西持总料连任志观调七么山程百报更见必真保热委手改管处己将修支识病象几先老光专什六型具示复安带每东增则完风回南广劳轮科北打积车计给节做务被整联步类集号列温装即毫知轴研单色坚据速防史拉世设达尔场织历花受求传口断况采精金界品判参层止边清至万确究书术状厂须离再目海交权且儿青才证低越际八试规斯近注办布门铁需走议县兵固除般引齿千胜细影济白格效置推空配刀叶率述今选养德话查差半敌始片施响收华觉备名红续均药标记难存测士身紧液派准斤角降维板许破述技消底床田势端感往神便贺村构照容非搞亚磨族火段算适讲按值美态黄易彪服早班麦削信排台声该击素张密害侯草何树肥继右属市严径螺检左页抗苏显苦英快称坏移约巴材省黑武培著河帝仅针怎植京助升王眼她抓含苗副杂普谈围食射源例致酸旧却充足短划剂宣环落首尺波承粉践府鱼随考刻靠够满夫失包住促枝局菌杆周护岩师举曲春元超负砂封换太模贫减阳扬江析亩木言球朝医校古呢稻宋听唯输滑站另卫字鼓刚写刘微略范供阿块某功套友限项余倒卷创律雨让骨远帮初皮播优占死毒圈伟季训控激找叫云互跟裂粮粒母练塞钢顶策双留误础吸阻故寸盾晚丝女散焊功株亲院冷彻弹错散商视艺灭版烈零室轻血倍缺厘泵察绝富城冲喷壤简否柱李望盘磁雄似困巩益洲脱投送奴侧润盖挥距触星松送获兴独官混纪依未突架宽冬章湿偏纹吃执阀矿寨责熟稳夺硬价努翻奇甲预职评读背协损棉侵灰虽矛厚罗泥辟告卵箱掌氧恩爱停曾溶营终纲孟钱待尽俄缩沙退陈讨奋械载胞幼哪剥迫旋征槽倒握担仍呀鲜吧卡粗介钻逐弱脚怕盐末阴丰雾冠丙街莱贝辐肠付吉渗瑞惊顿挤秒悬姆烂森糖圣凹陶词迟蚕亿矩康遵牧遭幅园腔订香肉弟屋敏恢忘编印蜂急拿扩伤飞露核缘游振操央伍域甚迅辉异序免纸夜乡久隶缸夹念兰映沟乙吗儒杀汽磷艰晶插埃燃欢铁补咱芽永瓦倾阵碳演威附牙芽永瓦斜灌欧献顺猪洋腐请透司危括脉宜笑若尾束壮暴企菜穗楚汉愈绿拖牛份染既秋遍锻玉夏疗尖殖井费州访吹荣铜沿替滚客召旱悟刺脑措贯藏敢令隙炉壳硫煤迎铸粘探临薄旬善福纵择礼愿伏残雷延烟句纯渐耕跑泽慢栽鲁赤繁境潮横掉锥希池败船假亮谓托伙哲怀割摆贡呈劲财仪沉炼麻罪祖息车穿货销齐鼠抽画饲龙库守筑房歌寒喜哥洗蚀废纳腹乎录镜妇恶脂庄擦险赞钟摇典柄辩竹谷卖乱虚桥奥伯赶垂途额壁网截野遗静谋弄挂课镇妄盛耐援扎虑键归符庆聚绕摩忙舞遇索顾胶羊湖钉仁音迹碎伸灯避泛亡答勇频皇柳哈揭甘诺概宪浓岛袭谁洪谢炮浇斑讯懂灵蛋闭孩释乳巨徒私银伊景坦累匀霉杜乐勒隔弯绩招绍胡呼痛峰零柴簧午跳居尚丁秦稍追梁折耗碱殊岗挖氏刃剧堆赫荷胸衡勤膜篇登驻案刊秧缓凸役剪川雪链渔啦脸户洛孢勃盟买杨宗焦赛旗滤硅炭股坐蒸凝竟陷枪黎救冒暗洞犯筒您宋弧爆谬涂味津臂障褐陆啊健尊豆拔莫抵桑坡缝警挑污冰柬嘴啥饭塑寄赵喊垫丹渡耳刨虎笔稀昆浪萨茶滴浅拥穴覆伦娘吨浸袖珠雌妈紫戏塔锤震岁貌洁剖牢锋疑霸闪埔猛诉刷狠忽灾闹乔唐漏闻沈熔氯荒茎男凡抢像浆旁玻亦忠唱蒙予纷捕锁尤乘乌智淡允叛畜俘摸锈扫毕璃宝芯爷鉴秘净蒋钙肩腾枯抛轨堂拌爸循诱祝励肯酒绳穷塘燥泡袋朗喂铝软渠颗惯贸粪综墙趋彼届墨碍启逆卸航衣孙龄岭骗休借', 'string', 'form_multitextbox', null, '1', '', '24');
INSERT INTO `ebcms5_config` VALUES ('1208', '验证码@captcha', '2', '背景混淆', 'useImgBg', '1', 'bool', 'form_bool', null, '1', '', '18');
INSERT INTO `ebcms5_config` VALUES ('1209', '验证码@captcha', '2', '字体大小', 'fontSize', '25', 'number', 'form_numberbox', null, '0', '', '16');
INSERT INTO `ebcms5_config` VALUES ('1210', '验证码@captcha', '2', '曲线混淆', 'useCurve', '1', 'bool', 'form_bool', null, '1', '', '22');
INSERT INTO `ebcms5_config` VALUES ('1211', '验证码@captcha', '2', '杂点混淆', 'useNoise', '1', 'bool', 'form_bool', null, '1', '', '20');
INSERT INTO `ebcms5_config` VALUES ('1212', '验证码@captcha', '2', '图片高', 'imageH', '0', 'number', 'form_numberbox', null, '0', '', '14');
INSERT INTO `ebcms5_config` VALUES ('1213', '验证码@captcha', '2', '图片宽', 'imageW', '0', 'number', 'form_numberbox', null, '0', '', '12');
INSERT INTO `ebcms5_config` VALUES ('1214', '验证码@captcha', '2', '字符数', 'length', '4', 'number', 'form_numberbox', null, '1', '', '30');
INSERT INTO `ebcms5_config` VALUES ('1215', '验证码@captcha', '2', '字体', 'fontttf', '', 'string', 'form_textbox', null, '0', '', '10');
INSERT INTO `ebcms5_config` VALUES ('1216', '验证码@captcha', '2', '背景色', 'bg', '243\r\n251\r\n254', 'item', 'form_multitextbox', null, '0', 'rgb色  一行一个。\r\n243\r\n251\r\n254', '8');
INSERT INTO `ebcms5_config` VALUES ('1217', '验证码@captcha', '2', '验证重置', 'reset', '1', 'bool', 'form_bool', null, '0', '', '0');
INSERT INTO `ebcms5_config` VALUES ('1377', '路由配置@route', '2', '路由模式', 'model', '1', 'number', 'form_radio', '{\"values\":\"普通模式|0\\r\\n应用模式|1\"}', '1', '', '50');
INSERT INTO `ebcms5_config` VALUES ('1378', '路由配置@route', '2', '自定义路由', 'rules', '/|index/index/index\r\nuser_reg|user/auth/reg\r\nuser_login|user/auth/login', 'string', 'form_multitextbox', '{\"height\":\"15\",\"width\":\"\",\"prompt\":\"\"}', '1', '非专业人士，请不要随意定义，否则可能导致无法访问！\r\n用竖线分割 一行一个，例如：\r\nuser_reg|user/auth/reg\r\nuser_login|user/auth/login', '0');
INSERT INTO `ebcms5_config` VALUES ('1418', '基本配置@site', '2', '手机版', 'mobile', '0', 'bool', 'form_bool', null, '1', '开启手机版后，手机访问会自动定位到 当前模板主题对应的移动端模板 例如：default_mobile', '7');
INSERT INTO `ebcms5_config` VALUES ('1419', '基本配置@site', '2', '模板主题', 'theme', 'default', 'string', 'form_custom', '{\"html\":\"{php}\\r\\n\\t$path = ROOT_PATH . \'templates\' . DS;\\r\\n\\t$dirs = scandir($path);\\r\\n\\t$res = [];\\r\\n\\t$thumbs = [];\\r\\n\\tforeach($dirs as $k){\\r\\n\\t\\tif(!in_array($k,[\'.\',\'..\']) &amp;&amp; !preg_match(&quot;\\/[\\\\x7f-\\\\xff]\\/&quot;, $k) &amp;&amp; is_dir($path . $k)){\\r\\n\\t\\t\\tif(\'_mobile\' != substr($k,-7)){\\r\\n\\t\\t\\t\\t$res[] = $k;\\r\\n\\t\\t\\t\\t$thumb = $path . $k . DS . \'thumb.png\';\\r\\n\\t\\t\\t\\t$thumb = is_file($thumb)?$thumb:\'.\\/system\\/image\\/nopic.gif\';\\r\\n\\t\\t\\t\\t$img_info = getimagesize($thumb);\\r\\n\\t\\t\\t\\t$thumbs[$k] = \'data:\' . $img_info[\'mime\'] . \';base64,\' . base64_encode(file_get_contents($thumb));\\r\\n\\t\\t\\t}\\r\\n\\t\\t}\\r\\n\\t}\\r\\n{\\/php}\\r\\n&lt;div style=&quot;clear: both;overflow: hidden;&quot;&gt;\\r\\n{foreach name=\'res\' item=\'v\'}\\r\\n\\t&lt;div class=&quot;thumbnail&quot; onclick=&quot;$(this).css(\'border\', \'1px solid red\').siblings().css(\'border\', \'1px solid #ddd\');$(\'#{$field.unique}\').val(\'{$v}\');&quot; style=&quot;width:13em;float:left;cursor: pointer; margin-right:10px;{eq name=&quot;field.value&quot; value=\'$v\'}border:1px solid red;{\\/eq}&quot;&gt;\\r\\n\\t\\t&lt;img src=&quot;{$thumbs[$v]}&quot; alt=&quot;{$v}&quot; style=&quot;width: 100%;height: 10em;&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;caption&quot;&gt;\\r\\n\\t\\t\\t&lt;h4 class=&quot;text-center&quot;&gt;{$v}&lt;\\/h4&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t&lt;\\/div&gt;\\r\\n{\\/foreach}\\r\\n&lt;\\/div&gt;\\r\\n&lt;input type=&quot;hidden&quot; name=&quot;{$field.field}&quot; id=&quot;{$field.unique}&quot; value=&quot;{$field.value}&quot;&gt;\"}', '1', '模板位于templates目录下', '8');

-- ----------------------------
-- Table structure for ebcms5_configcate
-- ----------------------------
DROP TABLE IF EXISTS `ebcms5_configcate`;
CREATE TABLE `ebcms5_configcate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `name` varchar(255) NOT NULL DEFAULT 'Common' COMMENT '生效应用',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许用户配置',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `app` varchar(255) NOT NULL DEFAULT '' COMMENT '应用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='核心配置分类表';

-- ----------------------------
-- Records of ebcms5_configcate
-- ----------------------------
INSERT INTO `ebcms5_configcate` VALUES ('1', '系统配置', '系统配置', 'system', '', '1', '90', 'ebcms');
INSERT INTO `ebcms5_configcate` VALUES ('2', '应用配置', '前台配置', 'home', '', '1', '85', 'ebcms');

-- ----------------------------
-- Table structure for ebcms5_extend
-- ----------------------------
DROP TABLE IF EXISTS `ebcms5_extend`;
CREATE TABLE `ebcms5_extend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `app` varchar(255) DEFAULT '' COMMENT '应用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扩展表';

-- ----------------------------
-- Records of ebcms5_extend
-- ----------------------------

-- ----------------------------
-- Table structure for ebcms5_extendfield
-- ----------------------------
DROP TABLE IF EXISTS `ebcms5_extendfield`;
CREATE TABLE `ebcms5_extendfield` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `group` varchar(250) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(250) NOT NULL DEFAULT '' COMMENT '标题',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '键',
  `value` text COMMENT '默认值',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '表单类型',
  `config` text COMMENT '表单配置',
  `remark` text COMMENT '表单说明',
  `sort` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扩展字段表';

-- ----------------------------
-- Records of ebcms5_extendfield
-- ----------------------------

-- ----------------------------
-- Table structure for ebcms5_form
-- ----------------------------
DROP TABLE IF EXISTS `ebcms5_form`;
CREATE TABLE `ebcms5_form` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `html` text COMMENT '模板',
  `app` varchar(255) NOT NULL DEFAULT '' COMMENT '应用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3173 DEFAULT CHARSET=utf8 COMMENT='表单表';

-- ----------------------------
-- Records of ebcms5_form
-- ----------------------------
INSERT INTO `ebcms5_form` VALUES ('1', '表单配置', '单行文本', 'form_textbox', '', '100', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('2', '表单配置', '布尔选项', 'form_bool', '', '56', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('3', '表单配置', '隐藏域', 'form_hidden', '', '1', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('4', '表单配置', '百度编辑器', 'form_ueditor', '', '86', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('5', '表单配置', '数字框', 'form_numberbox', '', '91', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('6', '表单配置', '上传', 'form_upload', '', '69', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('9', '表单配置', '多文件上传', 'form_uploads', '', '62', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('13', '表单配置', '数据库', 'form_database', '', '45', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('14', '表单配置', '多行文本', 'form_multitextbox', '', '97', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('18', '账户管理', '添加角色', 'ebcms_group_add', '', '66', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('19', '账户管理', '修改角色', 'ebcms_group_edit', '', '56', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('20', '账户管理', '添加账户', 'ebcms_manager_add', '', '136', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('21', '账户管理', '编辑账户', 'ebcms_manager_edit', '', '75', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('22', '扩展管理', '添加扩展', 'ebcms_extend_add', '', '141', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('23', '扩展管理', '修改扩展', 'ebcms_extend_edit', '', '71', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('24', '扩展管理', '添加字段', 'ebcms_extendfield_add', '', '60', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('25', '扩展管理', '修改字段', 'ebcms_extendfield_edit', '', '1', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('26', '表单配置', '单选', 'form_radio', '', '72', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('27', '表单配置', '复选', 'form_checkbox', '', '71', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('32', '基本表单', '修改自己密码', 'ebcms_index_password', '', '90', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('33', '表单配置', '下拉选项', 'form_select', '', '44', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('411', '导航管理', '添加导航', 'ebcms_nav_add', '', '160', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('412', '导航管理', '编辑导航', 'ebcms_nav_edit', '', '0', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('1444', '基本表单', '发送邮件', 'ebcms_index_email', '', '110', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('1497', '表单配置', '自定义', 'form_custom', '', '0', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('2542', '账户管理', '分配权限', 'ebcms_group_rule', '', '0', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('2543', '账户管理', '菜单权限', 'ebcms_group_menu', '', '0', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('2544', '账户管理', '重置密码', 'ebcms_manager_password', '', '0', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('2545', '账户管理', '分配角色', 'ebcms_manager_group', '', '0', '', 'ebcms');
INSERT INTO `ebcms5_form` VALUES ('2546', '基本表单', '应用卸载', 'ebcms_app_uninstall', '', '1', '', 'ebcms');

-- ----------------------------
-- Table structure for ebcms5_formfield
-- ----------------------------
DROP TABLE IF EXISTS `ebcms5_formfield`;
CREATE TABLE `ebcms5_formfield` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `group` varchar(250) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(250) NOT NULL DEFAULT '' COMMENT '标题',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '键',
  `subtable` varchar(250) NOT NULL DEFAULT '' COMMENT '副表',
  `extfield` varchar(250) NOT NULL DEFAULT '' COMMENT '扩展字段',
  `defaultvaluetype` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '取值类型',
  `defaultvalue` text COMMENT '默认值',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '表单类型',
  `config` text COMMENT '表单配置',
  `remark` text COMMENT '表单说明',
  `sort` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22372 DEFAULT CHARSET=utf8 COMMENT='表单字段表';

-- ----------------------------
-- Records of ebcms5_formfield
-- ----------------------------
INSERT INTO `ebcms5_formfield` VALUES ('2', '1', '基本配置', '是否只读', 'readonly', '', 'config', '3', 'readonly', 'form_bool', 'null', '', '40');
INSERT INTO `ebcms5_formfield` VALUES ('3', '1', '基本配置', '是否失效', 'disabled', '', 'config', '3', 'disabled', 'form_bool', 'null', '', '38');
INSERT INTO `ebcms5_formfield` VALUES ('7', '1', '基本配置', '提示字符', 'prompt', '', 'config', '3', 'prompt', 'form_textbox', '{\"width\":\"\",\"prompt\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"required\":\"0\"}', '', '5');
INSERT INTO `ebcms5_formfield` VALUES ('8', '1', '基本配置', 'id', 'id', '', '', '1', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('9', '2', '基本配置', '是否失效', 'disabled', '', 'config', '3', 'disabled', 'form_bool', 'null', '', '50');
INSERT INTO `ebcms5_formfield` VALUES ('10', '2', '基本配置', '是否只读', 'readonly', '', 'config', '3', 'readonly', 'form_bool', 'null', '', '40');
INSERT INTO `ebcms5_formfield` VALUES ('11', '2', '基本配置', 'id', 'id', '', '', '1', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('12', '3', '基本配置', 'id', 'id', '', '', '1', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('13', '4', '基本配置', '高度', 'initialframeheight', '', 'config', '3', 'initialframeheight', 'form_numberbox', 'null', '', '50');
INSERT INTO `ebcms5_formfield` VALUES ('14', '4', '基本配置', '自动高度', 'autoheightenabled', '', 'config', '3', 'autoheightenabled', 'form_bool', 'null', '', '45');
INSERT INTO `ebcms5_formfield` VALUES ('15', '4', '基本配置', '最大字符数', 'maximumwords', '', 'config', '3', 'maximumwords', 'form_numberbox', '{\"required\":\"0\",\"editable\":\"1\",\"readonly\":\"0\",\"max\":\"\",\"min\":\"\",\"prompt\":\"\",\"disabled\":\"0\",\"width\":\"\",\"prefix\":\"\",\"suffix\":\"\",\"groupseparator\":\"\",\"decimalseparator\":\"\",\"precision\":\"\"}', '', '40');
INSERT INTO `ebcms5_formfield` VALUES ('16', '4', '基本配置', '开启字数统计', 'wordcount', '', 'config', '3', 'wordcount', 'form_bool', 'null', '', '30');
INSERT INTO `ebcms5_formfield` VALUES ('17', '4', '基本配置', '显示元素路径', 'elementpathenabled', '', 'config', '3', 'elementpathenabled', 'form_bool', 'null', '', '20');
INSERT INTO `ebcms5_formfield` VALUES ('18', '4', '基本配置', 'id', 'id', '', '', '1', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('20', '5', '基本配置', '是否失效', 'disabled', '', 'config', '3', 'disabled', 'form_bool', 'null', '', '40');
INSERT INTO `ebcms5_formfield` VALUES ('21', '5', '基本配置', '是否只读', 'readonly', '', 'config', '3', 'readonly', 'form_bool', 'null', '', '38');
INSERT INTO `ebcms5_formfield` VALUES ('22', '5', '基本配置', '最大值', 'max', '', 'config', '3', 'max', 'form_numberbox', 'null', '', '30');
INSERT INTO `ebcms5_formfield` VALUES ('23', '5', '基本配置', '最小值', 'min', '', 'config', '3', 'min', 'form_numberbox', 'null', '', '25');
INSERT INTO `ebcms5_formfield` VALUES ('24', '5', '基本配置', '提示信息', 'prompt', '', 'config', '3', 'prompt', 'form_textbox', 'null', '', '15');
INSERT INTO `ebcms5_formfield` VALUES ('25', '5', '基本配置', 'id', 'id', '', '', '1', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('29', '6', '基本配置', '允许的类型', 'extensions', '', 'config', '3', 'extensions', 'form_textbox', 'null', '多个类型用‘,’分割，例如：jpg,png,gif,bmp', '40');
INSERT INTO `ebcms5_formfield` VALUES ('30', '6', '基本配置', '提示信息', 'prompt', '', 'config', '3', 'prompt', 'form_textbox', 'null', '', '20');
INSERT INTO `ebcms5_formfield` VALUES ('31', '6', '基本配置', 'id', 'id', '', '', '1', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('47', '9', '基本配置', '允许的类型', 'extensions', '', 'config', '3', 'extensions', 'form_textbox', 'null', '多个类型用‘,’分割，例如：jpg,png,gif,bmp', '40');
INSERT INTO `ebcms5_formfield` VALUES ('48', '9', '基本配置', '提示字符', 'prompt', '', 'config', '3', 'prompt', 'form_textbox', 'null', '', '20');
INSERT INTO `ebcms5_formfield` VALUES ('49', '9', '基本配置', 'id', 'id', '', '', '1', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('66', '13', '基本配置', '模型名称', 'model', '', 'config', '3', 'model', 'form_textbox', '{\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\"}', '对应的后台的模型名称', '50');
INSERT INTO `ebcms5_formfield` VALUES ('67', '13', '基本配置', '是否可编辑', 'editable', '', 'config', '3', 'editable', 'form_bool', 'null', '可编辑是指下拉选项只是作为辅助选项，实际上还是一个文本框', '48');
INSERT INTO `ebcms5_formfield` VALUES ('69', '13', '基本配置', '是否失效', 'disabled', '', 'config', '3', 'disabled', 'form_bool', 'null', '', '43');
INSERT INTO `ebcms5_formfield` VALUES ('70', '13', '基本配置', '是否只读', 'readonly', '', 'config', '3', 'readonly', 'form_bool', 'null', '', '42');
INSERT INTO `ebcms5_formfield` VALUES ('71', '13', '基本配置', '根选项', 'rootitem', '', 'config', '3', 'rootitem', 'form_bool', 'null', '根选项开启后 所有条目都会在根选项之下，通常用于选择父级 默认0', '40');
INSERT INTO `ebcms5_formfield` VALUES ('72', '13', '其他配置', '查询条件', 'queryparams', '', 'config', '3', 'queryparams', 'form_multitextbox', 'null', '格式：字段|eq|value\r\n字段|eq|(I)value 添加(I)表示的是提交变量\r\n字段|eq|(@)value 添加(@)表示的是变量', '40');
INSERT INTO `ebcms5_formfield` VALUES ('73', '13', '基本配置', '树型化', 'tree', '', 'config', '3', 'tree', 'form_bool', 'null', '', '30');
INSERT INTO `ebcms5_formfield` VALUES ('74', '13', '其他配置', '递归字段', 'pid', '', 'config', '3', 'pid', 'form_textbox', 'null', '通常请不要修改 默认pid', '30');
INSERT INTO `ebcms5_formfield` VALUES ('75', '13', '基本配置', '提示字符', 'prompt', '', 'config', '3', 'prompt', 'form_textbox', 'null', '', '10');
INSERT INTO `ebcms5_formfield` VALUES ('76', '13', '其他配置', '显示字段', 'titlefield', '', 'config', '3', 'titlefield', 'form_textbox', 'null', '默认为text', '9');
INSERT INTO `ebcms5_formfield` VALUES ('77', '13', '其他配置', '值字段', 'valuefield', '', 'config', '3', 'valuefield', 'form_textbox', 'null', '默认为id', '6');
INSERT INTO `ebcms5_formfield` VALUES ('78', '13', '基本配置', 'id', 'id', '', '', '1', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('79', '13', '其他配置', '宽度', 'width', '', 'config', '3', 'width', 'form_numberbox', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('81', '14', '基本配置', '是否失效', 'disabled', '', 'config', '3', 'disabled', 'form_bool', 'null', '', '45');
INSERT INTO `ebcms5_formfield` VALUES ('82', '14', '基本配置', '是否只读', 'readonly', '', 'config', '3', 'readonly', 'form_bool', 'null', '', '40');
INSERT INTO `ebcms5_formfield` VALUES ('83', '14', '基本配置', '高度', 'height', '', 'config', '3', 'height', 'form_numberbox', 'null', '这里是指行数。默认5', '31');
INSERT INTO `ebcms5_formfield` VALUES ('84', '14', '基本配置', '宽度', 'width', '', 'config', '3', 'width', 'form_numberbox', 'null', '不填写表示 100% ', '30');
INSERT INTO `ebcms5_formfield` VALUES ('87', '14', '基本配置', '提示字符', 'prompt', '', 'config', '3', 'prompt', 'form_textbox', '{\"width\":\"\",\"prompt\":\"\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"required\":\"0\"}', '', '15');
INSERT INTO `ebcms5_formfield` VALUES ('88', '14', '基本配置', 'id', 'id', '', '', '1', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('104', '18', '基本信息', '分组', 'group', '', '', '1', 'group', 'form_textbox', '{\"disabled\":\"0\",\"values\":\"系统|系统\\r\\n普通|普通\"}', '', '99');
INSERT INTO `ebcms5_formfield` VALUES ('106', '18', '基本信息', '名称', 'title', '', '', '0', '', 'form_textbox', 'null', '', '91');
INSERT INTO `ebcms5_formfield` VALUES ('107', '18', '基本信息', '备注', 'remark', '', '', '0', '', 'form_multitextbox', 'null', '', '10');
INSERT INTO `ebcms5_formfield` VALUES ('109', '19', '基本信息', '分组', 'group', '', '', '3', 'group', 'form_textbox', '{\"disabled\":\"0\",\"values\":\"系统|系统\\r\\n普通|普通\"}', '', '99');
INSERT INTO `ebcms5_formfield` VALUES ('110', '19', '基本信息', '名称', 'title', '', '', '3', 'title', 'form_textbox', 'null', '', '82');
INSERT INTO `ebcms5_formfield` VALUES ('111', '19', '基本信息', '备注', 'remark', '', '', '3', 'remark', 'form_multitextbox', 'null', '', '20');
INSERT INTO `ebcms5_formfield` VALUES ('112', '19', '基本信息', 'id', 'id', '', '', '1', 'id', 'form_hidden', 'null', '', '10');
INSERT INTO `ebcms5_formfield` VALUES ('113', '20', '基本信息', '邮箱', 'email', '', '', '0', '', 'form_textbox', 'null', '', '99');
INSERT INTO `ebcms5_formfield` VALUES ('114', '20', '基本信息', '昵称', 'nickname', '', '', '0', '', 'form_textbox', '{\"width\":\"\",\"prompt\":\"2-6个字符\",\"maxlength\":\"6\",\"minlength\":\"2\",\"validtype\":\"\",\"required\":\"1\",\"editable\":\"1\",\"disabled\":\"0\",\"readonly\":\"0\"}', '', '50');
INSERT INTO `ebcms5_formfield` VALUES ('115', '20', '基本信息', '密码', 'password', '', '', '0', '', 'form_textbox', '{\"width\":\"\",\"prompt\":\"5-10个字符\",\"maxlength\":\"10\",\"minlength\":\"5\",\"validtype\":\"\",\"required\":\"1\",\"editable\":\"1\",\"disabled\":\"0\",\"readonly\":\"0\"}', '', '40');
INSERT INTO `ebcms5_formfield` VALUES ('116', '20', '基本信息', '头像', 'avatar', '', '', '0', '', 'form_upload', '{\"extensions\":\"\",\"path\":\"\\/manager\\/avatar\",\"prompt\":\"\"}', '', '30');
INSERT INTO `ebcms5_formfield` VALUES ('119', '21', '基本信息', '邮箱', 'email', '', '', '3', 'email', 'form_textbox', 'null', '', '90');
INSERT INTO `ebcms5_formfield` VALUES ('120', '21', '基本信息', '昵称', 'nickname', '', '', '3', 'nickname', 'form_textbox', '{\"width\":\"\",\"prompt\":\"\",\"maxlength\":\"6\",\"minlength\":\"2\",\"validtype\":\"\",\"required\":\"1\",\"editable\":\"1\",\"disabled\":\"0\",\"readonly\":\"0\"}', '', '40');
INSERT INTO `ebcms5_formfield` VALUES ('121', '21', '基本信息', '头像', 'avatar', '', '', '3', 'avatar', 'form_upload', '{\"disabled\":\"0\",\"readonly\":\"0\",\"extensions\":\"\",\"path\":\"\\/manager\\/avatar\",\"prompt\":\"\"}', '', '30');
INSERT INTO `ebcms5_formfield` VALUES ('123', '21', '基本信息', 'id', 'id', '', '', '1', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('124', '22', '基本信息', '分组', 'group', '', '', '1', 'group', 'form_textbox', 'null', '', '99');
INSERT INTO `ebcms5_formfield` VALUES ('125', '22', '基本信息', '标题', 'title', '', '', '0', '', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '96');
INSERT INTO `ebcms5_formfield` VALUES ('126', '22', '基本信息', '说明', 'remark', '', '', '0', '', 'form_multitextbox', 'null', '', '75');
INSERT INTO `ebcms5_formfield` VALUES ('127', '23', '基本信息', '分组', 'group', '', '', '3', 'group', 'form_textbox', 'null', '', '99');
INSERT INTO `ebcms5_formfield` VALUES ('128', '23', '基本信息', '标题', 'title', '', '', '3', 'title', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '97');
INSERT INTO `ebcms5_formfield` VALUES ('129', '23', '基本信息', '说明', 'remark', '', '', '3', 'remark', 'form_multitextbox', 'null', '', '46');
INSERT INTO `ebcms5_formfield` VALUES ('130', '23', '基本信息', 'id', 'id', '', '', '1', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('131', '24', '基本信息', '分组', 'group', '', '', '1', 'group', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '99');
INSERT INTO `ebcms5_formfield` VALUES ('132', '24', '基本信息', '标题', 'title', '', '', '0', '', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"10\",\"minlength\":\"1\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '96');
INSERT INTO `ebcms5_formfield` VALUES ('133', '24', '基本信息', '字段', 'name', '', '', '0', '', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"20\",\"minlength\":\"1\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '89');
INSERT INTO `ebcms5_formfield` VALUES ('134', '24', '基本信息', '表单类型', 'type', '', '', '0', '', 'form_database', '{\"model\":\"ebcms\\/form\",\"editable\":\"0\",\"disabled\":\"0\",\"readonly\":\"0\",\"rootitem\":\"0\",\"tree\":\"0\",\"prompt\":\"\",\"queryparams\":\"group|eq|表单配置\",\"pid\":\"\",\"titlefield\":\"\",\"valuefield\":\"name\",\"width\":\"\"}', '', '80');
INSERT INTO `ebcms5_formfield` VALUES ('135', '24', '基本信息', '默认值', 'value', '', '', '0', '', 'form_multitextbox', 'null', '', '78');
INSERT INTO `ebcms5_formfield` VALUES ('136', '24', '基本信息', '说明', 'remark', '', '', '0', '', 'form_multitextbox', 'null', '', '60');
INSERT INTO `ebcms5_formfield` VALUES ('137', '24', '基本信息', '分类', 'category_id', '', '', '1', 'category_id', 'form_hidden', 'null', '', '2');
INSERT INTO `ebcms5_formfield` VALUES ('138', '25', '基本信息', '分组', 'group', '', '', '3', 'group', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '99');
INSERT INTO `ebcms5_formfield` VALUES ('139', '25', '基本信息', '标题', 'title', '', '', '3', 'title', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '95');
INSERT INTO `ebcms5_formfield` VALUES ('140', '25', '基本信息', '字段', 'name', '', '', '3', 'name', 'form_textbox', '{\"required\":\"1\",\"editable\":\"1\",\"maxlength\":\"\",\"minlength\":\"\",\"validtype\":\"\",\"readonly\":\"0\",\"disabled\":\"0\",\"prompt\":\"\",\"width\":\"\"}', '', '94');
INSERT INTO `ebcms5_formfield` VALUES ('141', '25', '基本信息', '表单类型', 'type', '', '', '3', 'type', 'form_database', '{\"model\":\"ebcms\\/form\",\"editable\":\"0\",\"disabled\":\"0\",\"readonly\":\"0\",\"rootitem\":\"0\",\"tree\":\"0\",\"prompt\":\"\",\"queryparams\":\"group|eq|表单配置\",\"pid\":\"\",\"titlefield\":\"\",\"valuefield\":\"name\",\"width\":\"\"}', '更改表单类型后 请更改上一行字段名称 否则可能报错', '93');
INSERT INTO `ebcms5_formfield` VALUES ('142', '25', '基本信息', '默认值', 'value', '', '', '3', 'value', 'form_multitextbox', 'null', '', '87');
INSERT INTO `ebcms5_formfield` VALUES ('143', '25', '基本信息', '说明', 'remark', '', '', '3', 'remark', 'form_multitextbox', 'null', '', '67');
INSERT INTO `ebcms5_formfield` VALUES ('144', '25', '基本信息', 'id', 'id', '', '', '1', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('145', '26', '基本配置', '是否失效', 'disabled', '', 'config', '3', 'disabled', 'form_bool', 'null', '', '60');
INSERT INTO `ebcms5_formfield` VALUES ('146', '26', '基本配置', '是否只读', 'readonly', '', 'config', '3', 'readonly', 'form_bool', 'null', '', '55');
INSERT INTO `ebcms5_formfield` VALUES ('147', '26', '基本配置', '可选值', 'values', '', 'config', '3', 'values', 'form_multitextbox', 'null', '一样一个，用|分割键值对，例如：\r\n红色|red\r\n绿色|green\r\n黑色|black\r\n灰色|gray', '50');
INSERT INTO `ebcms5_formfield` VALUES ('148', '26', '基本配置', 'id', 'id', '', '', '1', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('149', '27', '基本信息', '是否失效', 'disabled', '', 'config', '3', 'disabled', 'form_bool', 'null', '', '99');
INSERT INTO `ebcms5_formfield` VALUES ('150', '27', '基本信息', '是否只读', 'readonly', '', 'config', '3', 'readonly', 'form_bool', 'null', '', '70');
INSERT INTO `ebcms5_formfield` VALUES ('151', '27', '基本信息', '可选值', 'values', '', 'config', '3', 'values', 'form_multitextbox', 'null', '一样一个，用|分割键值对，例如：\r\n红色|red\r\n绿色|green\r\n黑色|black\r\n灰色|gray', '50');
INSERT INTO `ebcms5_formfield` VALUES ('152', '27', '基本信息', 'id', 'id', '', '', '1', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('175', '32', '基本信息', '旧密码', 'oldpassword', '', '', '0', '', 'form_textbox', 'null', '', '50');
INSERT INTO `ebcms5_formfield` VALUES ('176', '32', '基本信息', '新密码', 'password', '', '', '0', '', 'form_textbox', 'null', '', '45');
INSERT INTO `ebcms5_formfield` VALUES ('177', '32', '基本信息', '重复密码', 'passwordtwo', '', '', '0', '', 'form_textbox', 'null', '', '40');
INSERT INTO `ebcms5_formfield` VALUES ('178', '33', '基本信息', '可选值', 'values', '', 'config', '3', 'values', 'form_multitextbox', 'null', '一样一个，用|分割键值对，例如：\r\n红色|red\r\n绿色|green\r\n黑色|black\r\n灰色|gray', '80');
INSERT INTO `ebcms5_formfield` VALUES ('179', '33', '基本信息', '是否可编辑', 'editable', '', 'config', '3', 'editable', 'form_bool', 'null', '可编辑是指下拉选项只是作为辅助选项，实际上还是一个文本框', '60');
INSERT INTO `ebcms5_formfield` VALUES ('180', '33', '基本信息', '是否只读', 'readonly', '', 'config', '3', 'readonly', 'form_bool', 'null', '', '40');
INSERT INTO `ebcms5_formfield` VALUES ('181', '33', '基本信息', '是否失效', 'disabled', '', 'config', '3', 'disabled', 'form_bool', 'null', '', '30');
INSERT INTO `ebcms5_formfield` VALUES ('182', '33', '基本信息', 'id', 'id', '', '', '3', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('2882', '411', '基本信息', '标题', 'title', '', '', '0', '', 'form_textbox', 'null', '', '7');
INSERT INTO `ebcms5_formfield` VALUES ('2883', '411', '基本信息', '链接地址', 'eb_url', '', '', '0', '', 'form_textbox', 'null', '常规写法：http://www.ebcms.com/\r\n系统写法：content/index/lists?id=1', '6');
INSERT INTO `ebcms5_formfield` VALUES ('2884', '411', '基本信息', '分组', 'group', '', '', '1', 'group', 'form_textbox', 'null', '', '9');
INSERT INTO `ebcms5_formfield` VALUES ('2885', '411', '基本信息', '父级', 'pid', '', '', '0', '', 'form_database', '{\"model\":\"ebcms\\/nav\",\"editable\":\"0\",\"required\":\"0\",\"disabled\":\"0\",\"readonly\":\"0\",\"rootitem\":\"1\",\"tree\":\"1\",\"prompt\":\"\",\"queryparams\":\"group|eq|(I)group\",\"pid\":\"\",\"titlefield\":\"\",\"valuefield\":\"\",\"width\":\"\"}', '', '8');
INSERT INTO `ebcms5_formfield` VALUES ('2886', '412', '基本信息', '父级', 'pid', '', '', '3', 'pid', 'form_database', '{\"model\":\"ebcms\\/nav\",\"editable\":\"0\",\"required\":\"0\",\"disabled\":\"0\",\"readonly\":\"0\",\"rootitem\":\"1\",\"tree\":\"1\",\"prompt\":\"\",\"queryparams\":\"group|eq|(@)group\",\"pid\":\"\",\"titlefield\":\"\",\"valuefield\":\"\",\"width\":\"\"}', '', '9');
INSERT INTO `ebcms5_formfield` VALUES ('2887', '412', '基本信息', '标题', 'title', '', '', '3', 'title', 'form_textbox', 'null', '', '8');
INSERT INTO `ebcms5_formfield` VALUES ('2888', '412', '基本信息', '链接地址', 'eb_url', '', '', '3', 'eb_url', 'form_textbox', 'null', '常规写法：http://www.ebcms.com/\r\n系统写法：content/index/lists?id=1', '7');
INSERT INTO `ebcms5_formfield` VALUES ('2889', '412', '个性扩展', '个性扩展', 'eb_ext', '', '', '3', 'eb_ext', 'form_custom', '{\"html\":\"&lt;script&gt;\\r\\n    Namespace.register(&quot;EBCMS.Form_{$field.unique}&quot;);\\r\\n    $(function() {\\r\\n\\r\\n        \\/*\\u6539\\u540d\\u540d\\u79f0*\\/\\r\\n        EBCMS.Form_{$field.unique}.changename = function(id,value){\\r\\n            if ($(id).is(\'div\')) {\\r\\n                \\/*\\u7f16\\u8f91\\u5668*\\/\\r\\n                $(id).next().attr(\'name\',\'{$field.field}[\'+value+\']\');\\r\\n            }else{\\r\\n                $(id).attr(\'name\',\'{$field.field}[\'+value+\']\');\\r\\n            }\\r\\n            $(id+\'__config__\').attr(\'name\',\'{$field.field}[__config__][\'+value+\']\');\\r\\n        };\\r\\n        EBCMS.Form_{$field.unique}.up = function(dom){\\r\\n            var thisdom = $(dom).parent().parent().parent();\\r\\n            if (thisdom.prev().length) {\\r\\n                thisdom.insertBefore(thisdom.prev());\\r\\n            }\\r\\n        };\\r\\n        EBCMS.Form_{$field.unique}.down = function(dom){\\r\\n            var thisdom = $(dom).parent().parent().parent();\\r\\n            if (thisdom.next().length) {\\r\\n                thisdom.next().insertBefore(thisdom);\\r\\n            }\\r\\n        };\\r\\n        EBCMS.Form_{$field.unique}.render = function(name,value,target){\\r\\n            if (EBCMS.Form_{$field.unique}.config[name]) {\\r\\n                \\r\\n            }else{\\r\\n                EBCMS.Form_{$field.unique}.config[name] = \'text\';\\r\\n            }\\r\\n            if (EBCMS.Form_{$field.unique}[\'render_\'+EBCMS.Form_{$field.unique}.config[name]]) {\\r\\n                EBCMS.Form_{$field.unique}[\'render_\'+EBCMS.Form_{$field.unique}.config[name]](name,value,target);\\r\\n            }\\r\\n        };\\r\\n        EBCMS.Form_{$field.unique}.render_text = function(name,value,target){\\r\\n            name = name||\'EB_\' + EBCMS.FN.random_str(6);\\r\\n            opt = {\\r\\n                name:name,\\r\\n                value:value||\'\',\\r\\n                id:\'{$field.unique}_\' + EBCMS.FN.random_str(15),\\r\\n            };\\r\\n            var str = \'&lt;div class=&quot;row&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;btn-group&quot;&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;$(this).parent().parent().parent().remove();&quot;&gt;\\u5220\\u9664&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.up(this);&quot;&gt;\\u4e0a\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.down(this);&quot;&gt;\\u4e0b\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;text&quot; class=&quot;form-control&quot; value=&quot;\'+opt.name+\'&quot; onKeyUp=&quot;EBCMS.Form_{$field.unique}.changename(\\\\\'#\'+opt.id+\'\\\\\',$(this).val());&quot; placeholder=&quot;\\u586b\\u5199\\u540d\\u79f0&quot;&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-8 col-sm-12&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;\'+opt.id+\'&quot; name=&quot;{$field.field}[\'+opt.name+\']&quot; value=&quot;\'+opt.value+\'&quot; placeholder=&quot;\\u586b\\u5199\\u5185\\u5bb9&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;hidden&quot; id=&quot;\'+opt.id+\'__config__&quot; name=&quot;{$field.field}[__config__][\'+opt.name+\']&quot; value=&quot;text&quot;&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            if (target) {\\r\\n                $(target).append(str);\\r\\n            }else{\\r\\n                return str;\\r\\n            }\\r\\n        };\\r\\n        EBCMS.Form_{$field.unique}.render_textarea = function(name,value,target){\\r\\n            name = name||\'EB_\' + EBCMS.FN.random_str(6);\\r\\n            opt = {\\r\\n                name:name,\\r\\n                value:value||\'\',\\r\\n                id:\'{$field.unique}_\' + EBCMS.FN.random_str(15),\\r\\n            };\\r\\n            var str = \'&lt;div class=&quot;row&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;btn-group&quot;&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;$(this).parent().parent().parent().remove();&quot;&gt;\\u5220\\u9664&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.up(this);&quot;&gt;\\u4e0a\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.down(this);&quot;&gt;\\u4e0b\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;text&quot; class=&quot;form-control&quot; value=&quot;\'+opt.name+\'&quot; onKeyUp=&quot;EBCMS.Form_{$field.unique}.changename(\\\\\'#\'+opt.id+\'\\\\\',$(this).val());&quot; placeholder=&quot;\\u586b\\u5199\\u540d\\u79f0&quot;&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-8 col-sm-12&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;textarea class=&quot;form-control&quot; id=&quot;\'+opt.id+\'&quot; name=&quot;{$field.field}[\'+opt.name+\']&quot; rows=&quot;3&quot; placeholder=&quot;\\u586b\\u5199\\u5185\\u5bb9&quot;&gt;\'+opt.value+\'&lt;\\/textarea&gt;\';\\r\\n            str += \'&lt;input type=&quot;hidden&quot; id=&quot;\'+opt.id+\'__config__&quot; name=&quot;{$field.field}[__config__][\'+opt.name+\']&quot; value=&quot;textarea&quot;&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            if (target) {\\r\\n                $(target).append(str);\\r\\n            }else{\\r\\n                return str;\\r\\n            }\\r\\n        };\\r\\n        EBCMS.Form_{$field.unique}.render_file = function(name,value,target){\\r\\n            name = name||\'EB_\' + EBCMS.FN.random_str(6);\\r\\n            opt = {\\r\\n                name:name,\\r\\n                value:value||\'\',\\r\\n                id:\'{$field.unique}_\' + EBCMS.FN.random_str(15),\\r\\n            };\\r\\n\\r\\n            var str = \'&lt;div class=&quot;row&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;btn-group&quot;&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;$(this).parent().parent().parent().remove();&quot;&gt;\\u5220\\u9664&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.up(this);&quot;&gt;\\u4e0a\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.down(this);&quot;&gt;\\u4e0b\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;text&quot; class=&quot;form-control&quot; value=&quot;\'+opt.name+\'&quot; onKeyUp=&quot;EBCMS.Form_{$field.unique}.changename(\\\\\'#\'+opt.id+\'\\\\\',$(this).val());&quot; placeholder=&quot;\\u586b\\u5199\\u540d\\u79f0&quot;&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-8 col-sm-12&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;table class=&quot;table&quot; style=&quot;margin-bottom: 0px;&quot;&gt;\';\\r\\n            str += \'&lt;tr&gt;\';\\r\\n            str += \'&lt;td style=&quot;padding: 0px !important;border-top:none;&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;\'+opt.id+\'&quot; name=&quot;{$field.field}[\'+opt.name+\']&quot; value=&quot;\'+opt.value+\'&quot; placeholder=&quot;\\u586b\\u5199\\u5185\\u5bb9&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;hidden&quot; id=&quot;\'+opt.id+\'__config__&quot; name=&quot;{$field.field}[__config__][\'+opt.name+\']&quot; value=&quot;file&quot;&gt;\';\\r\\n            str += \'&lt;\\/td&gt;\';\\r\\n            str += \'&lt;td style=&quot;width: 100px;padding: 0px 0px 0px 10px !important;border-top:none;&quot;&gt;\';\\r\\n            str += \'&lt;div id=&quot;\'+opt.id+\'_pick&quot;&gt;\\u4e0a\\u4f20&lt;\\/div&gt;\';\\r\\n            str += \'&lt;script&gt;\';\\r\\n            str += \'$(function(){\';\\r\\n            str += \'    EBCMS.MYFUN.renderUploader(\\\\\'#\'+opt.id+\'_pick\\\\\',function(file,res){ if (res.code) { $(\\\\\'#\'+opt.id+\'\\\\\').val(res.data.pathname); }else{ EBCMS.MSG.alert(res.msg);};});\';\\r\\n            str += \'});\';\\r\\n            str += \'&lt;\\\\\\/script&gt;\';\\r\\n            str += \'&lt;\\/td&gt;\';\\r\\n            str += \'&lt;\\/tr&gt;\';\\r\\n            str += \'&lt;\\/table&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            if (target) {\\r\\n                $(target).append(str);\\r\\n            }else{\\r\\n                return str;\\r\\n            }\\r\\n        };\\r\\n        EBCMS.Form_{$field.unique}.render_ueditor = function(name,value,target){\\r\\n            name = name||\'EB_\' + EBCMS.FN.random_str(6);\\r\\n            opt = {\\r\\n                name:name,\\r\\n                value:value||\'\',\\r\\n                id:\'{$field.unique}_\' + EBCMS.FN.random_str(15),\\r\\n            };\\r\\n\\r\\n            var str = \'&lt;div class=&quot;row&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;btn-group&quot;&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;$(this).parent().parent().parent().remove();&quot;&gt;\\u5220\\u9664&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.up(this);&quot;&gt;\\u4e0a\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.down(this);&quot;&gt;\\u4e0b\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;text&quot; class=&quot;form-control&quot; value=&quot;\'+opt.name+\'&quot; onKeyUp=&quot;EBCMS.Form_{$field.unique}.changename(\\\\\'#\'+opt.id+\'\\\\\',$(this).val());&quot; placeholder=&quot;\\u586b\\u5199\\u540d\\u79f0&quot;&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-8 col-sm-12&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;textarea id=&quot;\'+opt.id+\'&quot; name=&quot;{$field.field}[\'+opt.name+\']&quot; &gt;\'+opt.value+\'&lt;\\/textarea&gt;\';\\r\\n            str += \'&lt;script&gt;\';\\r\\n            str += \'$(function(){\';\\r\\n            str += \'    EBCMS.MYFUN.renderUE(&quot;\'+opt.id+\'&quot;,{\';\\r\\n            str += \'          autoHeightEnabled:false,\';\\r\\n            str += \'          maximumWords:99999,\';\\r\\n            str += \'          wordCount:true,\';\\r\\n            str += \'          elementPathEnabled:true,\';\\r\\n            str += \'          initialFrameHeight:400,\';\\r\\n            str += \'    });\';\\r\\n            str += \'});\';\\r\\n            str += \'&lt;\\\\\\/script&gt;\';\\r\\n            str += \'&lt;input type=&quot;hidden&quot; id=&quot;\'+opt.id+\'__config__&quot; name=&quot;{$field.field}[__config__][\'+opt.name+\']&quot; value=&quot;ueditor&quot;&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            if (target) {\\r\\n                $(target).append(str);\\r\\n            }else{\\r\\n                return str;\\r\\n            }\\r\\n        };\\r\\n        \\r\\n        var forms = {$field.value|json_encode};\\r\\n        if (typeof forms!=\'object\') {\\r\\n            forms = {};\\r\\n        }\\r\\n        EBCMS.Form_{$field.unique}.config = forms[\'__config__\']||{};\\r\\n        delete forms[\'__config__\'];\\r\\n        $.each(forms, function(name, val) {\\r\\n            EBCMS.Form_{$field.unique}.render(name,val,\'#{$field.unique}_container\');\\r\\n        });\\r\\n    });\\r\\n&lt;\\/script&gt;\\r\\n&lt;div class=&quot;row&quot;&gt;\\r\\n    &lt;div class=&quot;col-md-12&quot;&gt;\\r\\n        &lt;div class=&quot;btn-group&quot; role=&quot;group&quot; aria-label=&quot;...&quot;&gt;\\r\\n            &lt;button type=&quot;button&quot; class=&quot;btn btn-primary btn-sm&quot; onclick=&quot;EBCMS.Form_{$field.unique}.render_text(\'\',\'\',\'#{$field.unique}_container\');&quot;&gt;\\u5355\\u884c\\u6587\\u672c&lt;\\/button&gt;\\r\\n            &lt;button type=&quot;button&quot; class=&quot;btn btn-primary btn-sm&quot; onclick=&quot;EBCMS.Form_{$field.unique}.render_textarea(\'\',\'\',\'#{$field.unique}_container\');&quot;&gt;\\u591a\\u884c\\u6587\\u672c&lt;\\/button&gt;\\r\\n            &lt;button type=&quot;button&quot; class=&quot;btn btn-primary btn-sm&quot; onclick=&quot;EBCMS.Form_{$field.unique}.render_file(\'\',\'\',\'#{$field.unique}_container\');&quot;&gt;\\u6587\\u4ef6&lt;\\/button&gt;\\r\\n            &lt;button type=&quot;button&quot; class=&quot;btn btn-primary btn-sm&quot; onclick=&quot;EBCMS.Form_{$field.unique}.render_ueditor(\'\',\'\',\'#{$field.unique}_container\');&quot;&gt;\\u7f16\\u8f91\\u6846&lt;\\/button&gt;\\r\\n        &lt;\\/div&gt;\\r\\n        &lt;br&gt;\\r\\n    &lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\\r\\n&lt;div id=&quot;{$field.unique}_container&quot;&gt;&lt;\\/div&gt;\\r\\n&lt;input type=&quot;hidden&quot; name=&quot;{$field.field}[__config__][__test__]&quot; value=\'test\'&gt;\"}', '', '8');
INSERT INTO `ebcms5_formfield` VALUES ('2890', '412', '基本信息', 'id', 'id', '', '', '3', 'id', 'form_hidden', 'null', '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('2891', '411', '基本信息', '所属应用', 'app', '', '', '0', '', 'form_textbox', '{\"prompt\":\"可不填\"}', '填写所属应用名称，例如 您安装了单页模块的话 此处就填写 single，\r\n作用：\r\n1、卸载应用的时候，自动删除\r\n2、暂停应用的时候，前台自动隐藏', '1');
INSERT INTO `ebcms5_formfield` VALUES ('2892', '412', '基本信息', '所属应用', 'app', '', '', '3', 'app', 'form_textbox', '{\"prompt\":\"可不填\"}', '填写所属应用名称，例如 您安装了单页模块的话 此处就填写 single，\r\n作用：\r\n1、卸载应用的时候，自动删除\r\n2、暂停应用的时候，前台自动隐藏', '5');
INSERT INTO `ebcms5_formfield` VALUES ('7002', '411', '个性扩展', '个性扩展', 'eb_ext', '', '', '0', '', 'form_custom', '{\"html\":\"&lt;script&gt;\\r\\n    Namespace.register(&quot;EBCMS.Form_{$field.unique}&quot;);\\r\\n    $(function() {\\r\\n\\r\\n        \\/*\\u6539\\u540d\\u540d\\u79f0*\\/\\r\\n        EBCMS.Form_{$field.unique}.changename = function(id,value){\\r\\n            if ($(id).is(\'div\')) {\\r\\n                \\/*\\u7f16\\u8f91\\u5668*\\/\\r\\n                $(id).next().attr(\'name\',\'{$field.field}[\'+value+\']\');\\r\\n            }else{\\r\\n                $(id).attr(\'name\',\'{$field.field}[\'+value+\']\');\\r\\n            }\\r\\n            $(id+\'__config__\').attr(\'name\',\'{$field.field}[__config__][\'+value+\']\');\\r\\n        };\\r\\n        EBCMS.Form_{$field.unique}.up = function(dom){\\r\\n            var thisdom = $(dom).parent().parent().parent();\\r\\n            if (thisdom.prev().length) {\\r\\n                thisdom.insertBefore(thisdom.prev());\\r\\n            }\\r\\n        };\\r\\n        EBCMS.Form_{$field.unique}.down = function(dom){\\r\\n            var thisdom = $(dom).parent().parent().parent();\\r\\n            if (thisdom.next().length) {\\r\\n                thisdom.next().insertBefore(thisdom);\\r\\n            }\\r\\n        };\\r\\n        EBCMS.Form_{$field.unique}.render = function(name,value,target){\\r\\n            if (EBCMS.Form_{$field.unique}.config[name]) {\\r\\n                \\r\\n            }else{\\r\\n                EBCMS.Form_{$field.unique}.config[name] = \'text\';\\r\\n            }\\r\\n            if (EBCMS.Form_{$field.unique}[\'render_\'+EBCMS.Form_{$field.unique}.config[name]]) {\\r\\n                EBCMS.Form_{$field.unique}[\'render_\'+EBCMS.Form_{$field.unique}.config[name]](name,value,target);\\r\\n            }\\r\\n        };\\r\\n        EBCMS.Form_{$field.unique}.render_text = function(name,value,target){\\r\\n            name = name||\'EB_\' + EBCMS.FN.random_str(6);\\r\\n            opt = {\\r\\n                name:name,\\r\\n                value:value||\'\',\\r\\n                id:\'{$field.unique}_\' + EBCMS.FN.random_str(15),\\r\\n            };\\r\\n            var str = \'&lt;div class=&quot;row&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;btn-group&quot;&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;$(this).parent().parent().parent().remove();&quot;&gt;\\u5220\\u9664&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.up(this);&quot;&gt;\\u4e0a\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.down(this);&quot;&gt;\\u4e0b\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;text&quot; class=&quot;form-control&quot; value=&quot;\'+opt.name+\'&quot; onKeyUp=&quot;EBCMS.Form_{$field.unique}.changename(\\\\\'#\'+opt.id+\'\\\\\',$(this).val());&quot; placeholder=&quot;\\u586b\\u5199\\u540d\\u79f0&quot;&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-8 col-sm-12&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;\'+opt.id+\'&quot; name=&quot;{$field.field}[\'+opt.name+\']&quot; value=&quot;\'+opt.value+\'&quot; placeholder=&quot;\\u586b\\u5199\\u5185\\u5bb9&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;hidden&quot; id=&quot;\'+opt.id+\'__config__&quot; name=&quot;{$field.field}[__config__][\'+opt.name+\']&quot; value=&quot;text&quot;&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            if (target) {\\r\\n                $(target).append(str);\\r\\n            }else{\\r\\n                return str;\\r\\n            }\\r\\n        };\\r\\n        EBCMS.Form_{$field.unique}.render_textarea = function(name,value,target){\\r\\n            name = name||\'EB_\' + EBCMS.FN.random_str(6);\\r\\n            opt = {\\r\\n                name:name,\\r\\n                value:value||\'\',\\r\\n                id:\'{$field.unique}_\' + EBCMS.FN.random_str(15),\\r\\n            };\\r\\n            var str = \'&lt;div class=&quot;row&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;btn-group&quot;&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;$(this).parent().parent().parent().remove();&quot;&gt;\\u5220\\u9664&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.up(this);&quot;&gt;\\u4e0a\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.down(this);&quot;&gt;\\u4e0b\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;text&quot; class=&quot;form-control&quot; value=&quot;\'+opt.name+\'&quot; onKeyUp=&quot;EBCMS.Form_{$field.unique}.changename(\\\\\'#\'+opt.id+\'\\\\\',$(this).val());&quot; placeholder=&quot;\\u586b\\u5199\\u540d\\u79f0&quot;&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-8 col-sm-12&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;textarea class=&quot;form-control&quot; id=&quot;\'+opt.id+\'&quot; name=&quot;{$field.field}[\'+opt.name+\']&quot; rows=&quot;3&quot; placeholder=&quot;\\u586b\\u5199\\u5185\\u5bb9&quot;&gt;\'+opt.value+\'&lt;\\/textarea&gt;\';\\r\\n            str += \'&lt;input type=&quot;hidden&quot; id=&quot;\'+opt.id+\'__config__&quot; name=&quot;{$field.field}[__config__][\'+opt.name+\']&quot; value=&quot;textarea&quot;&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            if (target) {\\r\\n                $(target).append(str);\\r\\n            }else{\\r\\n                return str;\\r\\n            }\\r\\n        };\\r\\n        EBCMS.Form_{$field.unique}.render_file = function(name,value,target){\\r\\n            name = name||\'EB_\' + EBCMS.FN.random_str(6);\\r\\n            opt = {\\r\\n                name:name,\\r\\n                value:value||\'\',\\r\\n                id:\'{$field.unique}_\' + EBCMS.FN.random_str(15),\\r\\n            };\\r\\n\\r\\n            var str = \'&lt;div class=&quot;row&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;btn-group&quot;&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;$(this).parent().parent().parent().remove();&quot;&gt;\\u5220\\u9664&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.up(this);&quot;&gt;\\u4e0a\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.down(this);&quot;&gt;\\u4e0b\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;text&quot; class=&quot;form-control&quot; value=&quot;\'+opt.name+\'&quot; onKeyUp=&quot;EBCMS.Form_{$field.unique}.changename(\\\\\'#\'+opt.id+\'\\\\\',$(this).val());&quot; placeholder=&quot;\\u586b\\u5199\\u540d\\u79f0&quot;&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-8 col-sm-12&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;table class=&quot;table&quot; style=&quot;margin-bottom: 0px;&quot;&gt;\';\\r\\n            str += \'&lt;tr&gt;\';\\r\\n            str += \'&lt;td style=&quot;padding: 0px !important;border-top:none;&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;\'+opt.id+\'&quot; name=&quot;{$field.field}[\'+opt.name+\']&quot; value=&quot;\'+opt.value+\'&quot; placeholder=&quot;\\u586b\\u5199\\u5185\\u5bb9&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;hidden&quot; id=&quot;\'+opt.id+\'__config__&quot; name=&quot;{$field.field}[__config__][\'+opt.name+\']&quot; value=&quot;file&quot;&gt;\';\\r\\n            str += \'&lt;\\/td&gt;\';\\r\\n            str += \'&lt;td style=&quot;width: 100px;padding: 0px 0px 0px 10px !important;border-top:none;&quot;&gt;\';\\r\\n            str += \'&lt;div id=&quot;\'+opt.id+\'_pick&quot;&gt;\\u4e0a\\u4f20&lt;\\/div&gt;\';\\r\\n            str += \'&lt;script&gt;\';\\r\\n            str += \'$(function(){\';\\r\\n            str += \'    EBCMS.MYFUN.renderUploader(\\\\\'#\'+opt.id+\'_pick\\\\\',function(file,res){ if (res.code) { $(\\\\\'#\'+opt.id+\'\\\\\').val(res.data.pathname); }else{ EBCMS.MSG.alert(res.msg);};});\';\\r\\n            str += \'});\';\\r\\n            str += \'&lt;\\\\\\/script&gt;\';\\r\\n            str += \'&lt;\\/td&gt;\';\\r\\n            str += \'&lt;\\/tr&gt;\';\\r\\n            str += \'&lt;\\/table&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            if (target) {\\r\\n                $(target).append(str);\\r\\n            }else{\\r\\n                return str;\\r\\n            }\\r\\n        };\\r\\n        EBCMS.Form_{$field.unique}.render_ueditor = function(name,value,target){\\r\\n            name = name||\'EB_\' + EBCMS.FN.random_str(6);\\r\\n            opt = {\\r\\n                name:name,\\r\\n                value:value||\'\',\\r\\n                id:\'{$field.unique}_\' + EBCMS.FN.random_str(15),\\r\\n            };\\r\\n\\r\\n            var str = \'&lt;div class=&quot;row&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;div class=&quot;btn-group&quot;&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;$(this).parent().parent().parent().remove();&quot;&gt;\\u5220\\u9664&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.up(this);&quot;&gt;\\u4e0a\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;button type=&quot;button&quot; class=&quot;btn btn-primary&quot; onclick=&quot;EBCMS.Form_{$field.unique}.down(this);&quot;&gt;\\u4e0b\\u79fb&lt;\\/button&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-2 col-sm-6&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;input type=&quot;text&quot; class=&quot;form-control&quot; value=&quot;\'+opt.name+\'&quot; onKeyUp=&quot;EBCMS.Form_{$field.unique}.changename(\\\\\'#\'+opt.id+\'\\\\\',$(this).val());&quot; placeholder=&quot;\\u586b\\u5199\\u540d\\u79f0&quot;&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;div class=&quot;col-md-8 col-sm-12&quot; style=&quot;padding-top:15px;&quot;&gt;\';\\r\\n            str += \'&lt;textarea id=&quot;\'+opt.id+\'&quot; name=&quot;{$field.field}[\'+opt.name+\']&quot; &gt;\'+opt.value+\'&lt;\\/textarea&gt;\';\\r\\n            str += \'&lt;script&gt;\';\\r\\n            str += \'$(function(){\';\\r\\n            str += \'    EBCMS.MYFUN.renderUE(&quot;\'+opt.id+\'&quot;,{\';\\r\\n            str += \'          autoHeightEnabled:false,\';\\r\\n            str += \'          maximumWords:99999,\';\\r\\n            str += \'          wordCount:true,\';\\r\\n            str += \'          elementPathEnabled:true,\';\\r\\n            str += \'          initialFrameHeight:400,\';\\r\\n            str += \'    });\';\\r\\n            str += \'});\';\\r\\n            str += \'&lt;\\\\\\/script&gt;\';\\r\\n            str += \'&lt;input type=&quot;hidden&quot; id=&quot;\'+opt.id+\'__config__&quot; name=&quot;{$field.field}[__config__][\'+opt.name+\']&quot; value=&quot;ueditor&quot;&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            str += \'&lt;\\/div&gt;\';\\r\\n            if (target) {\\r\\n                $(target).append(str);\\r\\n            }else{\\r\\n                return str;\\r\\n            }\\r\\n        };\\r\\n        \\r\\n        var forms = {$field.value|json_encode};\\r\\n        if (typeof forms!=\'object\') {\\r\\n            forms = {};\\r\\n        }\\r\\n        EBCMS.Form_{$field.unique}.config = forms[\'__config__\']||{};\\r\\n        delete forms[\'__config__\'];\\r\\n        $.each(forms, function(name, val) {\\r\\n            EBCMS.Form_{$field.unique}.render(name,val,\'#{$field.unique}_container\');\\r\\n        });\\r\\n    });\\r\\n&lt;\\/script&gt;\\r\\n&lt;div class=&quot;row&quot;&gt;\\r\\n    &lt;div class=&quot;col-md-12&quot;&gt;\\r\\n        &lt;div class=&quot;btn-group&quot; role=&quot;group&quot; aria-label=&quot;...&quot;&gt;\\r\\n            &lt;button type=&quot;button&quot; class=&quot;btn btn-primary btn-sm&quot; onclick=&quot;EBCMS.Form_{$field.unique}.render_text(\'\',\'\',\'#{$field.unique}_container\');&quot;&gt;\\u5355\\u884c\\u6587\\u672c&lt;\\/button&gt;\\r\\n            &lt;button type=&quot;button&quot; class=&quot;btn btn-primary btn-sm&quot; onclick=&quot;EBCMS.Form_{$field.unique}.render_textarea(\'\',\'\',\'#{$field.unique}_container\');&quot;&gt;\\u591a\\u884c\\u6587\\u672c&lt;\\/button&gt;\\r\\n            &lt;button type=&quot;button&quot; class=&quot;btn btn-primary btn-sm&quot; onclick=&quot;EBCMS.Form_{$field.unique}.render_file(\'\',\'\',\'#{$field.unique}_container\');&quot;&gt;\\u6587\\u4ef6&lt;\\/button&gt;\\r\\n            &lt;button type=&quot;button&quot; class=&quot;btn btn-primary btn-sm&quot; onclick=&quot;EBCMS.Form_{$field.unique}.render_ueditor(\'\',\'\',\'#{$field.unique}_container\');&quot;&gt;\\u7f16\\u8f91\\u6846&lt;\\/button&gt;\\r\\n        &lt;\\/div&gt;\\r\\n        &lt;br&gt;\\r\\n    &lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\\r\\n&lt;div id=&quot;{$field.unique}_container&quot;&gt;&lt;\\/div&gt;\\r\\n&lt;input type=&quot;hidden&quot; name=&quot;{$field.field}[__config__][__test__]&quot; value=\'test\'&gt;\"}', '', '8');
INSERT INTO `ebcms5_formfield` VALUES ('7006', '13', '基本配置', '分组化', 'group', '', 'config', '3', 'group', 'form_bool', 'null', '', '35');
INSERT INTO `ebcms5_formfield` VALUES ('10186', '1444', '基本信息', '邮件主题', 'topic', '', '', '1', 'topic', 'form_select', '{\"values\":\"系统消息|系统消息\\r\\n优惠信息|优惠信息\",\"editable\":\"1\",\"readonly\":\"0\",\"disabled\":\"0\"}', '', '9');
INSERT INTO `ebcms5_formfield` VALUES ('10187', '1444', '基本信息', '邮件地址', 'email', '', '', '1', 'email', 'form_textbox', 'null', '', '8');
INSERT INTO `ebcms5_formfield` VALUES ('10188', '1444', '基本信息', '对方称呼', 'name', '', '', '0', '', 'form_textbox', 'null', '', '7');
INSERT INTO `ebcms5_formfield` VALUES ('10189', '1444', '基本信息', '内容', 'content', '', '', '0', '', 'form_ueditor', '{\"initialframeheight\":\"200\",\"maximumwords\":\"\"}', '', '6');
INSERT INTO `ebcms5_formfield` VALUES ('10558', '1497', '基本配置', 'HTML', 'html', '', 'config', '3', 'html', 'form_multitextbox', '{\"height\":\"20\",\"width\":\"\",\"prompt\":\"\"}', '常见结构：\r\n&lt;tr&gt;\r\n	&lt;th&gt;{$field.title}&lt;/th&gt;\r\n	&lt;td&gt;\r\n		&lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;{$field.unique}&quot; name=&quot;{$field.field}&quot; value=&quot;{$field.value}&quot; placeholder=&quot;示例&quot;&gt;\r\n		{notempty name=\'field.remark\'}\r\n			&lt;p class=&quot;help-block&quot;&gt;{$field.remark}&lt;/p&gt;\r\n		{/notempty}\r\n	&lt;/td&gt;\r\n&lt;/tr&gt;\r\n支持变量：\r\nfield   当前字段的配置数据\r\ndata    当前表单分配的数据\r\ngroups  当前表单的字段信息\r\nform    当前表单信息', '9');
INSERT INTO `ebcms5_formfield` VALUES ('10559', '1497', '基本配置', 'ID', 'id', '', '', '3', 'id', 'form_hidden', 'null', '', '0');
INSERT INTO `ebcms5_formfield` VALUES ('11750', '411', '基本信息', '打开方式', 'target', '', '', '0', '_self', 'form_select', '{\"values\":\"新窗口|_blank\\r\\n当前窗口|_self\\r\\n父窗口|_parent\\r\\n_top|_top\",\"editable\":\"1\"}', '', '5');
INSERT INTO `ebcms5_formfield` VALUES ('11751', '412', '基本信息', '打开方式', 'target', '', '', '3', 'target', 'form_select', '{\"values\":\"新窗口|_blank\\r\\n当前窗口|_self\\r\\n父窗口|_parent\\r\\n_top|_top\",\"editable\":\"1\"}', '', '6');
INSERT INTO `ebcms5_formfield` VALUES ('12294', '22', '基本信息', '所属应用', 'app', '', '', '0', '', 'form_textbox', 'null', '填写所属应用名称，例如 您安装了单页模块的话 此处就填写 single，\r\n作用：卸载应用的时候，自动删除', '10');
INSERT INTO `ebcms5_formfield` VALUES ('12295', '23', '基本信息', '所属应用', 'app', '', '', '3', 'app', 'form_textbox', 'null', '填写所属应用名称，例如 您安装了单页模块的话 此处就填写 single，\r\n作用：卸载应用的时候，自动删除', '10');
INSERT INTO `ebcms5_formfield` VALUES ('17492', '2542', '基本信息', '权限', 'rule_ids', '', '', '0', '', 'form_custom', '{\"html\":\"{php}\\r\\n    $checked = \\\\think\\\\Db::name(\'auth_group\')-&gt;where(array(\'id\' =&gt; array(\'eq\', input(\'id\'))))-&gt;value(\'rules\');\\r\\n    $rules = \\\\think\\\\Db::name(\'auth_rule\')-&gt;order(\'sort desc\')-&gt;select();\\r\\n    $rules = \\\\ebcms\\\\Tree::tree($rules);\\r\\n{\\/php}\\r\\n{foreach name=\'rules\' item=\'a\'}\\r\\n    &lt;table class=&quot;table table-bordered&quot;&gt;\\r\\n        &lt;tr&gt;\\r\\n            &lt;td colspan=&quot;2&quot;&gt;\\r\\n                &lt;label class=&quot;checkbox-inline&quot;&gt;\\r\\n                    &lt;input type=&quot;checkbox&quot; name=&quot;{$field.field}[]&quot; value=&quot;{$a.id}&quot; {in name=&quot;a.id&quot; value=&quot;$checked&quot;}checked=&quot;checked&quot;{\\/in}&gt; {$a.title}\\r\\n                &lt;\\/label&gt;\\r\\n            &lt;\\/td&gt;\\r\\n        &lt;\\/tr&gt;\\r\\n        {foreach name=\'a.rows\' item=\'b\'}\\r\\n        &lt;tr&gt;\\r\\n            &lt;th&gt;\\r\\n                &lt;label class=&quot;checkbox-inline&quot;&gt;\\r\\n                    &lt;input type=&quot;checkbox&quot; name=&quot;{$field.field}[]&quot; value=&quot;{$b.id}&quot; {in name=&quot;b.id&quot; value=&quot;$checked&quot;}checked=&quot;checked&quot;{\\/in}&gt; {$b.title}\\r\\n                &lt;\\/label&gt;\\r\\n            &lt;\\/th&gt;\\r\\n            &lt;td&gt;\\r\\n                {foreach name=\'b.rows\' item=\'c\'}\\r\\n                &lt;label class=&quot;checkbox-inline&quot;&gt;\\r\\n                    &lt;input type=&quot;checkbox&quot; name=&quot;{$field.field}[]&quot; value=&quot;{$c.id}&quot; {in name=&quot;c.id&quot; value=&quot;$checked&quot;}checked=&quot;checked&quot;{\\/in}&gt; {$c.title}\\r\\n                &lt;\\/label&gt;\\r\\n                {\\/foreach}\\r\\n            &lt;\\/td&gt;\\r\\n        &lt;\\/tr&gt;\\r\\n        {\\/foreach}\\r\\n    &lt;\\/table&gt;\\r\\n{\\/foreach}\"}', '', '9');
INSERT INTO `ebcms5_formfield` VALUES ('17493', '2542', '基本信息', 'id', 'id', '', '', '1', 'id', 'form_hidden', null, '', '1');
INSERT INTO `ebcms5_formfield` VALUES ('17494', '2543', '基本信息', 'id', 'id', '', '', '1', 'id', 'form_hidden', null, '', '0');
INSERT INTO `ebcms5_formfield` VALUES ('17495', '2543', '基本信息', '菜单', 'menu_ids', '', '', '0', '', 'form_custom', '{\"html\":\"{php}\\r\\n\\t$checked = \\\\think\\\\Db::name(\'auth_group\')-&gt;where(array(\'id\' =&gt; array(\'eq\', input(\'id\'))))-&gt;value(\'menus\');\\r\\n\\t$menus = \\\\think\\\\Db::name(\'menu\')-&gt;order(\'sort desc\')-&gt;select();\\r\\n\\t$menus = \\\\ebcms\\\\Tree::tree($menus);\\r\\n{\\/php}\\r\\n&lt;table class=&quot;table table-bordered&quot;&gt;\\r\\n\\t{foreach name=\'menus\' item=\'top\'}\\r\\n\\t&lt;tr&gt;\\r\\n\\t\\t&lt;th&gt;\\r\\n\\t\\t\\t&lt;label class=&quot;checkbox-inline&quot;&gt;\\r\\n\\t\\t\\t\\t&lt;input type=&quot;checkbox&quot; name=&quot;{$field.field}[]&quot; value=&quot;{$top.id}&quot; {in name=&quot;top.id&quot; value=&quot;$checked&quot;}checked=&quot;checked&quot;{\\/in}&gt; {$top.title}\\r\\n\\t\\t\\t&lt;\\/label&gt;\\r\\n\\t\\t&lt;\\/th&gt;\\r\\n\\t\\t&lt;td&gt;\\r\\n\\t\\t\\t{foreach name=\'top.rows\' item=\'sub\'}\\r\\n\\t\\t\\t&lt;label class=&quot;checkbox-inline&quot;&gt;\\r\\n\\t\\t\\t\\t&lt;input type=&quot;checkbox&quot; name=&quot;{$field.field}[]&quot; value=&quot;{$sub.id}&quot; {in name=&quot;sub.id&quot; value=&quot;$checked&quot;}checked=&quot;checked&quot;{\\/in}&gt; {$sub.title}\\r\\n\\t\\t\\t&lt;\\/label&gt;\\r\\n\\t\\t\\t{\\/foreach}\\r\\n\\t\\t&lt;\\/td&gt;\\r\\n\\t&lt;\\/tr&gt;\\r\\n\\t{\\/foreach}\\r\\n&lt;\\/table&gt;\"}', '', '9');
INSERT INTO `ebcms5_formfield` VALUES ('17496', '2544', '基本信息', '密码', 'password', '', '', '0', '', 'form_textbox', null, '', '9');
INSERT INTO `ebcms5_formfield` VALUES ('17497', '2544', '基本信息', 'id', 'id', '', '', '1', 'id', 'form_hidden', null, '', '2');
INSERT INTO `ebcms5_formfield` VALUES ('17498', '2545', '基本信息', '角色', 'group_ids', '', '', '0', '', 'form_custom', '{\"html\":\"{php}\\r\\n\\t$checked = \\\\think\\\\Db::name(\'auth_access\')-&gt;where(\'uid=\' . input(\'id\'))-&gt;column(\'group_id\');\\r\\n\\t$groups = \\\\think\\\\Db::name(\'auth_group\')-&gt;select();\\r\\n\\t$groups = \\\\ebcms\\\\Tree::group($groups);\\r\\n{\\/php}\\r\\n&lt;table class=&quot;table table-bordered&quot;&gt;\\r\\n\\t{foreach name=\'groups\' item=\'items\'}\\r\\n\\t&lt;tr&gt;\\r\\n\\t\\t&lt;th&gt;\\r\\n\\t\\t\\t{$key}\\r\\n\\t\\t&lt;\\/th&gt;\\r\\n\\t\\t&lt;td&gt;\\r\\n\\t\\t\\t{foreach name=\'items\' item=\'vo\'}\\r\\n\\t\\t\\t&lt;label class=&quot;checkbox-inline&quot;&gt;\\r\\n\\t\\t\\t\\t&lt;input type=&quot;checkbox&quot; name=&quot;{$field.field}[]&quot; value=&quot;{$vo.id}&quot; {in name=&quot;vo.id&quot; value=&quot;$checked&quot;}checked=&quot;checked&quot;{\\/in}&gt; {$vo.title}\\r\\n\\t\\t\\t&lt;\\/label&gt;\\r\\n\\t\\t\\t{\\/foreach}\\r\\n\\t\\t&lt;\\/td&gt;\\r\\n\\t&lt;\\/tr&gt;\\r\\n\\t{\\/foreach}\\r\\n&lt;\\/table&gt;\"}', '', '0');
INSERT INTO `ebcms5_formfield` VALUES ('17499', '2545', '基本信息', 'id', 'id', '', '', '1', 'id', 'form_hidden', null, '', '0');
INSERT INTO `ebcms5_formfield` VALUES ('17500', '2546', '基本信息', '密码', 'password', '', '', '0', '', 'form_textbox', null, '为保证系统安全，请输入密码！', '9');
INSERT INTO `ebcms5_formfield` VALUES ('17501', '2546', '基本信息', 'id', 'id', '', '', '1', 'id', 'form_hidden', null, '', '0');
INSERT INTO `ebcms5_formfield` VALUES ('18296', '6', '基本配置', '上传目录', 'path', '', 'config', '3', 'path', 'form_textbox', null, '', '30');
INSERT INTO `ebcms5_formfield` VALUES ('18299', '9', '基本配置', '上传目录', 'path', '', 'config', '3', 'path', 'form_textbox', null, '', '30');
INSERT INTO `ebcms5_formfield` VALUES ('21544', '13', '基本配置', '查询排序', 'order', '', 'config', '3', '', 'form_textbox', null, '', '49');
INSERT INTO `ebcms5_formfield` VALUES ('21545', '13', '基本配置', '查询排序', 'order', '', 'config', '3', '', 'form_textbox', null, '', '49');

-- ----------------------------
-- Table structure for ebcms5_manager
-- ----------------------------
DROP TABLE IF EXISTS `ebcms5_manager`;
CREATE TABLE `ebcms5_manager` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '后台人员ID',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'QQ号码',
  `nickname` char(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `login_times` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登陆ip地址',
  `login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登陆时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ebcms5_manager
-- ----------------------------
INSERT INTO `ebcms5_manager` VALUES ('1', 'kujiw@qq.com', '管理员', '', '559461b6b41e9e4010dfb8f069cf0e2c', '3', '0.0.0.0', '1499647900', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for ebcms5_menu
-- ----------------------------
DROP TABLE IF EXISTS `ebcms5_menu`;
CREATE TABLE `ebcms5_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜菜单ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(250) NOT NULL DEFAULT '' COMMENT '附加参数',
  `sort` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `app` varchar(255) NOT NULL DEFAULT '' COMMENT '应用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1652 DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of ebcms5_menu
-- ----------------------------
INSERT INTO `ebcms5_menu` VALUES ('3', '10', '账户管理', 'ebcms/manager/index', '53', 'ebcms');
INSERT INTO `ebcms5_menu` VALUES ('4', '10', '角色管理', 'ebcms/group/index', '54', 'ebcms');
INSERT INTO `ebcms5_menu` VALUES ('8', '10', '操作日志', 'ebcms/oplog/index', '52', 'ebcms');
INSERT INTO `ebcms5_menu` VALUES ('10', '0', '系统', '', '2000', 'ebcms');
INSERT INTO `ebcms5_menu` VALUES ('11', '10', '设置中心', 'ebcms/config/index', '83', 'ebcms');
INSERT INTO `ebcms5_menu` VALUES ('22', '936', '应用商店', 'ebcms/store/index', '98', 'ebcms');
INSERT INTO `ebcms5_menu` VALUES ('560', '10', '__DIVIDER__', '', '60', 'ebcms');
INSERT INTO `ebcms5_menu` VALUES ('935', '10', '模型扩展', 'ebcms/extend/index', '81', 'ebcms');
INSERT INTO `ebcms5_menu` VALUES ('936', '0', '模块', '', '3000', 'ebcms');
INSERT INTO `ebcms5_menu` VALUES ('1030', '936', '__DIVIDER__', '', '50', 'ebcms');
INSERT INTO `ebcms5_menu` VALUES ('1315', '10', '清理缓存', 'javascript:M.runtime();', '1', 'ebcms');
INSERT INTO `ebcms5_menu` VALUES ('1330', '10', '前台导航', 'ebcms/nav/index', '80', 'ebcms');

-- ----------------------------
-- Table structure for ebcms5_nav
-- ----------------------------
DROP TABLE IF EXISTS `ebcms5_nav`;
CREATE TABLE `ebcms5_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜菜单ID',
  `group` varchar(255) NOT NULL DEFAULT '' COMMENT '分组',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '标题',
  `eb_url` varchar(250) NOT NULL DEFAULT '' COMMENT '附加参数',
  `target` varchar(20) NOT NULL DEFAULT '' COMMENT '目标窗口',
  `eb_ext` text COMMENT '扩展',
  `sort` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `app` varchar(255) NOT NULL DEFAULT '' COMMENT '应用',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能菜单表';

-- ----------------------------
-- Records of ebcms5_nav
-- ----------------------------

-- ----------------------------
-- Table structure for ebcms5_oplog
-- ----------------------------
DROP TABLE IF EXISTS `ebcms5_oplog`;
CREATE TABLE `ebcms5_oplog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `manager_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作员ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '说明',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '动作',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'ip',
  `ids` text COMMENT '提交的id',
  `request` text COMMENT '详细',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '执行状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of ebcms5_oplog
-- ----------------------------
