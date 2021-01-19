package com.pearadmin.modules.system.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pearadmin.common.web.domain.request.PageDomain;
import com.pearadmin.modules.system.domain.SysDept;
import com.pearadmin.modules.system.mapper.SysDeptMapper;
import com.pearadmin.modules.system.service.ISysDeptService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service
public class SysDeptServiceImpl implements ISysDeptService {

    /**
     * 注入部门服务
     * */
    @Resource
    private SysDeptMapper sysDeptMapper;

    /**
     * Describe: 查询部门数据
     * Param: QueryRoleParam
     * Return: 操作结果
     * */
    @Override
    public List<SysDept> list(SysDept param) {
        return sysDeptMapper.selectList(param);
    }

    /**
     * Describe: 查询部门数据 分页
     * Param: QueryRoleParam
     * Return: 操作结果
     * */
    @Override
    public PageInfo<SysDept> page(SysDept param, PageDomain pageDomain) {
        PageHelper.startPage(pageDomain.getPage(),pageDomain.getLimit());
        List<SysDept> list = sysDeptMapper.selectList(param);
        return new PageInfo<>(list);
    }

    /**
     * Describe: 保存部门数据
     * Param: SysDept
     * Return: 操作结果
     * */
    @Override
    public boolean save(SysDept sysDept) {
        int result = sysDeptMapper.insert(sysDept);
        if(result>0){
            return true;
        }else{
            return false;
        }
    }

    /**
     * Describe: 根据 ID 查询部门
     * Param: id
     * Return: 返回部门信息
     * */
    @Override
    public SysDept getById(String id) {
        return sysDeptMapper.selectById(id);
    }

    /**
     * Describe: 修改用户数据
     * Param: SysUser
     * Return: 操作结果
     * */
    @Override
    public boolean update(SysDept sysDept) {
        Integer result = sysDeptMapper.updateById(sysDept);
        if(result > 0){
            return true;
        }else{
            return false;
        }
    }

    /**
     * Describe: 根据 id 删除部门数据
     * Param: id
     * Return: Boolean
     * */
    @Override
    public Boolean remove(String id) {
        int result = sysDeptMapper.deleteById(id);
        if(result>0){
            return true;
        }else{
            return false;
        }
    }

    /**
     * Describe: 根据 id 批量删除部门数据
     * Param: ids
     * Return: Boolean
     * */
    @Override
    public boolean batchRemove(String[] ids) {
        int result = sysDeptMapper.deleteByIds(ids);
        if(result>0){
            return true;
        }else{
            return false;
        }
    }
}
