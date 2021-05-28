package com.lzj.security.component;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

/**
 * @ClassName PasswordEncoderImpl
 * @Description: TODO
 * @Author Keen
 * @DATE 2021/5/4 11:08
 * @Version 1.0
 **/
@Component
public class PasswordEncoderImpl implements PasswordEncoder {
    @Override
    public String encode(CharSequence rawPassword) {
        return MD5Util.digest(rawPassword.toString());
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        return encodedPassword.equals(encode(rawPassword));
    }

    //$2a$10$LDUykcKoOIVYnHHy3oWpPOJFDmRfWlBoZhzW/lnglGECCjhR6PkC6
    //$2a$10$CDOuIuNV.uvCdVUM4Z6gtOL2t9erag2U..unte1nzalVOJ6bfXGU6
    //$2a$10$giZPa0AfO4Urb5NoIi/JHOOcGj9PVG51Co6eonRHENcPZCi0UsyBq
    public static void main(String[] args) {
        String str = "123456";
        System.out.println(new BCryptPasswordEncoder().encode(str));

        new Object()
    }
}
