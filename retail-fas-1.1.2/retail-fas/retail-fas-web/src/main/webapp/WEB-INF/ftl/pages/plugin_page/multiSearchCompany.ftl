<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north',border:false" class="toolbar-region">
			  <table width="100%">
				<tr class="datagrid-toolbar">
					<td>
					 <@p.toolbar id="companySearchTool" listData=[ 
		   				 {"id":"dgSelectorSearchBtn","title":"查询","iconCls":"icon-search","type":0},
		   				 {"id":"dgSelectorClearBtn","title":"清空","iconCls":"icon-remove","type":0},
		   				 {"id":"dgSelectorSureBtn","title":"确定","iconCls":"icon-ok", "type":0}
					  ]/>
					</td>
				</tr>
			</table>	
		</div>
		<div  data-options="region:'center',border:false">
			<div class="easyui-layout" data-options="fit:true" id="subLayout">
				<div data-options="region:'north',border:false" >
					<div class="search-div">
							 <form name="dialog_SarchForm" id="dialog_SarchForm" method="post">
							 	<input type="hidden" name="params" value="${RequestParameters['params']!''}" id="params"/>
							 	<table class="form-tb">
								     <col width="80" />
					                 <col />
					                 <col width="80" />
					                 <tbody>
								    		<tr>
						       		 			<th>公司编码：</th>
						       		 			<td><input class="easyui-validatebox ipt" name="companyNo" id="companyNoCodeCondition"/></td>
						       		 			<th>公司名称：</th>
						       		 			<td><input class="easyui-validatebox ipt"  name="name" id="nameCondition"/></td>
						       		 		</tr>
								    </tbody>
							   </table>
							</form>
					</div>
			</div>
			<div data-options="region:'center',border:false">
				<@p.datagrid id="dialog_SearchDataGrid"  loadUrl="" saveUrl=""  defaultColumn="" 
				                   isHasToolBar="false" height="415" divToolbar="" onClickRowEdit="false" pagination="true"
				                   rownumbers="true" singleSelect = "true"
					               columnsJsonList="[
					               	  {field : 't',checkbox:true,width : 30},
					                  {field : 'companyNo',title : '公司编码',width : 100,align:'left'},
					                  {field : 'name',title : '公司名称',width : 260,align:'left'}
					                 ]" 
								/>
			</div>
		</div>
	</div>
</div>
   