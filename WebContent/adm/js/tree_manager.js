/**
* JavaScript Library for Component Manager and variosu Themes
*
* @author
	Dion (E-net Agent Team). No rights reserved. It's totally free...
*/




/**
* Theme has following /adm/manage/image/../image/
*		color, bgColor, onColor, onBgColor, selectedColor, selectedBgColor
*		borderColor, borderWidth, padding
*		componentBorderWidth
*
* You can create Your own Theme and apply it to compManager
*
*/

/** system-defined icons */

/** report icon */
var REPORT_ICON = "/adm/manage/image/image/tree/SiteReport_Report.gif";

/** Data Icon */
var DATA_ICON = "/adm/manage/image/image/tree/Common_Data.gif";


/** System Defined Buttons */
var ADD_BUTTON = "/adm/manage/image/image/tree/Common_Add.gif";
var DELETE_BUTTON = "/adm/manage/image/image/tree/Common_Delete.gif";
var PROPERTY_BUTTON = "/adm/manage/image/image/tree/Common_Property.gif";
var OK_BUTTON = "/adm/manage/image/image/tree/Common_Ok.gif";
var CANCEL_BUTTON = "/adm/manage/image/image/tree/Common_Cancel.gif";
var EDIT_BUTTON = "/adm/manage/image/image/tree/Common_Edit.gif";
var FIND_BUTTON = "/adm/manage/image/image/tree/Common_Find.gif";
var DOWNLOAD_EXCEL_BUTTON = "/adm/manage/image/image/tree/Common_Download_Excel.gif";
var HELP_BUTTON = "/adm/manage/image/image/tree/Common_Help.gif";
var NEXT_BUTTON = "/adm/manage/image/image/tree/Common_Next.gif";
var PREV_BUTTON = "/adm/manage/image/image/tree/Common_Prev.gif";
var CHANGENAME_BUTTON = "/adm/manage/image/image/tree/Common_ChangeName.gif";
var MERGE_FRAME_BUTTON = "/adm/manage/image/image/tree/Common_Merge_Frame.gif";
var DIVIDE_FRAME_BUTTON = "/adm/manage/image/image/tree/Common_Divide_Frame.gif";
var PRINT_BUTTON = "/adm/manage/image/image/tree/Common_Print.gif";
var SAVE_BUTTON = "/adm/manage/image/image/tree/Common_Save.gif";
var SAVEAS_BUTTON = "/adm/manage/image/image/tree/Common_SaveAs.gif";
var SMALLER_BUTTON = "/adm/manage/image/image/tree/Common_Smaller.gif";
var LARGER_BUTTON = "/adm/manage/image/image/tree/Common_Larger.gif";
var OPEN_BUTTON ="/adm/manage/image/image/tree/Common_Open.gif";
var EXECUTE_BUTTON = "/adm/manage/image/image/tree/Common_Ok.gif";
var CLOSE_BUTTON = "/adm/manage/image/image/tree/Common_Close.gif";

var ADD_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_Add.gif";
var EDIT_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_Edit.gif";
var MODIFY_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_Modify.gif";
var DELETE_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_Delete.gif";
var CANCEL_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_Cancel.gif";
var VIEW_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_View.gif";
var UP_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_Up.gif";
var DOWN_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_Down.gif";
var SAVE_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_Save.gif";
var SELECT_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_Select.gif";
var SEARCH_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_Search.gif";
var OK_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_OK.gif";
var INIT_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_Init.gif";
var REGISTER_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_Register.gif";
var SERVERSTART_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_ServerStart.gif";
var SERVERSTOP_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_ServerStop.gif";
var EXAMINE_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_Examine.gif";
var NEXT_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_Next.gif";
var PREV_BUTTONICON = "/adm/manage/image/image/tree/Common_Button_Prev.gif";



var DATA_LIST = "/adm/manage/image/image/tree/Common_List_Data.gif";
var DATASELECTED_LIST = "/adm/manage/image/image/tree/Common_List_DataSelected.gif";
var USER_LIST = "/adm/manage/image/image/tree/Common_List_User.gif";
var USERSELECTED_LIST = "/adm/manage/image/image/tree/Common_List_UserSelected.gif";
var MESSAGE_LIST = "/adm/manage/image/image/tree/Common_List_Message.gif";
var MESSAGESELECTED_LIST = "/adm/manage/image/image/tree/Common_List_MessageSelected.gif";


/** ClassWindow Theme */
function ClassicWindowTheme() {

	this.color = "black";
	this.bgColor = "lightgrey";
	this.onColor = "darkBlue";
	this.onBgColor = "lightgrey";
	this.selectedColor = "white";
	this.selectedBgColor = "darkBlue";


	this.contextColor = "red";
	this.contextBgColor = "white";

	this.darkBgColor = "darkgray";

	this.borderColor = "black";
	this.borderWidth = 1;

	this.workAreaOnColor = "red";
	this.workAreaBgColor = "white";


	this.componentBorderWidth = 1;

	this.padding = 2;
	this.margin = 0;

}


/** GloomyRain Theme */
function GloomyRainTheme() {

	this.color = "black";
	this.bgColor = "steelBlue";
	this.onColor = "white";
	this.onBgColor = "steelBlue";
	this.selectedColor = "white";
	this.selectedBgColor = "darkSlateBlue";

	this.borderColor = "darkSlateblue";
	this.borderWidth = 1;

	this.darkBgColor = "lightBlue";

	this.contextColor = "red";
	this.contextBgColor = "white";



	this.workAreaOnColor = "red";
	this.workAreaBgColor = "white";


	this.menuSelectSound = null;
	this.sideBarSelectSound = null;

	this.componentBorderWidth = 1;

	this.padding = 1;
	this.margin = 1;


}


/** B2C Analyzer Theme */
function B2CAnalyzerTheme() {

	this.color = "black";
	this.bgColor = "#D5CFC4";
	this.onColor = "darkBlue";
	this.onBgColor = "#D5CFC4";
	this.selectedColor = "white";
	this.selectedBgColor = "#44576A";

	/** Colors for ContextMenu */
	this.contextColor = "red";
	this.contextBgColor = "white";

	this.darkBgColor = "darkgray";

	this.borderColor = "black";
	this.borderWidth = 1;

	/**  /adm/manage/image/../image/ for Sidebar */
	this.sidebarTitleBgColor = "#6A6756";
	this.sidebarTitleSelectedBgColor = "#221911";
	this.sidebarTitleSelectedColor = "#FFFFFF";
	this.sidebarTitleColor = "#F5F1CC";
	this.sidebarBorderWidth = 0;
	this.sidebarBgColor = "#D2CAB9";
	this.sidebarIconBgColor = "#D2CAB9";
	this.sidebarIconSelectedBgColor = "#F7F3E7";
	this.sidebarIconSelectedColor = "black";


	/** /adm/manage/image/../image/ for Title Button */
	this.titleButtonBgColor = "#FFAF40";
	this.titleButtonColor = "black";

	/** /adm/manage/image/../image/ for Tree */
	this.treeBgColor = "#FCFCF7";
	/* this.treeBgColor = "#FFFBF7"; */

	/**  Work Area color */
	this.workAreaOnColor = "red";
	this.workAreaBgColor = "white";


	/*	Attribute for Table	*/
	this.tableMouseOverBgcolor = "#D6D198";
	this.tableMouseOverFontcolor = "#2F2C25";
	this.tableMouseClickBgcolor = "#44576A";
	this.tableMouseClickFontcolor = "#FFFDE7";
	this.tableTDBgcolor = "#F4F1CB";
	this.tablbTDFontcolor = "#2F2C25";
	this.tableTDObjectBgcolor = "#F3F3F3";

	this.componentBorderWidth = 1;

	this.padding = 2;
	this.margin = 0;

}



/** Create ComponentManager */
function ComponentManager() {


	this.theme = new ClassicWindowTheme();

	this.comps = new Array();
	this.add = addComponent;
	this.get = getComponent;
	this.generateID = generateID;
	this.hideMenus = compManagerHideMenus;
}


/**
* Add Component
*/
function addComponent(objComp) {

	var theme = this.theme;
	objComp.color = theme.color;
	objComp.bgColor = theme.bgColor;
	objComp.onColor = theme.onColor;
	objComp.onBgColor = theme.onBgColor;
	objComp.selectedColor = theme.selectedColor;
	objComp.selectedBgColor = theme.selectedBgColor;
	objComp.contextColor = theme.contextColor;
	objComp.contextBgColor = theme.contextBgColor;

	objComp.borderColor = theme.borderColor;
	objComp.borderWidth = theme.borderWidth;

	objComp.workAreaOnColor = theme.workAreaOnColor;
	objComp.workAreaBgColor = theme.workAreaBgColor;

	objComp.componentBorderWidth = theme.componentBorderWidth;

	objComp.padding = theme.padding;
	objComp.margin = theme.margin;


	objComp.cancelBubble = false;

	this.comps[this.comps.length] = objComp;
}


/**
* Get Component for given id
*/
function getComponent(id) {

	for(i=0; i<this.comps.length; i++){
		if(id == this.comps[i].id) return this.comps[i];
	}

	return null;

}


/**
* Generate Unique ID
*/
function generateID() {

	return "COMP_" + this.comps.length
}


/**
* Hide menus
*/
function compManagerHideMenus() {

	var srcElement = event.srcElement;
	
	__compManagerHideMenus(top, srcElement);
	
	return true;

}


function __compManagerHideMenus(par, srcElement) {

	if(par.compManager) {
		try {
			for(var i=0; i<par.compManager.comps.length; i++) {
				if(par.compManager.comps[i].hideOnClick == true) {
					par.compManager.comps[i].hide(srcElement);
				}
			}
		} catch(e) {}
	}


	for(var i=0; i<par.frames.length; i++){
		__compManagerHideMenus(par.frames[i], srcElement);
	}
}



/** Create Default ComponentManager */
var compManager = new ComponentManager();
compManager.theme = new B2CAnalyzerTheme();

