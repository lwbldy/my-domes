# sb-jpa-demo
使用 jpa 连接数据库，进行操作的例子和笔记



##  导入jpa 依赖

```xml
		<dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
```

## 创建 实体类

```java
package com.lwbldy.entity;


import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="t_user")
public class UserDO {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(name="user_name",length = 200)
    private String userName;

    @Column(name="password",length = 200)
    private String password;

    @Column(name="sex")
    private Integer sex;

    @Column(name="last_login_time")
    private Date lastLoginTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

}

```



## 配置数据源

```yaml
# 配置数据源
spring:
  datasource:
    url: jdbc:mysql://127.0.0.1:3306/testjpa?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
    username: root
    password: root
    driver-class-name: com.mysql.cj.jdbc.Driver
  jpa:
    hibernate:
      #自动更新|创建表,当 值为create的时候，自动创建表
      ddl-auto: update
    # 日志中显示sql 语句
    show-sql: true
    # 默认创建表的时候，使用  InnoDB
    database-platform: org.hibernate.dialect.MySQL5InnoDBDialect
    # 格式化sql语句
    properties:
      hibernate:
        format_sql: true
```



## 创建 Repository 

```java
package com.lwbldy.repository;

import com.lwbldy.entity.UserDO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

/**
 * 包含基本的增删查改功能
 */
@Repository
public interface UserRepository extends JpaRepository<UserDO,Integer>,JpaSpecificationExecutor<UserDO> {
}


```



## 测试

```java
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
            System.out.println("user_name:"+user.getUserName());
        }
    }

    @Test
    void findByPrimary(){
        userRepository.findAll();
    }

    /**
     * 更新
     */
    @Test
    void testUpdate(){
        Optional<UserDO> optionalUserDO = userRepository.findById(2);
        if(optionalUserDO.isPresent()){
            UserDO userDO = optionalUserDO.get();
            userDO.setUserName("fishpro002");
            userRepository.save(userDO);
            System.out.println("testFind user"+userDO.getUserName());
        }
    }



    /**
     * 根据id删除
     */
    @Test
    void delete(){
        userRepository.deleteById(2);
    }


}
```



## 注解



### @Entity

> @Entity说明这个class是实体类，并且使用默认的orm规则，即class名对应数据库表中表名，class字段名即表中的字段名。 
> （如果想改变这种默认的orm规则，就要使用@Table来改变class名与数据库中表名的映射规则，@Column来改变class中字段名与db中表的字段名的映射规则）
>
> 元数据属性说明： 
> • name: 表名

```java
@Entity(name=”Customer”)
    public class Customer { ... }
```





### @Table

> able用来定义entity主表的name，catalog，schema等属性。
>
> 元数据属性说明： 
> • name: 表名 
> • catalog: 对应关系数据库中的catalog 
> • schema：对应关系数据库中的schema 
> • UniqueConstraints:定义一个UniqueConstraint数组，指定需要建唯一约束的列

```java
@Entity
    @Table(name="CUST")
    public class Customer { ... }
```



### @Column

> Column元数据定义了映射到数据库的列的所有属性：列名，是否唯一，是否允许为空，是否允许更新等。
>
> 元数据属性说明： 
> 从定义可以看出，@Column注解一共有10个属性，这10个属性均为可选属性，各属性含义分别如下：
> **name**属性定义了被标注字段在数据库表中所对应字段的名称；
> **unique**属性表示该字段是否为唯一标识，默认为false。如果表中有一个字段需要唯一标识，则既可以使用该标记，也可以使用@Table标记中的@UniqueConstraint。
> **nullable**属性表示该字段是否可以为null值，默认为true。
> **insertable**属性表示在使用“INSERT”脚本插入数据时，是否需要插入该字段的值。
> **updatable**属性表示在使用“UPDATE”脚本插入数据时，是否需要更新该字段的值。insertable和updatable属性一般多用于只读的属性，例如主键和外键等。这些字段的值通常是自动生成的。
> **columnDefinition**属性表示创建表时，该字段创建的SQL语句，一般用于通过Entity生成表定义时使用。（也就是说，如果DB中表已经建好，该属性没有必要使用。）
> **table**属性定义了包含当前字段的表名。
> **length**属性表示字段的长度，当字段的类型为varchar时，该属性才有效，默认为255个字符。
> **precision**属性和**scale**属性表示精度，当字段类型为double时，precision表示数值的总长度，scale表示小数点所占的位数。



```java
public class Person {
    @Column(name = "PERSONNAME", unique = true, nullable = false, updatable = true)
    private String name;
 
    @Column(name = "PHOTO", columnDefinition = "BLOB NOT NULL", secondaryTable="PER_PHOTO")
    private byte[] picture;
```



### @Id

> ## 标注用于声明一个实体类的属性映射为数据库的主键列。



### @GeneratedValue

> ## 用于标注主键的生成策略，通过strategy 属性指定。
>
> 默认情况下，JPA 自动选择一个最适合底层数据库的主键生成策略：SqlServer对应identity，MySQL 对应 auto increment。 
> 在javax.persistence.GenerationType中定义了以下几种可供选择的策略： 
> –IDENTITY：采用数据库ID自增长的方式来自增主键字段，Oracle 不支持这种方式； 
> –AUTO： JPA自动选择合适的策略，是默认选项； 
> –SEQUENCE：通过序列产生主键，通过@SequenceGenerator 注解指定序列名，MySql不支持这种方式 
> –TABLE：通过表产生主键，框架借由表模拟序列产生主键，使用该策略可以使应用更易于数据库移植。



```java
@Entity
    @Table(name = "OTASK")
    public class Task {
	  @Id
      @GeneratedValue
	  public Integer getId() {
		  return id;
	  }
    }
```



### @OneToOne

 >@OneToOne描述一个 一对一的关联
 >
 >元数据属性说明： 
 >• fetch：表示抓取策略，默认为FetchType.LAZY 
 >• cascade：表示级联操作策略

```java
@OneToOne(fetch=FetchType,cascade=CascadeType)
```



### @ManyToOne

> @ManyToOne表示一个多对一的映射,该注解标注的属性通常是数据库表的外键.
>
> 元数据属性说明： 
> • optional：是否允许该字段为null，该属性应该根据数据库表的外键约束来确定，默认为true 
> • fetch：表示抓取策略，默认为FetchType.EAGER 
> • cascade：表示默认的级联操作策略，可以指定为ALL，PERSIST，MERGE，REFRESH和REMOVE中的若干组合，默认为无级联操作 
> • targetEntity：表示该属性关联的实体类型。该属性通常不必指定，ORM框架根据属性类型自动判断targetEntity。

```java
@ManyToOne(fetch=FetchType,cascade=CascadeType)
```



### @OneToMany

> @OneToMany描述一个 一对多的关联,该属性应该为集体类型,在数据库中并没有实际字段。
>
> 元数据属性说明： 
> • fetch：表示抓取策略,默认为FetchType.LAZY,因为关联的多个对象通常不必从数据库预先读取到内存 
> • cascade：表示级联操作策略,对于OneToMany类型的关联非常重要,通常该实体更新或删除时,其关联的实体也应当被更新或删除
>
> 例如： 
> 实体User和Order是OneToMany的关系，则实体User被删除时，其关联的实体Order也应该被全部删除



### @ManyToMany

> @ManyToMany 描述一个多对多的关联.多对多关联上是两个一对多关联,但是在ManyToMany描述中,中间表是由ORM框架自动处理
>
> 元数据属性说明： 
> • targetEntity:表示多对多关联的另一个实体类的全名,例如:package.Book.class 
> • mappedBy:表示多对多关联的另一个实体类的对应集合属性名称
>
> 两个实体间相互关联的属性必须标记为@ManyToMany,并相互指定targetEntity属性, 
> 需要注意的是,有且只有一个实体的@ManyToMany注解需要指定mappedBy属性,指向targetEntity的集合属性名称 
> 利用ORM工具自动生成的表除了User和Book表外,还自动生成了一个User_Book表,用于实现多对多关联



### mappedBy 属性

> **mappedBy`是OneToOne、OneToMany和ManyToMany这三种关联关系的属性。**
>
> 用来标注拥有这种关系的字段。 除非关系是单向的，否则是必需的。

```java
//------关联dept----------------
	@OneToMany(mappedBy = "dept")
    private Set<User> users;


	@ManyToOne
    private Dept dept;

//-----------关联 roles---------------
    @ManyToMany
    @JoinTable(
            name = "user_roles", // 关联表名称
            joinColumns = {@JoinColumn(name = "role_id")}, //本表在中间表的外键名称
            inverseJoinColumns = {@JoinColumn(name = "user_id")} //另一个表在中间表的外键名称。
    )
    private Set<Role> roles;

    @ManyToMany(mappedBy = "roles")
    private Set<User> users;

```





### IdClass

> 当entity class使用复合主键时，需要定义一个类作为id class。 
> id class必须符合以下要求: 
> 类必须声明为public，并提供一个声明为public的空构造函数。 
> 必须实现Serializable接口，覆写 equals() 和 hashCode()方法。 
> entity class的所有id field在id class都要定义，且类型一样。
>
> 元数据属性说明： 
> • value: id class的类名

```java
public class EmployeePK implements java.io.Serializable{
       String empName;
       Integer empAge;
 
       public EmployeePK(){}
 
       public boolean equals(Object obj){ ......}
       public int hashCode(){......}
    }
 
 
    @IdClass(value=com.acme.EmployeePK.class)
    @Entity(access=FIELD)
    public class Employee {
        @Id String empName;
        @Id Integer empAge;
    }
```





### PrimaryKeyJoinColumns

> 如果entity class使用了复合主键，指定单个PrimaryKeyJoinColumn不能满足要求时，可以用PrimaryKeyJoinColumns来定义多个PrimaryKeyJoinColumn。
>
> 元数据属性说明： 
> • value: 一个PrimaryKeyJoinColumn数组，包含所有PrimaryKeyJoinColumn。
>
> 下面的代码说明了Employee和EmployeeInfo是一对一关系。他们都使用复合主键，建表时需要在Employee表建立一个外键，从Employee的主键列id,name指向EmployeeInfo的主键列INFO_ID和INFO_NAME.



### 详细参考 ： https://blog.csdn.net/yiyelanxin/article/details/100107335



## 查询

### 自定义根据字段名查询（自动实现）

```java
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
```

参考：https://blog.csdn.net/thousa_ho/article/details/74355752

| Keyword           | Sample                          | JPQL                                                       |
| ----------------- | ------------------------------- | ---------------------------------------------------------- |
| And               | findByLastnameAndFirstname      | where x.lastname=?1 and x.firstname=?2                     |
| Or                | findByLastnameOrFirstname       | where x.lastname=?1 or x.firstname=?2                      |
| Between           | findByStartDateBetween          | where x.startDate between ?1 and ?2                        |
| LessThan          | findByAgeLessThan               | where x.startDate < ?1                                     |
| GreaterThan       | findByAgeGreaterThan            | where x.startDate >?1                                      |
| After             | findByStartDateAfter            | where x.startDate >n ?1                                    |
| Before            | findByStartDateBefore           | where x.startDate < ?1                                     |
| IsNull            | findByAgeIsNull                 | where x.age is null                                        |
| IsNotNull,NotNull | findByAge(Is)NotNull            | where x.age not null                                       |
| Like              | findByFirstnameLike             | where x.firstname like ?1                                  |
| notLike           | findByFirstnameNotLike          | where x.firstname not like ?1                              |
| StartingWith      | findByFirstnameStartingWithXXX  | where x.firstname like ?1(parameter bound with appended %) |
| EndingWith        | findByFirstnameEndingWithXXX    | where x.firstname like ?1(parameter bound with appended %) |
| Containing        | findByFirstnameContaining       | where x.firstname like ?1(parameter bound wrapped in %)    |
| OrderBy           | findByAgeOrderByLastname        | where x.age = ?1 order by x.lastname desc                  |
| Not               | findByLastnameNot               | where x.lastname <> ?1                                     |
| NotIn             | findByAgeNotIn(Collection age ) | where x.age not in ?1                                      |
| True              | findByActiveTrue()              | where x.active = true                                      |
| False             | findByActiveFalse()             | where x.active = false                                     |



## JPA 注解

```java
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
```



## 对应关系

## @OneToOne 一对一关联

```java
package com.lwbldy.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="sys_user")
public class User implements Serializable {

    @Id
    @Column(name = "user_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nickName;

    private String email;

    private String phone;

    /**
     * 一个用户 对应 一个部门
     */
    @OneToOne
    private Dept dept;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }
}

```



## @OneToMany 一对多

```java
@OneToMany(mappedBy = "dept")
private Set<User> users;
```

> 使用 OneToMany 的 mappedBy 属性
>
> `mappedBy`是OneToOne、OneToMany和ManyToMany这三种关联关系的属性。
>
> 用来标注拥有这种关系的字段。 除非关系是单向的，否则是必需的。
>
> 什么叫拥有关联关系呢，假设是双向一对一的话，那么拥有关系的这一方有建立、解除和更新与另一方关系的能力。而另一方没有，只能被动管理。
>
> 由于`JoinTable`和`JoinColumn`一般定义在拥有关系的这一端，而`mappedBy`一定是定义在关系的被拥有方（the owned side），也就是跟定义`JoinTable`
>
> 和`JoinColumn`互斥的一方，它的值指向拥有方中关于被拥有方的字段，可能是一个对象（`OneToMany`），也可能是一个对象集合（`ManyToMany`）。





## @ManyToOne 多对一

详细看上面

```java
//------关联dept----------------
	@OneToMany(mappedBy = "dept")
    private Set<User> users;


	@ManyToOne
    private Dept dept;

//-----------关联 roles---------------

@Entity
@Table(name = "role")
public class Role implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String roleName;

    @ManyToMany(mappedBy = "roles")
    private Set<User> users;
}


@Entity
@Table(name="sys_user")
public class User implements Serializable {

    @Id
    @Column(name = "user_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nickName;

    private String email;

    private String phone;

    /**
     * 一个用户 对应 一个部门
     */
    @ManyToOne
    private Dept dept;

    @ManyToMany
    @JoinTable(
            name = "user_roles", // 关联表名称
            joinColumns = {@JoinColumn(name = "user_id")}, //本表在中间表的外键名称
            inverseJoinColumns = {@JoinColumn(name = "role_id")} //另一个表在中间表的外键名称。
    )
    private Set<Role> roles;
}
```

### 测试类

```java
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
```





