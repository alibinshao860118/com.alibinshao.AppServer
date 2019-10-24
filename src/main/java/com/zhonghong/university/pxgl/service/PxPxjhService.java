/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.pxgl.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhonghong.fdp.common.persistence.Page;
import com.zhonghong.fdp.common.service.CrudService;

import com.zhonghong.university.pxgl.entity.PxPxjh;
import com.zhonghong.university.pxgl.dao.IPxPxjhDao;

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
public class PxPxjhService extends CrudService<IPxPxjhDao,PxPxjh>{
	
	public PxPxjh get(String id) {
		return super.get(id);
	}
	
	public List<PxPxjh> findList(PxPxjh entity) {
		return super.findList(entity);
	}
	
	public Page<PxPxjh> findPage(PxPxjh entity) {
		return super.findPage(entity);
	}
	
	@Transactional(readOnly = false)
	public void save(PxPxjh entity) {
		super.save(entity);
	}
	
	@Transactional(readOnly = false)
	public void insert(PxPxjh entity) {
		entity.preInsert();
		dao.insert(entity);
	}
	
	@Transactional(readOnly = false)
	public void update(PxPxjh entity) {
		entity.preUpdate();
		dao.update(entity);
	}
	
	@Transactional(readOnly = false)
	public void delete(PxPxjh entity) {
		if(StringUtils.isNotEmpty(entity.getIds())){
			String[] ids = entity.getIds().split("&amp;");
			for (String id : ids) {
				entity.setId(id);
				super.delete(entity);
			}
		}
	}

}
