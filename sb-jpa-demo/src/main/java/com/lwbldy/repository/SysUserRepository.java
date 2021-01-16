package com.lwbldy.repository;

import com.lwbldy.entity.User;
import com.lwbldy.entity.UserDO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SysUserRepository extends JpaRepository<User,Integer> {

}
