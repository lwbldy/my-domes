package com.lwbldy.repository;

import com.lwbldy.entity.UserDO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

/**
 * 包含基本的增删查改功能
 */
@Repository
public interface UserRepository extends JpaRepository<UserDO,Integer> {

    /**
     * 根据用户名查找
     * @param userName
     * @return
     */
    List<UserDO> findByUserName(String userName);

    /**
     * 统计用户名
     * @param userName
     * @return
     */
    int countByUserName(String userName);

    /**
     * 模糊查询
     * @param userName
     * @return
     */
    List<UserDO> findByUserNameLike(String userName);


    /**
     * 多条件 and 使用
     * @param userName
     * @param password
     * @return
     */
    List<UserDO> findByUserNameAndPassword(String userName,String password);


    /**
     * 使用 占位符查询
     * 有nativeQuery = true时，是可以执行原生sql语句
     * @param pwd
     * @param userName
     * @return
     */
    @Query(value = "SELECT * FROM t_user WHERE `password` LIKE ?1 AND user_name = ?2", nativeQuery=true)
    List<UserDO> queryByUserNameAndPWD(String pwd,String userName);

    /**
     * 参数绑定
     * @param pwd
     * @param userName
     * @return
     */
    @Query(value = "SELECT * FROM t_user WHERE `password` LIKE :pwd AND user_name = :userName", nativeQuery=true)
    List<UserDO> queryByUserNameAndPWD2(@Param("pwd")String pwd, @Param("userName")String userName);

    /**
     * 更新
     * @param pwd
     * @param userName
     * @return
     */
    @Modifying // 更新，修改必须添加
    @Query(value = "UPDATE t_user SET `password` = ?1 WHERE user_name=?2", nativeQuery=true)
    @Transactional //事务提交
    int updatePWD(String pwd,String userName);
}
