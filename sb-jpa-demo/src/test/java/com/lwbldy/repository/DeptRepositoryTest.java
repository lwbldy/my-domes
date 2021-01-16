package com.lwbldy.repository;

import com.lwbldy.entity.Dept;
import com.lwbldy.entity.Role;
import com.lwbldy.entity.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.LinkedHashSet;
import java.util.Optional;
import java.util.Set;

@SpringBootTest
class DeptRepositoryTest {

    @Autowired
    DeptRepository deptRepository;

    @Autowired
    SysUserRepository sysUserRepository;

    @Autowired
    RoleRepository roleRepository;

    @Test
    void testSave(){
        Dept dept = new Dept();
        dept.setName("技术部");
        dept.setDeptSort(10);
        deptRepository.save(dept);
    }

    @Test
    void testSaveOuther(){

        Dept dept = new Dept();
        dept.setName("技术部");
        dept.setDeptSort(10);
        deptRepository.save(dept);

        Role role1 = new Role();
        role1.setRoleName("角色1");

        Role role2 = new Role();
        role2.setRoleName("角色2");

        roleRepository.save(role1);
        roleRepository.save(role2);

        Set<Role> roles = new LinkedHashSet<Role>();
        roles.add(role1);
        roles.add(role2);

        User user = new User();
        user.setNickName("昵称1");
        user.setEmail("lwbldy@163.com");
        user.setDept(dept);
        user.setRoles(roles);
        user.setPhone("15070784873");
        sysUserRepository.save(user);

    }


    @Test
    void testSaveSysUser(){
//        Optional<Dept> optional = deptRepository.findById(1);
//        if(optional.isPresent()){
//            Dept dept = optional.get();
            Dept dept = new Dept();
            dept.setId(2L);
            User user = new User();
//            user.setDept(dept);
            user.setEmail("lwbldy@163.com");
            user.setNickName("张三");
            sysUserRepository.save(user);

//        }
    }

}