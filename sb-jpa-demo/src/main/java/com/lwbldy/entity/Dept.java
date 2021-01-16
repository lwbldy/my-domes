package com.lwbldy.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

/**
 * 部门
 */
@Entity
@Table(name="sys_dept")
public class Dept implements Serializable {
    @Id
    @Column(name = "dept_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer deptSort;

    private String name;

    @OneToMany(mappedBy = "dept")
    private Set<User> users;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getDeptSort() {
        return deptSort;
    }

    public void setDeptSort(Integer deptSort) {
        this.deptSort = deptSort;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }
}
