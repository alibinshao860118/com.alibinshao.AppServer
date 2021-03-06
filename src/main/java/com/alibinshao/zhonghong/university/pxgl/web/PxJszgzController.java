/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.alibinshao.zhonghong.university.pxgl.web;

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

import com.alibinshao.zhonghong.university.pxgl.entity.PxJszgz;
import com.alibinshao.zhonghong.university.pxgl.service.PxJszgzService;

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
@RequestMapping(value = "${adminPath}/pxgl/pxJszgz")
public class PxJszgzController extends BaseController{

	@Autowired
	private PxJszgzService pxJszgzService;
	
	/**
	 * 进入查询界面
	 * @param pxJszgz PxJszgz 
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param model Model
	 * @return String
	 */
	@RequiresPermissions("pxgl:pxJszgz:view")
	@RequestMapping(value = {"list"})
	public String list(PxJszgz pxJszgz, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("pxJszgz", pxJszgz);
		return "modules/pxgl/pxJszgz/pxJszgzList";
	}
	
	/**
	 * 查询
	 * @param pxJszgz PxJszgz 
	 * @param request
	 * @param response
	 * @return Page<PxJszgz>
	 */
	@RequiresPermissions("pxgl:pxJszgz:view")
	@RequestMapping(value = {"query"})
	@ResponseBody
	public Page<PxJszgz> query(PxJszgz pxJszgz,HttpServletRequest request, HttpServletResponse response) {
		Page<PxJszgz> page = this.pxJszgzService.findPage(pxJszgz); 
		return page;
	}
	
    /**
	 * 新增
	 * @param entity PxJszgz 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("pxgl:pxJszgz:edit")
	@RequestMapping(value = "insert")
	@ResponseBody
	public Map<String,Object> insert(PxJszgz entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.pxJszgzService.insert(entity);
		
		return result;
	}
	
	/**
	 * 修改
	 * @param entity PxJszgz 
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("pxgl:pxJszgz:edit")
	@RequestMapping(value = "update")
	@ResponseBody
	public Map<String,Object> update(PxJszgz entity) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success", "true");
		
		this.pxJszgzService.update(entity);
		
		return result;
	}
	
	/**
	 * 删除
	 * @param pxJszgz PxJszgz 
	 * @return String
	 */
	@RequiresPermissions("pxgl:pxJszgz:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public Map<String,Object> delete(PxJszgz entity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", true);
		
		this.pxJszgzService.delete(entity);
		
		return map;
	}

}
