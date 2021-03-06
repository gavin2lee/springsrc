package cn.wonhigh.retail.fas.service;

import java.util.List;
import java.util.Map;

import cn.wonhigh.retail.fas.common.model.SelfShopBankInfo;
import cn.wonhigh.retail.fas.dal.database.SelfShopBankInfoMapper;
import com.yougou.logistics.base.dal.database.BaseCrudMapper;
import com.yougou.logistics.base.service.BaseCrudServiceImpl;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 * 请写出类的用途 
 * @author zhouxm
 * @date  2014-10-10 11:20:13
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
@Service("selfShopBankInfoService")
class SelfShopBankInfoServiceImpl extends BaseCrudServiceImpl implements SelfShopBankInfoService {
    @Resource
    private SelfShopBankInfoMapper selfShopBankInfoMapper;

    @Override
    public BaseCrudMapper init() {
        return selfShopBankInfoMapper;
    }

	@Override
	public List<SelfShopBankInfo> queryListShopBankInfoByShopNos(
			Map<String, Object> maps) {
		// TODO Auto-generated method stub
		return selfShopBankInfoMapper.queryListShopBankInfoByShopNos(maps);
	}
}