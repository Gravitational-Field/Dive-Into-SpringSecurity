package com.lzj.security.config;



//import javax.sql.DataSource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;

import javax.sql.DataSource;
import java.util.Arrays;

/**
 * @ClassName AppWebSecurityConfig
 * @Description: TODO
 * @Author Keen
 * @DATE 2021/4/30 10:42
 * @Version 1.0
 **/
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class AppWebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;
    @Autowired
    UserDetailsService userDetailsService;
    /*@Autowired
    PasswordEncoder passwordEncoder;*/
    /**
    * @author: Keen
    * @Description: 实验:一：对静态资源放行
    */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //super.configure(http);  取消默认配置
        //实验一：授予首页和静态资源访问权限
        /*http.authorizeRequests().antMatchers("/layui/**","/index.jsp")
                .permitAll().anyRequest().authenticated();  //对所有请求授权，匹配上的资源放行，剩余的的资源必须认证*/

        //实验六：授权访问  对角色授权
        http.authorizeRequests().antMatchers("/layui/**","/index.jsp").permitAll()
                //.antMatchers("/level1/**").hasRole("学徒")   //这里是有一定关系的
                //.antMatchers("/level2/**").hasRole("大师")
                //.antMatchers("/level3/1").hasAuthority("葵花宝典")
                //.antMatchers("/level3/**").hasRole("宗师")
                .anyRequest().authenticated();


        //实验七： 自定义拒绝访问页面 403错误码
        http.exceptionHandling().accessDeniedPage("/unauth.html");


        //实验二：无权访问页面，设定去往默认登录页  (有权访问，但是资源不存在的报404 NOT FOUND错误，需要后续额外特殊处理)
        //http.formLogin();  //默认登录页
        http.formLogin().loginPage("/index.jsp")  //自定义登录页
                        .loginProcessingUrl("/doLogin")  //   往/doLogin提交   不指定默认为/login
                        .usernameParameter("loginacct")
                        .passwordParameter("userpswd")
                        .defaultSuccessUrl("/main.html");  //默认的成功的跳转页面

        //http.csrf().disable(); //禁用csrf
        http.logout().logoutUrl("/logout").logoutSuccessUrl("/index.jsp");

        //实验八： 记住我功能
        //http.rememberMe(); //基于cookie的记住我
        // create table persistent_logins (username varchar(64) not null, series varchar(64) primary key,token varchar(64) not null, last_used timestamp not null)
        JdbcTokenRepositoryImpl ptr = new JdbcTokenRepositoryImpl();  //基于数据库
        ptr.setDataSource(dataSource);
        http.rememberMe().tokenRepository(ptr);

    }


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        //super.configure(auth);
        //实验四：自定义认证用户信息   在内存中进行授权（并不需要在数据库中有）
        /*auth.inMemoryAuthentication()
            .withUser("zhangsan").password("123456").roles("学徒","大师")
                .and()
                .withUser("lisi").password("123456").authorities("罗汉拳","武当长拳");*/


        //通过数据库进行授权
        //auth.userDetailsService(userDetailsService);  //默认采用明文进行对比
        //auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);  //自定义的密码编码器
        auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder());

        // zhangwuji    123456可登录
    }

}
