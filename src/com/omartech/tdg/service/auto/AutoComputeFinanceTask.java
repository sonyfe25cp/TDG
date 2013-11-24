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
	 * 每月定期计算卖家的钱
	 */
	@Scheduled(cron="0 0/3 * * * ?")
	public void computeSeller(){
		List<Seller> sellers = sellerAuthService.getSellerListByPage(null);
		for(Seller seller : sellers){
			System.out.println("begin to compute seller : "+ seller.getEmail());
			
			Calendar beg = Calendar.getInstance();
			beg.set(Calendar.MONTH, beg.get(Calendar.MONTH)-1);
			beg.set(Calendar.DATE, 16);
			Date begin = beg.getTime();
			
			Calendar ed = Calendar.getInstance();
			ed.set(Calendar.DATE, 15);
			Date end = ed.getTime();
			
			int userId = seller.getId();
			financeService.computeForSeller(begin, end, userId);
		}
		
	}
	
	/**
	 * 每月定期计算翻译的钱
	 */
	@Scheduled(cron="0 0/5 * * * ?")
	public void computeTranslator(){
		List<Translator> translators = translatorAuthService.getTranslatorListByPage(null);
		for(Translator translator : translators){
			System.out.println("begin to compute translator : "+ translator.getEmail());
			
			Calendar beg = Calendar.getInstance();
			beg.set(Calendar.MONTH, beg.get(Calendar.MONTH)-1);
			beg.set(Calendar.DATE, 16);
			Date begin = beg.getTime();
			
			Calendar ed = Calendar.getInstance();
			ed.set(Calendar.DATE, 15);
			Date end = ed.getTime();
			
			int userId = translator.getId();
			financeService.computeForTranslator(begin, end, userId);
		}
	}
	
}
