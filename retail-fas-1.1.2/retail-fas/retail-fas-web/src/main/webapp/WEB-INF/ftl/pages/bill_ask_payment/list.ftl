<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>请款单</title>
<#include  "/WEB-INF/ftl/common/header.ftl" >
<script type="text/javascript" src="${resourcesUrl}/fas/resources/js/common/fas_common.js?version=${version}"></script>
<script type="text/javascript" src="${resourcesUrl}/fas/resources/js/common/fas_util.js?version=${version}"></script>
<script type="text/javascript" src="${resourcesUrl}/fas/resources/js/common/BillController.js?version=${version}"></script>
<script type="text/javascript" src="${resourcesUrl}/fas/resources/js/modules/bill_ask_payment/billAskPayment.js?version=${version}"></script>
</head>
<body>
<div class="easyui-panel" data-options="fit:true,border:false">
    <div id="mainTab" class="easyui-tabs" data-options="fit:true,border:false,plain:true" >
        <div data-options="title:'单据明细'">
            <div class="easyui-layout" data-options="fit:true">
                	<div data-options="region:'north',border:false">
                    	<@p.toolbar id="toor_bar" listData=[
                    	    {"id":"top_btn_add","title":"浏览","iconCls":"icon-search","action":"returnTab('mainTab', '单据列表')","type":0},
							{"id":"top_btn_add","title":"新增","iconCls":"icon-add","action":"billController.initAdd()","type":0},
							{"id":"top_btn_delete","title":"删除","iconCls":"icon-del","action":"billController.del()","type":0} ,
							{"id":"top_btn_save","title":"保存","iconCls":"icon-del-dtl","action":"billController.save()","type":0},
							{"id":"top_btn_aduit","title":"提交审批","iconCls":"icon-aduit","action":"billController.operate(1)","type":0} ,
							{"id":"top_btn_cancel","title":"撤销","iconCls":"icon-cancel","action":"billController.operate(0)","type":0} ,
							{"id":"top_btn_cancel1","title":"一级审批","iconCls":"icon-aduit","action":"billController.operate(2)","type":0},
							{"id":"top_btn_cancel2","title":"二级审批","iconCls":"icon-aduit","action":"billController.operate(3)","type":0},
							{"id":"top_btn_cancel3","title":"三级审批","iconCls":"icon-aduit","action":"billController.operate(4)","type":0},
							{"id":"top_btn_cancel4","title":"打回","iconCls":"icon-cancel","action":"billController.back(99)","type":0},
							{"id":"top_btn_back","title":"上单","iconCls":"icon-prev","action":"billController.upBill()","type":0} ,
							{"id":"top_btn_next","title":"下单","iconCls":"icon-next","action":"billController.downBill()","type":0},
							{"id":"top_btn_5","title":"审批日志","iconCls":"icon-cancel","action":"billController.toOperateLog(3)","type":0}
						
						 ]/>	
                    </div>
                    <div data-options="region:'center',border:false">
                    	<div class="easyui-layout" data-options="fit:true" id="subLayout">
			                <div data-options="region:'north',border:false">
		                	 	 <div class="search-div" data-options="fit:true">
			                        <#-- 主档信息  -->
			                        <form id="mainDataForm"  method="post">
			                        	 <input type="hidden" name="id" id="id">
			                        	 <input type="hidden" name="balanceType" id="balanceType" value="${balanceType}">	
			                        	 <table class="form-tb">
			                        	    <col width="120px"/>
			                        	 	<col />
			                        	 	<col width="120px"/>
			                        	 	<col />
			                        	 	<col width="120px"/>
			                        	 	<col />
			                               <tbody>
			                                    <tr>
			                                        <th>单据编号：</th>
			                                        <td><input class="easyui-validatebox  ipt"  name="billNo" id="billNo"/></td>
			                                        <th>单据状态：</th>
			                                        <td><input class="easyui-validatebox  ipt"  name="statusName" id="statusName"/><input type="hidden" name="status" id="status"/></td>
			                                    	<th>单据日期：</th>
			                                        <td><input class="easyui-datebox easyui-validatebox ipt" id="billDate" name="billDate" data-options="required:true"/></td>
			                                    </tr>
			                                    <tr>
			                                        <th>公司：</th>
			                                        <td <td><input class="easyui-validatebox  ipt"  iptSearch="company"  name="buyerName"    data-options="required:true"/><input type="hidden" name="buyerNo"  id="buyerNo"/></td>
			                                        <th>供应商：</th>
			                                        <td><input class="easyui-validatebox  ipt"  iptSearch="${salerIpt}"  name="salerName"   id="salerName" data-options="required:true"/><input type="hidden" name="salerNo" id="salerNo" /></td>
			                                    	<th>源单编码：</th>
			                                        <td><input class="easyui-validatebox  ipt" iptSearch name="balanceNo" id="refBillNo"/></td>
			                                    </tr>
			                                    <tr>
			                                        <th>币别：</th>
			                                        <td><input class="easyui-combobox  ipt" combobox="currency" name="currencyNo" id="currencyNo"  data-options="required:true"/></td>
			                                    	<th>请款金额：</th>
			                                        <td><input class="disableEdit ipt"  name="allAmount" id="allAmount"/></td>
			                                    </tr>
			                                    <tr>
			                                    	<th>备注：</th>
			                                        <td colspan ="5"><input class="easyui-validatebox  ipt"  id="remark" name="remark" style="width:99%"/></td>	 
		                                   		</tr>
			                                </tbody>
			                            </table>
									 </form>
			                    </div>
			               	</div>
			               	<div data-options="region:'center',border:false" style="height:350px;">
		                	 	<div id="dtlTab" class="easyui-tabs" data-options="fit:true,plain:true,border:false" >
		                		</div>
		                	</div>
			              </div>
	             	</div>
	                <div data-options="region:'south',border:false">
	                    <#include  "/WEB-INF/ftl/common/fas_bill_bottom.ftl">
	                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>