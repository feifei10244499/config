server:
  port: 8881
  tomcat:
    uri-encoding: UTF-8
spring:
  jpa:
    show-sql: true
  datasource:
    username: root
    password: 123456
    url: jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf8&useSSL=false&tinyInt1isBit=true&serverTimezone=UTC
    # 使用druid数据源
    driver-class-name: com.mysql.cj.jdbc.Driver
    type: com.alibaba.druid.pool.DruidDataSource
    druid:      # 配置测试查询语句
      validationQuery: SELECT 1 FROM DUAL
      # 初始化大小，最小，最大
      nitialSize: 10
      minIdle: 10
      maxActive: 200
      # 配置一个连接在池中最小生存的时间，单位是毫秒
      minEvictableIdleTimeMillis: 180000
      testOnBorrow: false
      testWhileIdle: true
      removeAbandoned: true
      removeAbandonedTimeout: 1800
      logAbandoned: true
      # 打开PSCache，并且指定每个连接上PSCache的大小
      poolPreparedStatements: true
      maxOpenPreparedStatements: 100
      # 配置监控统计拦截的filters，去掉后监控界面sql无法统计，'wall'用于防火墙
      filters: stat,wall,logback
      # 通过connectProperties属性来打开mergeSql功能；慢SQL记录
      connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000

mybatis:
  # 实体类扫描
  #   type-aliases-package: com.ughen.saas.entity
  # 配置映射文件位置
  mapper-locations: classpath:mapper/*.xml
  # 开启驼峰匹配
  apUnderscoreToCamelCase: true
