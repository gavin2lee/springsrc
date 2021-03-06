package cn.wonhigh.retail.fas.service;

import java.util.List;
import java.util.Map;

import cn.wonhigh.retail.fas.common.model.Brand;

import com.yougou.logistics.base.common.exception.ServiceException;
import com.yougou.logistics.base.service.BaseCrudService;

/**
 * 请写出类的用途 
 * @author ouyang.zm
 * @date  2014-08-25 13:52:36
 * @version 1.0.0
 * @copyright (C) 2013 YouGou Information Technology Co.,Ltd 
 * All Rights Reserved. 
 * 
 * The software for the YouGou technology development, without the 
 * company's written consent, and any other individuals and 
 * organizations shall not be used, Copying, Modify or distribute 
 * the software.
 * 
 */
public interface BrandService extends BaseCrudService {

	String queryBrandNameByNo(String brandNo) throws ServiceException;

	List<Brand> findAllBrandWithoutPermission() throws ServiceException;
	
	/**
	 * 查询品牌及其品牌部
	 * @param params
	 * @return
	 * @throws ServiceException
	 */
	public List<Brand> selectBrandWithBrandUnit(Map<String, Object> params) throws ServiceException;
	
}