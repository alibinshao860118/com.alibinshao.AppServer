package com.zhonghong.university.zp.entity;

import com.zhonghong.fdp.common.persistence.DataEntity;

import lombok.Data;

@Data
public class ZpVO extends DataEntity<ZpVO>{

	String name ;//名称
	
	String zfzjhm ;//身份证件号码
	
}
