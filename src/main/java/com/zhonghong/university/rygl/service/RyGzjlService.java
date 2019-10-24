/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.rygl.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.service.CrudService;

import com.zhonghong.university.rygl.entity.RyGzjl;
import com.zhonghong.university.rygl.dao.IRyGzjlDao;

/**
 * <pre>
 * Service服务类
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
@Service
@Transactional(readOnly = true)
public class RyGzjlService extends CrudService<IRyGzjlDao,RyGzjl>{
	
	public RyGzjl get(String id) {
		return super.get(id);
	}
	
	public List<RyGzjl> findList(RyGzjl entity) {
		return super.findList(entity);
	}
	
	public Page<RyGzjl> findPage(RyGzjl entity) {
		return super.findPage(entity);
	}
	
	@Transactional(readOnly = false)
	public void save(RyGzjl entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public void insert(RyGzjl entity) {
		entity.preInsert();
		dao.insert(entity);
	}
	
	@Transactional(readOnly = false)
	public void update(RyGzjl entity) {
		entity.preUpdate();
		dao.update(entity);
	}
	
	@Transactional(readOnly = false)
	public void delete(RyGzjl entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				super.delete(entity);
			}
		}
	}

}
