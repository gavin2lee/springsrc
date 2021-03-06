package cn.wonhigh.retail.fas.manager.scheduler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.jmx.export.annotation.ManagedResource;
import org.springframework.stereotype.Service;

import cn.wonhigh.retail.fas.common.constans.CommonConstants;
import cn.wonhigh.retail.fas.common.model.Company;
import cn.wonhigh.retail.fas.manager.CompanyManager;
import cn.wonhigh.retail.fas.manager.FinancialAccountManager;
import cn.wonhigh.retail.fas.manager.PeriodBalanceManager;

import com.yougou.logistics.base.common.enums.JobBizStatusEnum;
import com.yougou.logistics.base.common.exception.ManagerException;
import com.yougou.logistics.base.common.interfaces.RemoteJobServiceExtWithParams;
import com.yougou.logistics.base.common.model.JobBizLog;
import com.yougou.logistics.base.common.vo.scheduler.RemoteJobInvokeParamsDto;

/**
 * 累计欠客销售生成
 * @author wang.xy
 *
 */
@Service
@Deprecated
@ManagedResource(objectName = CommonConstants.SYS_NAME + "BackOrderSales", description = StringUtils.EMPTY)
public class BackOrderSalesScheduler implements RemoteJobServiceExtWithParams {

	private static final Logger log = Logger.getLogger(BackOrderSalesScheduler.class);

	@Resource
	private CompanyManager companyManager;
	
	@Resource
	private PeriodBalanceManager periodBalanceManager;
	
    @Resource
	private FinancialAccountManager financialAccountManager;
    
	/**
	 * 调度错误日志
	 */
	private static final List<JobBizLog> JOB_BIZ_LOG = new ArrayList<JobBizLog>();

	/**
	 * 调度执行状态
	 */
	private static JobBizStatusEnum jobBizStatusEnum;

	@Override
	public void executeJobWithParams(String jobId, String triggerName, String groupName,
			RemoteJobInvokeParamsDto remoteJobInvokeParamsDto) {
		try {
			//定时任务执行的时间是凌晨，需要更新上一天的成本
			Calendar cal = Calendar.getInstance();

			Map<String, Object> paramsMap = new HashMap<String, Object>();
			paramsMap.put("year", String.valueOf(cal.get(Calendar.YEAR)));
			paramsMap.put("month", String.valueOf(cal.get(Calendar.MONTH) + 1));
			paramsMap.put("lastMonthDate", cal.getActualMaximum(Calendar.DAY_OF_MONTH));
			
			List<Company> companies = companyManager.findAllCompanyWithoutPermission();
			//承担总部职能公司
			String financialAccounts = financialAccountManager.findLeadRoleCompanyNos();
			
			for (Company company : companies) {
				//承担总部职能公司跳过
				if (financialAccounts.contains(company.getCompanyNo())) {
					continue;
				}
				paramsMap.put("companyNo", company.getCompanyNo());
				
				periodBalanceManager.generateCompanyOwerGuest(paramsMap);
			}
			
		} catch (ManagerException e) {
			// 如果异常传JobBizLog对象到Scheduler
			log.debug("生成成本的调度任务调用GMS接口异常。。。。", e);
		}
	}

	@Override
	public JobBizStatusEnum getJobStatus(String jobId, String arg0, String arg1) {

		return jobBizStatusEnum;
	}

	@Override
	public String getLogs(String jobId, String triggerName, String groupName, long lastDate) {

		String listStr = "[]";
		List<JobBizLog> list = JOB_BIZ_LOG;
		JobBizLog jobBizLog = new JobBizLog();
		jobBizLog.setGroupName(groupName);
		jobBizLog.setTriggerName(triggerName);
		jobBizLog.setRemark("拉远程日志48");
		jobBizLog.setType("INTERRUPTED");
		// GMT时间
		jobBizLog.setGmtDate(new Date().getTime());
		JOB_BIZ_LOG.add(jobBizLog);
		
		if (list.size() == 0) {
			return listStr;
		}
		Iterator<JobBizLog> it = list.iterator();
		while (it.hasNext()) {
			JobBizLog log = it.next();
			if (null != log.getGmtDate() && log.getGmtDate() <= lastDate) {
				it.remove();
			}
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			listStr = mapper.writeValueAsString(list);
		} catch (JsonGenerationException e) {
			log.error("给调度框架传数据报错！", e);
		} catch (JsonMappingException e) {
			log.error("给调度框架传数据报错！", e);
		} catch (IOException e) {
			log.error("给调度框架传数据报错！", e);
		}
		return listStr;

	}

	@Override
	public void initializeJob(String jobId, String arg0, String arg1) {

	}

	@Override
	public void pauseJob(String jobId, String arg0, String arg1) {

	}

	@Override
	public void restartJob(String jobId, String arg0, String arg1) {

	}

	@Override
	public void resumeJob(String jobId, String arg0, String arg1) {

	}

	@Override
	public void stopJob(String jobId, String arg0, String arg1) {

	}

}
