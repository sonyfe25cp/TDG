package com.omartech.tdg.utils;

public class ProductStatus {
	
	public final static int InProductCreation = 1; //产品信息创建中,用户创建，但没有提交翻译
	
	public final static int InEnglishDisplay = 2; //英文刊登完成；用户提交要求翻译
	
	public final static int InTranslation = 3; //翻译中；已分配给翻译人员
	
	public final static int TranslationComplete = 4; //翻译完成；翻译人员翻译完成
	
	public final static int ChinaListingCreated = 5; //中文刊登完成；管理员确认已翻译完成
	
	public final static int Sellable = 6; // 可售；管理员确认可以售卖
	
	public final static int UnsellableWithChinaListing = 7;//已中文刊登但不可售
	
	public final static int OK = 8;//ok，brand翻译专用
}
