

//初始化树控件  
function leftControllerMenu(url){
	$('#resourceTree').tree({
		checkbox: false, 
		url:url,
		onClick: function(node) {
			
			if(node.attributes.url != null && node.attributes.url != ""){
				 //parent.mbdif.location.href=node.attributes.url; // 注释by weihaijin  这里是原来的菜单触发方式
				// 1. 判断是否存在该Tab,存在就不新增 ,直接切换到指定页面
				// href:node.attributes.url,
				var temp=parent.mbdif.$('#centerFrame').tabs('exists',node.text);
				if(!temp){
					var url=node.attributes.url+'?moduleId='+node.id;
					parent.mbdif.$('#centerFrame').tabs('add',{
						title: node.text,
						content:' <iframe src="'+url+'" frameborder="0"  border="0" marginwidth="0" marginheight="0" scrolling="no"   style="width:100%;height:800px" ></iframe> ',
						closable: true
						
					});
				}else{
					parent.mbdif.$('#centerFrame').tabs('select',node.text); // 如果存在，就直接在那里面显示
				   
				}
				
				
			}else{
				
	
				
				$(this).tree('toggle', node.target);
			}
		},
		onContextMenu: function(e, node) {
			e.preventDefault();
			$('#resourceTree').tree('select', node.target);
			$('#mm').menu('show', {
				left: e.pageX,
				top: e.pageY
			});
		}
	});
}


//初始化树控件  
function leftTagsConetntMenu(url){
	$('#resourceTree').tree({
		checkbox: false, 
		url:url,
		onClick: function(node) {
			if(node.attributes.url != null && node.attributes.url != "")
				window.parent.tagscontentmbdif.location.href=node.attributes.url+"?id="+node.id;
		},
		onContextMenu: function(e, node) {
			
			e.preventDefault();
			$('#resourceTree').tree('select', node.target);
			$('#mm').menu('show', {
				left: e.pageX,
				top: e.pageY
			});
		}
	});
}

//初始化树控件  cascadeCheck:true,
function onloadResourceTree(url,checkbox){
	$('#resourceTree').tree({
		checkbox: (checkbox == null) ? true : checkbox,
		url:url,
		
		onClick: function(node) {
			loadNodeData(node.id);
		},
		onContextMenu: function(e, node) {
			e.preventDefault();
			$('#resourceTree').tree('select', node.target);
			$('#mm').menu('show', {
				left: e.pageX,
				top: e.pageY
			});
		}
	});
}

//	$(function() {
//		
//	});
	
	//重新加载
	function reload() {
		var node = $('#resourceTree').tree('getSelected');
		if (node) {
			$('#resourceTree').tree('reload', node.target);
		} else {
			$('#resourceTree').tree('reload');
		}
	}
	
	//获取子节点
	function getChildren() {
		var node = $('#resourceTree').tree('getSelected');
		if (node) {
			var children = $('#resourceTree').tree('getChildren', node.target);
		} else {
			var children = $('#resourceTree').tree('getChildren');
		}
		var s = '';
		for (var i = 0; i < children.length; i++) {
			s += children[i].text + ',';
		}
		alert(s);
	}
	
	//获取选中的节点(选中的checked)
	function getChecked() {
		var nodes = $('#resourceTree').tree('getChecked');
		var s = '';
		for (var i = 0; i < nodes.length; i++) {
			if (s != '') s += ',';
			s += nodes[i].text;
		}
		alert(s);
	}
	
	//获取选择的节点
	function getSelected() {
		var node = $('#resourceTree').tree('getSelected');
		alert(node.text);
	}
	
	//关闭头前节点
	function collapse() {
		var node = $('#resourceTree').tree('getSelected');
		$('#resourceTree').tree('collapse', node.target);
	}
	
	//展开当前节点
	function expand() {
		var node = $('#resourceTree').tree('getSelected');
		$('#resourceTree').tree('expand', node.target);
	}
	
	//关闭所有节点
	function collapseAll() {
		var node = $('#resourceTree').tree('getSelected');
		if (node) {
			$('#resourceTree').tree('collapseAll', node.target);
		} else {
			$('#resourceTree').tree('collapseAll');
		}
	}
	
	//展开所有节点
	function expandAll() {
		var node = $('#resourceTree').tree('getSelected');
		if (node) {
			$('#resourceTree').tree('expandAll', node.target);
		} else {
			$('#resourceTree').tree('expandAll');
		}
	}
	
	//增加子节点
	function append(data) {
		var node = $('#resourceTree').tree('getSelected');
		$('#resourceTree').tree('append', {
			parent: (node ? node.target: null),
			data:data
		});
	}
/**
	function append() {
		var node = $('#resourceTree').tree('getSelected');
		$('#resourceTree').tree('append', {
			parent: (node ? node.target: null),
			data: [{
				text: 'new1',
				checked: true
			},
			{
				text: 'new2',
				state: 'closed',
				children: [{
					text: 'subnew1'
				},
				{
					text: 'subnew2'
				}]
			}]
		});
	}
*/	
	//删除子节点
	function remove() {
		var node = $('#resourceTree').tree('getSelected');
		$('#resourceTree').tree('remove', node.target);
	}
	
	//修改节点
	function update() {
		var node = $('#resourceTree').tree('getSelected');
		if (node) {
			node.text = '<span style="font-weight:bold">new text</span>';
			node.iconCls = 'icon-save';
			$('#resourceTree').tree('update', node);
		}
	}
	
	//判断是否为子节点
	function isLeaf() {
		var node = $('#resourceTree').tree('getSelected');
		var b = $('#resourceTree').tree('isLeaf', node.target);
		return b;
	}
