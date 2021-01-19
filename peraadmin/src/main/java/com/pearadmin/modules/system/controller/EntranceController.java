package com.pearadmin.modules.system.controller;

import com.pearadmin.common.plugins.system.service.SystemInfoService;
import com.pearadmin.common.plugins.system.vo.SystemInfo;
import com.pearadmin.common.tools.security.SecurityUtil;
import com.pearadmin.common.web.domain.response.Result;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.pearadmin.common.plugins.logging.annotation.Logging;
import com.pearadmin.common.plugins.logging.enums.BusinessType;
import com.pearadmin.common.web.base.BaseController;
import org.springframework.web.servlet.ModelAndView;
import com.pearadmin.modules.system.domain.SysUser;
import org.springframework.ui.Model;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Describe: 入 口 控 制 器
 * Author: 就 眠 仪 式
 * CreateTime: 2019/10/23
 * */
@RestController
@RequestMapping
public class EntranceController extends BaseController {

    @Autowired
    SystemInfoService systemInfoService;

    /**
     * Describe: 获取登录视图
     * Param: ModelAndView
     * Return: 登录视图
     * */
    @GetMapping("login")
    public ModelAndView login(){
        return JumpPage("login");
    }

    /**
     * Describe: 获取主页视图
     * Param: ModelAndView
     * Return: 登录视图
     * */
    @GetMapping("index")
    @Logging(title = "主页",describe = "返回 Index 主页视图",type = BusinessType.ADD)
    public ModelAndView index(Model model)
    {
        SysUser sysUser = (SysUser) SecurityUtil.currentUser().getPrincipal();
        model.addAttribute("userInfo",sysUser);
        return JumpPage("index");
    }

    /**
     * 关闭网站
     * @return
     */
    @GetMapping("sys/close_web")
//    @PreAuthorize("hasPermission('/sys/close_web','sys:close_web')")
    public Result closeWEB(HttpSession session){
        Boolean isClose = (Boolean)session.getServletContext().getAttribute("isClose");
        if(isClose == null || isClose == true){
            isClose = false;
            session.getServletContext().setAttribute("isClose",isClose);
            return success("关闭成功");
        }else{
            isClose = true;
            session.getServletContext().setAttribute("isClose",isClose);
            return success("开启成功");
        }
    }


    /**
     * Describe: 获取主页视图
     * Param: ModelAndView
     * Return: 主页视图
     * */
    @GetMapping("console")
    public ModelAndView home()
    {
        return JumpPage("console/console");
    }

    @PostMapping("console")
    public Result console()
    {
        SystemInfo systemInfo = systemInfoService.getSystemInfo();
        return success(systemInfo);
    }



    /**
     * Describe:无权限页面
     * Return:返回403页面
     * */
    @GetMapping("error/403")
    public ModelAndView noPermission(){
        return JumpPage("error/403");
    }

    /**
     * Describe:找不带页面
     * Return:返回404页面
     * */
    @GetMapping("error/404")
    public ModelAndView notFound(){
        return JumpPage("error/404");
    }

    /**
     * Describe:异常处理页
     * Return:返回500界面
     * */
    @GetMapping("error/500")
    public ModelAndView onException(){
        return JumpPage("error/500");
    }

}
