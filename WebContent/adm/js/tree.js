/*
* JavaScript Library for Tree Component
*
*
* @author
*		Dion(Enet corp. Agent-Team). No rights reserved...
*/


/**
* Constant for Tree
*/

var TREE_NODE_ROOT_IMG = "/adm/manage/image/tree/Common_TreeNode_FolderRoot.gif";
var TREE_FOLDER_OPEN_IMG = "/adm/manage/image/tree/Common_TreeNode_FolderOpen.gif";
var TREE_FOLDER_CLOSED_IMG = "/adm/manage/image/tree/Common_TreeNode_FolderClosed.gif";

var TREE_LINE_OPEN_IMG = "/adm/manage/image/tree/Common_TreeNode_LineNodeOpen.gif";
var TREE_LINE_CLOSED_IMG = "/adm/manage/image/tree/Common_TreeNode_LineNodeClosed.gif";
var TREE_LINE_LAST_IMG = "/adm/manage/image/tree/Common_TreeNode_LineLast.gif";
var TREE_LINE_LAST_OPEN_IMG = "/adm/manage/image/tree/Common_TreeNode_LineLastOpen.gif";
var TREE_LINE_LAST_CLOSED_IMG = "/adm/manage/image/tree/Common_TreeNode_LineLastClosed.gif";

var TREE_LINE_NODE_IMG = "/adm/manage/image/tree/Common_TreeNode_LineNode.gif";
var TREE_LINE_VERT_IMG = "/adm/manage/image/tree/Common_TreeNode_LineVert.gif";
var TREE_LINE_BLANK = "/adm/manage/image/tree/Common_TreeNode_Blank.gif";

var TREE_NODE_LEAF_IMG = "/adm/manage/image/tree/Common_TreeNode_Note.gif";

var TREE_NODE_MMATOP_IMG= "/adm/manage/image/tree/MMAReport_Top_Root.gif";


/**
* Create Tree
*/
function Tree() {
	this.id = compManager.generateID();

	this.nodes = new Array();

	this.bgImage = null;

	this.addNode = treeAddNode;
	this.deleteNode = treeDeleteNode;
	this.toHTML = treeToHTML;
	this.draw = treeDraw;
	this.setTwoDepth = treeSetTwoDepth;

	this.bInheritAttribute = true;

	this.selectedNode = null;

	compManager.add(this);

	if(compManager.theme.treeBgColor) {

	}

}

function treeSetTwoDepth()
{
	TREE_NODE_ROOT_IMG = "/adm/manage/image/tree/Common_TreeNode_FolderRoot.gif";
	TREE_FOLDER_OPEN_IMG = "/adm/manage/image/tree/Common_TreeNode_FolderOpen.gif";
	TREE_FOLDER_CLOSED_IMG = "/adm/manage/image/tree/Common_TreeNode_FolderClosed.gif";

	TREE_LINE_OPEN_IMG = "/adm/manage/image/tree/Common_TreeNode_LineNodeOpen.gif";
	TREE_LINE_CLOSED_IMG = "/adm/manage/image/tree/Common_TreeNode_LineNodeClosed.gif";
	TREE_LINE_LAST_IMG = "/adm/manage/image/tree/Common_TreeNode_LineLast.gif";
	TREE_LINE_LAST_OPEN_IMG = "/adm/manage/image/tree/Common_TreeNode_LineLastOpen.gif";
	TREE_LINE_LAST_CLOSED_IMG = "/adm/manage/image/tree/Common_TreeNode_LineLastClosed.gif";

	TREE_LINE_NODE_IMG = "/adm/manage/image/tree/Common_TreeNode_LineNode.gif";
	TREE_LINE_VERT_IMG = "/adm/manage/image/tree/Common_TreeNode_LineVert.gif";
	TREE_LINE_BLANK = "/adm/manage/image/tree/Common_TreeNode_Blank.gif";

	TREE_NODE_LEAF_IMG = "/adm/manage/image/tree/Common_TreeNode_Note.gif";

	TREE_NODE_MMATOP_IMG= "/adm/manage/image/tree/MMAReport_Top_Root.gif";
}


/**
* Add Node tree tree
*/
function treeAddNode(objNode) {

	objNode.root = this;

	this.nodes[this.nodes.length] = objNode;

	objNode.idx = this.nodes.length-1;
}

/**
* Delete node
*/
function treeDeleteNode(objNode) {

    __deleteNode(this, objNode);

}


function __deleteNode(objParNode, objNode) {

    for(var i=0; i<objParNode.nodes.length; i++) {
        if(objParNode.nodes[i] == objNode) {

            var nodes = new Array();
            var ni = 0;
            for(var j=0; j<objParNode.nodes.length; j++) {
                if(i != j) {
                    nodes[ni] = objParNode.nodes[j];
                    nodes[ni].idx = ni;
                    ni++;
                }
            }
            objParNode.nodes = nodes;
            objParNode.getRootTree().selectedNode = null;
            return;

        }
    }

    for(var i=0; i<objParNode.nodes.length; i++) {
        __deleteNode(objParNode.nodes[i], objNode);
    }

}

/**
* Convert tree to HTML
*/
function treeToHTML() {

	var szHtml = "";

	for(var i=0; i<this.nodes.length; i++) {

		szHtml += this.nodes[i].toHTML();
	}


	return szHtml;



}


/**
* Draw tree
*/
function treeDraw() {

	/** Change Tree Color */
	if(self.location.href.indexOf("Tree.jsp") > 0) {
		self.document.body.style.backgroundColor = compManager.theme.treeBgColor;
		this.workAreaBgColor = compManager.theme.treeBgColor;
	}


	var szHtml = this.toHTML();
	document.write(szHtml);


}

/**
* Create Tree Node
*/
function TreeNode(text, fimage, oimage) {

	this.id = compManager.generateID();

	this.text = text;
	this.oimage = oimage;
	this.fimage = fimage;
	this.action = null;
	this.nodes = new Array();
	this.parent = null;

	this.tooltip = text;

	this.virtualNode = false;

	this.expanded = false;

	this.toHTML = treeNodeToHTML;
	this.addNode = treeNodeAddNode;
	this.depth = treeNodeDepth;
	this.hasChilds = treeNodeHasChilds;
	this.getSignImage = treeNodeGetSignImage;
	this.getFolderImage = treeNodeGetFolderImage;
	this.getRootNode = treeNodeGetRootNode;
	this.getRootTree = treeNodeGetRootTree;
	this.isLast = treeNodeIsLast;
	this.select = treeNodeSelect;
	this.deselect = treeNodeDeselect;
	this.expand = treeNodeExpand;
	this.shrink = treeNodeShrink;
	this.clone = treeNodeClone;

	compManager.add(this);
}


/**
* Add sub node to a node
*/
function treeNodeAddNode(objNode) {

	objNode.parent = this;

	this.nodes[this.nodes.length] = objNode;

	objNode.idx = this.nodes.length-1;

}

/**
* Get root tree
*/
function treeNodeGetRootTree() {

	var prev = this;
	var par = this.parent;
	while(par != null) {
		prev = par;
		par = par.parent;
	}

	return prev.root;
}


/**
* Get root node
*/
function treeNodeGetRootNode() {

	var prev = this;
	var par = this.parent;
	while(par != null) {
		prev = par;
		par = par.parent;
	}

	return prev;
}

/**
* Check if last node
*/
function treeNodeIsLast() {

	if(this.parent != null) {
		if(this.parent.nodes.length-1 == this.idx) {
			return true;
		} else {
			return false;
		}
	}

	return true;
}


/**
* Select this node
*/
function treeNodeSelect() {

	document.all[this.id + "_text"].style.color = this.selectedColor;
	document.all[this.id + "_text"].style.backgroundColor = this.selectedBgColor;

	document.all[this.id + "_folderimage"].src = this.oimage;

	this.getRootTree().selectedNode = this;
}

/**
* Deselect this node
*/
function treeNodeDeselect() {

	document.all[this.id + "_text"].style.color = this.color;
	document.all[this.id + "_text"].style.backgroundColor = this.workAreaBgColor;

	document.all[this.id + "_folderimage"].src = this.fimage;
}


/**
* Expand this node
*/
function treeNodeExpand() {

	this.expanded = true;

	if(this.hasChilds()) {
		document.all[this.id + "_signimage"].src = this.getSignImage();
	}

	try {

		/*
		for(var i=0; i<this.nodes.length; i++) {
			//document.all[this.nodes[i].id].style.display = "block";
			__treeNodeShowChild(this.nodes[i]);
		}
		*/
		document.all[this.id + "_child"].style.display = "block";
	} catch(e) {}


	if(this.onExpand) {

		execScripts(this.onExpand);
	}



}


function __treeNodeShowChild(objNode) {

	document.all[objNode.id].style.display = "block";
	for(var i=0; i<objNode.nodes.length; i++) {
		if(objNode.expanded) {
			__treeNodeShowChild(objNode.nodes[i]);
		}
	}
}


/**
* Shrink this node
*/
function treeNodeShrink() {

	this.expanded = false;

	if(this.hasChilds()) {
		document.all[this.id + "_signimage"].src = this.getSignImage();
	}
	try {
		/*
		for(var i=0; i<this.nodes.length; i++) {
			//document.all[this.nodes[i].id].style.display = "none";
			__treeNodeHideChild(this.nodes[i]);
		}
		*/
		document.all[this.id + "_child"].style.display = "none";
	} catch(e) {}
}


function __treeNodeHideChild(objNode) {

	document.all[objNode.id].style.display = "none";
	for(var i=0; i<objNode.nodes.length; i++) {

			__treeNodeHideChild(objNode.nodes[i]);

	}
}



/**
* get appropriate line image
*/
function treeNodeGetSignImage() {

	if(this.hasChilds()) {
		if(this.expanded) {
			if(this.isLast()) {
				return TREE_LINE_LAST_OPEN_IMG;
			} else {
				return TREE_LINE_OPEN_IMG;
			}

		} else {
			if(this.isLast()) {
				return TREE_LINE_LAST_CLOSED_IMG;
			} else {
				return TREE_LINE_CLOSED_IMG;
			}
		}


	} else {
		if(this.isLast()){
			return TREE_LINE_LAST_IMG;
		} else {
			return TREE_LINE_NODE_IMG;
		}
	}



}


/**
* get appropriate folder image
*/
function treeNodeGetFolderImage() {

	if(this.selected) return this.oimage;
	else return this.fimage;
}



/**
* Check if has child...
*/
function treeNodeHasChilds() {

	if(this.nodes.length == 0) return false;
	else return true;
}




/**
* calculate depth
*/
function treeNodeDepth() {
	var par = this.parent;
	var depth = 0;
	while(par != null) {
		depth++;
		par = par.parent;
	}

	return depth;
}


/**
* Clone this node
* only visible property is cloned...
*/
function treeNodeClone() {

	var newNode = new TreeNode(this.text, this.fimage, this.oimage);

	return newNode;
}


/**
* convert TreeNode to HTML
*/
function treeNodeToHTML() {

	var szHtml = "";


	if(this.virtualNode == true) { return szHtml; }

	var objRoot = this.getRootTree();

	if(objRoot.bInheritAttribute) {
		this.color = objRoot.color;
		this.bgColor = objRoot.bgColor;
		this.onColor = objRoot.onColor;
		this.onBgColor = objRoot.onBgColor;
		this.selectedColor = objRoot.selectedColor;
		this.selectedBgColor = objRoot.selectedBgColor;
		this.workAreaBgColor = objRoot.workAreaBgColor;
	}



	szHtml += "<table border=0 cellspacing=0 cellpadding=0 id=" + this.id + " style='background-color:" + this.workAreaBgColor + ";color:" + this.color +
				";border-width:0";
	/*
	if(this.parent != null && this.parent.expanded == false) {
		szHtml += ";display:none";
	}
	*/
	szHtml += "'>";

	szHtml += "<tr valign=middle>";

	var szLineImg = "";


	if(this.depth() != 0) {


		var iDepth = this.depth();
		var par = this.parent;

		for(var i=0; i<iDepth-1; i++) {

			if(par.isLast()) {
				szLineImg = "<td nowrap><img border=0 width=19 height=16  src=" + TREE_LINE_BLANK + "></td>" + szLineImg;
			} else {
				szLineImg = "<td nowrap><img width=19 height=16  src=" + TREE_LINE_VERT_IMG + "></td>" + szLineImg;
			}

			par = par.parent;

		}


		szHtml += szLineImg;

		szHtml += "<td nowrap valign=middle><img width=19 height=16  id=" + this.id + "_signimage src=" + this.getSignImage() +
					" onMouseOver=\"treeNodeOnMouseOver('" + this.id + "');return false;\"" +
					" onMouseOut=\"treeNodeOnMouseOut('" + this.id + "');return false;\"" +
					" onClick=\"treeNodeOnClick('" + this.id + "');return false;\""+
					"></td>";

	}


	szHtml += "<td nowrap><img width=19 height=16  id=" + this.id + "_folderimage src=" + this.getFolderImage() + " border=0" +
					" onMouseOver=\"treeNodeOnMouseOver('" + this.id + "');return false;\"" +
					" onMouseOut=\"treeNodeOnMouseOut('" + this.id + "');return false;\""+
					" onClick=\"treeNodeOnClick('" + this.id + "');return false;\"" +
					"></td>";


	szHtml += "<td nowrap><div id=" + this.id + "_text title='" + this.tooltip + "'" +
					" onMouseOver=\"treeNodeOnMouseOver('" + this.id + "');return false;\"" +
					" onMouseOut=\"treeNodeOnMouseOut('" + this.id + "');return false;\"" +
					" onClick=\"treeNodeOnClick('" + this.id + "');return false;\"" +
					" onDblClick=\"treeNodeOnDblClick('" + this.id + "');return false;\"" +
					" onContextMenu=\"treeNodeOnContextMenu('" + this.id + "');return false;\"" +
					">" + this.text +
					"</div></td>";

	szHtml += "</tr></table>";



	if(this.expanded) szHtml += "<div id=" + this.id + "_child style='margin:0;padding:0'>";
	else szHtml += "<div id=" + this.id + "_child style='margin:0;padding:0;display:none;'>";

	for(var i=0; i<this.nodes.length; i++){
		szHtml += this.nodes[i].toHTML();
	}

	szHtml += "</div>";

	return szHtml;

}

function treeNodeOnMouseOver(id) {

	var nodeComp = compManager.get(id);
	var node = document.all[id];


	if(nodeComp != nodeComp.getRootTree().selectedNode) {
		document.all[id + "_text"].style.color = nodeComp.workAreaOnColor;
	}
	document.all[id].style.cursor = "hand";


	if(nodeComp.onMouseOver) {
		execScripts(nodeComp.onMouseOver);
	}


	event.cancelBubble = nodeComp.cancelBubble;

}


function treeNodeOnMouseOut(id) {

	var nodeComp = compManager.get(id);
	var node = document.all[id];

	if(nodeComp != nodeComp.getRootTree().selectedNode) {
		document.all[id + "_text"].style.color = nodeComp.color;
	}
	document.all[id].style.cursor = "default";


	if(nodeComp.onMouseOut) {
		execScripts(nodeComp.onMouseOut);
	}


	event.cancelBubble = nodeComp.cancelBubble;

}


function treeNodeOnClick(id) {

	var nodeComp = compManager.get(id);
	var node = document.all[id];

	if(event.srcElement.id == id+"_text") {

		if(nodeComp.getRootTree().selectedNode != null) {
			nodeComp.getRootTree().selectedNode.deselect();
		}

		nodeComp.select();

		if(nodeComp.action != null) {
			execScripts(nodeComp.action);
		}

	} else if(event.srcElement.id == id + "_signimage" ||
				event.srcElement.id == id + "_folderimage") {


		if(nodeComp.root) {

	    }
		else {
    		if(nodeComp.expanded) nodeComp.shrink();
    		else nodeComp.expand();
        }
	}


	if(nodeComp.onClick) {
		execScripts(nodeComp.onClick);
	}


	event.cancelBubble = nodeComp.cancelBubble;

	return false;

}


function treeNodeOnDblClick(id) {

	var nodeComp = compManager.get(id);
	var node = document.all[id];

	if(nodeComp.root) return;

	if(event.srcElement.id == id+"_text") {

		if(nodeComp.expanded) nodeComp.shrink();
		else { nodeComp.expand(); }
	}


	if(nodeComp.onDblClick) {
		execScripts(nodeComp.onDblClick);
	}


	event.cancelBubble = nodeComp.cancelBubble;


	return false;
}




function treeNodeOnContextMenu(id) {

	var objNodeComp = compManager.get(id);
	
	if(objNodeComp.context) {
		
		objNodeComp.context.target = objNodeComp;
		objNodeComp.context.show();
		
		if(objNodeComp.getRootTree().selectedNode != null) {
			objNodeComp.getRootTree().selectedNode.deselect();
		}
		
		
		if(objNodeComp.action && objNodeComp != objNodeComp.getRootTree().selectedNode) {
			execScripts(objNodeComp.action);
		}

		objNodeComp.select();


	}


	if(objNodeComp.onContextMenu) {
		execScripts(objNodeComp.onContextMenu);

	}


	event.cancelBubble = true;

	return false;
}

function execScripts(scripts){

	if (window.execScript){
		window.execScript(scripts);
	} else {
		var head = document.getElementsByTagName('head')[0];
		var scriptElement = document.createElement('script');
		scriptElement.setAttribute('type', 'text/javascript');
		scriptElement.innerText = scripts;
		head.appendChild(scriptElement);
		head.removeChild(scriptElement);
	}
}