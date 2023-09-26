# dajungWorld

dajungWorld/src/main/webapp/WEB-INF/spring/root-context.xml 파일은 기능구현상 저의 이메일주소와 패스워드가 들어가있으므로 커밋하지 않았습니다.
이 프로젝트 실행을 원하시는 경우 위 경로에 새로운 root-context.xml을 생성해 주신뒤 아래와 같이 복사하여 넣어주세요.


<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans https://www.springframework.org/schema/beans/spring-beans.xsd">
	
	<!-- Root Context: defines shared resources visible to all other web components -->
		
	<bean id ="dataSource" class = "org.springframework.jdbc.datasource.DriverManagerDataSource">
		<property name  = "driverClassName" value = "oracle.jdbc.driver.OracleDriver"/>
		<property name  = "url" value = "jdbc:oracle:thin:@localhost:1521:xe"/>
		<property name  = "username" value = "aws01"/>
		<property name  = "password" value = "aws01"/>
	</bean>
		
	<bean id = "sqlSessionFactory"
			class = "org.mybatis.spring.SqlSessionFactoryBean">
			<property name="dataSource" ref = "dataSource"/>
			<property name="typeAliasesPackage" value = "com.dajung.dajungworld.dto" />
			<property name="mapperLocations" value = "classpath:com/dajung/dajungworld/mapper/*.xml"/>												
	</bean>
	
	<bean id="sqlSession" class = "org.mybatis.spring.SqlSessionTemplate">
		<constructor-arg name ="sqlSessionFactory" ref = "sqlSessionFactory"/>
	</bean>
		
		
	 <!--(7/5) navermail설정 -->
    <bean id="mailSender" class="org.springframework.mail.javamail.JavaMailSenderImpl"> 
     <property name="host" value="smtp.naver.com"/> <!-- 메이서버 호스트 -->
     <property name="port" value="465"/> <!-- 메이서버 포트번호 -->
     <property name="username" value=""/> <!-- value 에 자신의 이메일 아이디 -->
     <property name="password" value=""/> <!-- value 에 자신의 비밀번호 -->
       <!-- 보안연결 SSL과 관련된 설정 -->
     <property name="javaMailProperties">
      <props>
      <prop key="mail.smtp.auth">true</prop>
      <prop key="mail.smtp.starttls.enable">true</prop>
      <prop key="mail.smtps.checkserveridentity">true</prop>
      <prop key="mail.smtps.ssl.trust">*</prop>
      <prop key="mail.debug">true</prop>
      <prop key="mail.smtp.socketFactory.class">javax.net.ssl.SSLSocketFactory</prop>
      </props>
     </property>
    </bean>	
		
		
		
		
		
		
		
</beans>
