
<?php
return array(
	//'配置项'=>'配置值'

	#基础设置
	'DEFAULT_LANG'          =>  'zh-cn', // 默认语言
	'DEFAULT_MODULE'        =>  'Home',  // 默认模块
	'DEFAULT_CONTROLLER'    =>  'Index', // 默认控制器名称
	'DEFAULT_ACTION'        =>  'index', // 默认操作名称
	'DEFAULT_CHARSET'       =>  'utf-8', // 默认输出编码
	'DEFAULT_TIMEZONE'      =>  'PRC',  // 默认时区
	'DEFAULT_AJAX_RETURN'   =>  'JSON',  // 默认AJAX 数据返回格式,可选JSON XML ...
	'DEFAULT_JSONP_HANDLER' =>  'jsonpReturn', // 默认JSONP格式返回的处理方法

	#数据库配置
	'DB_TYPE'               =>  'mysql',		// 数据库类型
	'DB_HOST'               =>  '192.168.1.112', 	// 服务器地址
	'DB_NAME'               =>  'iwo_test',    	// 数据库名
	'DB_USER'               =>  'admin',    	// 用户名
	'DB_PWD'                =>  'admin123',   	// 密码
	'DB_PORT'               =>  '3305',   	// 端口
	'DB_PREFIX'             =>  '',    	// 数据库表前缀
	'DB_FIELDTYPE_CHECK'    =>  false, 	// 是否进行字段类型检查
	'DB_FIELDS_CACHE'       =>  true,  	// 启用字段缓存
	'DB_CHARSET'            =>  'utf8',	// 数据库编码默认采用utf8
	'DB_DEPLOY_TYPE'        =>  0, 		// 数据库部署方式:0 集中式(单一服务器),1 分布式(主从服务器)
	'DB_RW_SEPARATE'        =>  false,	// 数据库读写是否分离 主从式有效
	'DB_MASTER_NUM'         =>  1, 		// 读写分离后 主服务器数量
	'DB_SLAVE_NO'           =>  '', 	// 指定从服务器序号
	'DB_SQL_BUILD_CACHE'    =>  false, 	// 数据库查询的SQL创建缓存
	'DB_SQL_BUILD_QUEUE'    =>  'file',	// SQL缓存队列的缓存方式 支持 file xcache和apc
	'DB_SQL_BUILD_LENGTH'   =>  20, 	// SQL缓存的队列长度
	'DB_SQL_LOG'            =>  false, 	// SQL执行日志记录
	'DB_BIND_PARAM'         =>  false, 	// 数据库写入数据自动参数绑定

	#URL设置
	'URL_CASE_INSENSITIVE'  =>  true,   // 默认false 表示URL区分大小写 true则表示不区分大小写
	'URL_MODEL'             =>  0,       // URL访问模式,可选参数0、1、2、3,代表以下四种模式：
);