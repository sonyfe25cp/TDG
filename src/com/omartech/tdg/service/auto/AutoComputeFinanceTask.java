package com.omartech.tdg.service.auto;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.omartech.tdg.model.Seller;
import com.omartech.tdg.model.Translator;
import com.omartech.tdg.service.FinanceService;
import com.omartech.tdg.service.TranslatorAuthService;
import com.omartech.tdg.service.seller.SellerAuthService;

@Configuration
@EnableScheduling
public class AutoComputeFinanceTask  {
	
	@Autowired
	private SellerAuthService sellerAuthService;
	@Autowired
	private TranslatorAuthService translatorAuthService;
	@Autowired
	private FinanceService financeService;
	
	
	/**
	 * 每天1点启动，计算对帐单
	 * 上月1-14号定期计算卖家的钱
	 * 每月15号启动
	 */
	@Scheduled(cron="0 46 20 * * ?")
	public void computeSellerFirst(){
		List<Seller> sellers = sellerAuthService.getSellerListByPage(null);
		for(Seller seller : sellers){
			Calendar now = Calendar.getInstance(); 
			System.out.println("begin to compute seller : "+ seller.getEmail() +" at "+now.getTime());
			/**
			 * 符合要求的日期
			 */
//			Calendar beg = Calendar.getInstance();
//			beg.set(Calendar.MONTH, beg.get(Calendar.MONTH)-1);
//			beg.set(Calendar.DATE, 1);
//			Date begin = beg.getTime();
//			
//			Calendar ed = Calendar.getInstance();
//			ed.set(Calendar.MONTH, ed.get(Calendar.MONTH)-1);
//			ed.set(Calendar.DATE, 15);
//			Date end = ed.getTime();
			
			
			Date begin = null;
			Date end = null;
			
			int weekNum = now.get(Calendar.DAY_OF_WEEK);
			if(weekNum == Calendar.MONDAY || weekNum == Calendar.THURSDAY){
				Calendar beg = Calendar.getInstance();
				Calendar ed = Calendar.getInstance();
				if(weekNum == Calendar.MONDAY){//周四，周5，周6，周7
					beg.set(Calendar.DATE, beg.get(Calendar.DATE) - 4);
					beg.set(Calendar.HOUR_OF_DAY, 0);
					beg.set(Calendar.MINUTE, 0);
					beg.set(Calendar.SECOND, 0);
					beg.set(Calendar.MILLISECOND, 0);
					
					ed.set(Calendar.HOUR_OF_DAY, 0);
					ed.set(Calendar.MINUTE, 0);
					ed.set(Calendar.SECOND, 0);
					ed.set(Calendar.MILLISECOND, 0);
				}else if(weekNum == Calendar.THURSDAY){//周1，周2， 周3
					beg.set(Calendar.DATE, beg.get(Calendar.DATE) - 3);
					beg.set(Calendar.HOUR_OF_DAY, 0);
					beg.set(Calendar.MINUTE, 0);
					beg.set(Calendar.SECOND, 0);
					beg.set(Calendar.MILLISECOND, 0);
					
					ed.set(Calendar.HOUR_OF_DAY, 0);
					ed.set(Calendar.MINUTE, 0);
					ed.set(Calendar.SECOND, 0);
					ed.set(Calendar.MILLISECOND, 0);
				}
				begin = beg.getTime();
				end = ed.getTime();
				
				/**
				 * 测试用日期
				 */
				System.out.println("begin: "+ begin +" end: "+end);
				
				int userId = seller.getId();
				financeService.computeForSeller(begin, end, userId);
			}
		}
	}
	/**
	 * 上月15-本月1号定期计算卖家的钱
	 * 每月1号启动
	 */
//	@Scheduled(cron="0 0/3 1 * * ?")
	public void computeSellerLast(){
		List<Seller> sellers = sellerAuthService.getSellerListByPage(null);
		for(Seller seller : sellers){
			System.out.println("begin to compute seller : "+ seller.getEmail());
			
			Calendar beg = Calendar.getInstance();
			beg.set(Calendar.MONTH, beg.get(Calendar.MONTH)-1);
			beg.set(Calendar.DATE, 15);
			Date begin = beg.getTime();
			
			Calendar ed = Calendar.getInstance();
			ed.set(Calendar.DATE, 1);
			Date end = ed.getTime();
			
			int userId = seller.getId();
			financeService.computeForSeller(begin, end, userId);
		}
	}
	
	/**
	 * 上月1-14定期计算翻译的钱
	 * 每月15号启动
	 */
	@Scheduled(cron="0 0 1 * * ?")
	public void computeTranslatorFirst(){
		List<Translator> translators = translatorAuthService.getTranslatorListByPage(null);
		for(Translator translator : translators){
			System.out.println("begin to compute translator : "+ translator.getEmail());
			/**
			 * 正常日期
			 */
//			Calendar beg = Calendar.getInstance();
//			beg.set(Calendar.MONTH, beg.get(Calendar.MONTH)-1);
//			beg.set(Calendar.DATE, 1);
//			Date begin = beg.getTime();
//			
//			Calendar ed = Calendar.getInstance();
//			ed.set(Calendar.MONTH, beg.get(Calendar.MONTH)-1);
//			ed.set(Calendar.DATE, 15);
//			Date end = ed.getTime();
			
			/**
			 * 测试用日期
			 */
			Date begin = null;
			Date end = null;
			Calendar now = Calendar.getInstance();
			Calendar beg = Calendar.getInstance();
			Calendar ed = Calendar.getInstance();
			int weekNum = now.get(Calendar.DAY_OF_WEEK);
			if(weekNum == Calendar.MONDAY || weekNum == Calendar.THURSDAY){
				if(weekNum == Calendar.MONDAY){//周四，周5，周6，周7
					beg.set(Calendar.DATE, beg.get(Calendar.DATE) - 4);
					beg.set(Calendar.HOUR_OF_DAY, 0);
					beg.set(Calendar.MINUTE, 0);
					beg.set(Calendar.SECOND, 0);
					beg.set(Calendar.MILLISECOND, 0);
					
					ed.set(Calendar.HOUR_OF_DAY, 0);
					ed.set(Calendar.MINUTE, 0);
					ed.set(Calendar.SECOND, 0);
					ed.set(Calendar.MILLISECOND, 0);
				}else if(weekNum == Calendar.THURSDAY){//周1，周2， 周3
					beg.set(Calendar.DATE, beg.get(Calendar.DATE) - 3);
					beg.set(Calendar.HOUR_OF_DAY, 0);
					beg.set(Calendar.MINUTE, 0);
					beg.set(Calendar.SECOND, 0);
					beg.set(Calendar.MILLISECOND, 0);
					
					ed.set(Calendar.HOUR_OF_DAY, 0);
					ed.set(Calendar.MINUTE, 0);
					ed.set(Calendar.SECOND, 0);
					ed.set(Calendar.MILLISECOND, 0);
				}
				begin = beg.getTime();
				end = ed.getTime();
				
				int userId = translator.getId();
				financeService.computeForTranslator(begin, end, userId);
			}
		}
	}
	/**
	 * 每月1号启动
	 */
//	@Scheduled(cron="0 0/5 1 * * ?")
	public void computeTranslatorLast(){
		List<Translator> translators = translatorAuthService.getTranslatorListByPage(null);
		for(Translator translator : translators){
			System.out.println("begin to compute translator : "+ translator.getEmail());
			
			Calendar beg = Calendar.getInstance();
			beg.set(Calendar.MONTH, beg.get(Calendar.MONTH)-1);
			beg.set(Calendar.DATE, 15);
			Date begin = beg.getTime();
			
			Calendar ed = Calendar.getInstance();
			ed.set(Calendar.DATE, 1);
			Date end = ed.getTime();
			
			int userId = translator.getId();
			financeService.computeForTranslator(begin, end, userId);
		}
	}
}
