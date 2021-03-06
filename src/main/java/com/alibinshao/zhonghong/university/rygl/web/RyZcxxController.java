/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.rygl.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibinshao.zhonghong.fdp.common.persistence.Page;
import com.alibinshao.zhonghong.fdp.common.web.BaseController;

import com.alibinshao.zhonghong.university.rygl.entity.RyZcxx;
import com.alibinshao.zhonghong.university.rygl.service.RyZcxxService;

/**
 * <pre>
 * Controller控制层类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
@Controller
@RequestMapping(value = "${adminPath}/rygl/ryZcxx")
public class RyZcxxController extends BaseController{

	@Autowired
	private RyZcxxService ryZcxxService;
	
	/**
	 * 进入查询界面
	 * @param ryZcxx RyZcxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("rygl:ryZcxx:view")
	@RequestMapping(value = {"list"})
	public String list(RyZcxx ryZcxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("ryZcxx", ryZcxx);
		return "modules/rygl/ryZcxx/ryZcxxList";
	}
	
	/**
	 * 进入查询界面
	 * @param ryZcxx RyZcxx 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("rygl:ryZcxx:view")
	@RequestMapping(value = {"toView"})
	public String toView(RyZcxx ryZcxx, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("ryZcxx", ryZcxx);
		return "modules/rygl/ryZcxx/ryZcxxListView";
	}
	
	/**
	 * 查询
	 * @param ryZcxx RyZcxx 
	 * @param request
	 * @param response
	 * @return Page<RyZcxx>
	 */
	@RequiresPermissions("rygl:ryZcxx:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<RyZcxx> query(RyZcxx ryZcxx,HttpServletRequest request, HttpServletResponse response) {
		Page<RyZcxx> page = this.ryZcxxService.findPage(ryZcxx); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity RyZcxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("rygl:ryZcxx:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(RyZcxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.ryZcxxService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity RyZcxx 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("rygl:ryZcxx:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(RyZcxx entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.ryZcxxService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param ryZcxx RyZcxx 
	 * @return String
	 */
	@RequiresPermissions("rygl:ryZcxx:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(RyZcxx entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.ryZcxxService.delete(entity);
		
		return map;
	}

}
