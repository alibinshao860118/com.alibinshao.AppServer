/**
 * Copyright &copy; 2012-2017 <a href="http://www.zhonghong.com">zhonghong</a> All rights reserved.
 */
package com.zhonghong.university.htgl.dao;

import com.zhonghong.fdp.common.persistence.CrudDao;
import com.zhonghong.fdp.common.persistence.annotation.MyBatisDao;
import com.zhonghong.university.htgl.entity.HtHtxx;

/**
 * <pre>
 * DAO接口
 * </pre>
 * @author liangbinbin 
 * @version 1.00.00
 * <pre>
 * 修改记录
 *    修改后版本:     修改人：  修改日期:     修改内容: 
 * </pre>
 */
 @MyBatisDao
public interface IHtHtxxDao extends CrudDao<HtHtxx>{

	/**
	 * 还原或者终止合同
	 * @param entity
	 */
	void updateHtzt(HtHtxx entity);


}
