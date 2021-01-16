package com.lwbldy.repository;

import com.lwbldy.entity.UserDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import org.junit.jupiter.api.Test;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@SpringBootTest
class UserRepositoryTest {

    @Autowired
    UserRepository userRepository;

    /**
     * 增加
     */
    @Test
	void save() {
        UserDO userDO = new UserDO();
        userDO.setLastLoginTime(new Date());
        userDO.setPassword("123456");
        userDO.setSex(1);
        userDO.setUserName("张三");
        userRepository.save(userDO);
        System.out.println(userDO.getId());
	}

    /**
     * 根据id查找
     */
    @Test
    void findById() {
        Optional<UserDO> optionalUserDO = userRepository.findById(1);
        if(optionalUserDO.isPresent()){
            UserDO userDO=optionalUserDO.get();
            System.out.println("testFind user"+userDO.getUserName());
        }
    }

    /**
     * 查找所有
     */
    @Test
    void testFindAll(){
        List<UserDO> listUserDO = userRepository.findAll();
        for (UserDO user:listUserDO) {
            System.out.println("user_name:"+user.getUserName()+"----"+user.getPassword());
        }
    }

    @Test
    void findByPrimary(){
//        //根据用户名查询
//        List<UserDO> list = userRepository.findByUserName("张三");
//        for (UserDO user:list) {
//            System.out.println("user_name:"+user.getUserName());
//        }
//        //查询 行数
//        int count =  userRepository.countByUserName("张三");
//        System.out.println("---------->>"+count);

        //模糊查询
//        List<UserDO> list = userRepository.findByUserNameLike("%李%");
//        for (UserDO user:list) {
//            System.out.println("user_name:"+user.getUserName());
//        }

        //多条件使用
//        List<UserDO> list = userRepository.findByUserNameAndPassword("张三",null);
//        for (UserDO user:list) {
//            System.out.println("user_name:"+user.getUserName());
//        }
    }

    @Test
    void findByQuerySQL(){
//        List<UserDO> list = userRepository.queryByUserNameAndPWD("%123%","张三");
        List<UserDO> list = userRepository.queryByUserNameAndPWD2("%123%","张三");
        for (UserDO user:list) {
            System.out.println("user_name:"+user.getUserName());
        }
    }

    @Test
    void testUpdatePWD(){
        int rowCom = userRepository.updatePWD("465665","张二");
        System.out.println(rowCom+"行，受影响");
    }


    /**
     * 更新
     */
    @Test
    void testUpdate(){
//        Optional<UserDO> optionalUserDO = userRepository.findById(2);
//        if(optionalUserDO.isPresent()){
//            UserDO userDO = optionalUserDO.get();
            UserDO userDO = new UserDO();
            userDO.setId(9);
            userDO.setUserName("fishpro001");
            userRepository.save(userDO);
            System.out.println("testFind user"+userDO.getUserName());
//        }
    }



    /**
     * 根据id删除
     */
    @Test
    void delete(){
        userRepository.deleteById(2);
    }

    @Test
    void testOneToOne(){

    }


}