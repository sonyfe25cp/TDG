package com.omartech.tdg.action.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.exception.ShopException;
import com.omartech.tdg.model.FinanceUnit;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.service.FinanceService;
import com.omartech.tdg.utils.UserType;

@Controller
@RequestMapping("/admin/finance")
public class AdminFinanceAction {
	
	@Autowired
	private FinanceService financeService;
	
	@RequestMapping("/orders-all")
	public ModelAndView allAboutOrders(
			@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, 
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		
		List<FinanceUnit> units = null;
		return new ModelAndView("/admin/finance/finance-list").addObject("financeUnits", units).addObject("pageNo", pageNo).addObject("showType", "orders-all");
	}
	@RequestMapping("/receive-all")
	public ModelAndView allReceive(
			@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, 
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		List<FinanceUnit> units = financeService.getFinanceByReceiverAndMonthByPage(0, UserType.ADMIN, null, null, new Page(pageNo, pageSize));
		return new ModelAndView("/admin/finance/finance-list").addObject("financeUnits", units).addObject("pageNo", pageNo).addObject("showType", "receive-all");
	}
	@RequestMapping("/send-all")
	public ModelAndView allSend(
			@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, 
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		List<FinanceUnit> units = financeService.getFinanceBySenderAndMonthByPage(0, UserType.ADMIN, null, null, new Page(pageNo, pageSize));
		return new ModelAndView("/admin/finance/finance-list").addObject("financeUnits", units).addObject("pageNo", pageNo).addObject("showType", "send-all");
	}
	
	@RequestMapping("/show/{id}")
	public ModelAndView newFinanceUnit(@PathVariable int id){
		FinanceUnit unit = financeService.getFinanceUnitById(id);
		return new ModelAndView("/admin/finance/finance-show").addObject("financeUnit", unit);
	}
	@RequestMapping("/new")
	public ModelAndView newFinanceUnit(@RequestParam String unitType){
		return new ModelAndView("/admin/finance/finance-new").addObject("unitType", unitType);//收入还是支出
	}
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String createFinanceUnit(
			@RequestParam String unitType, 
			@RequestParam String senderType, @RequestParam int senderId,
			@RequestParam String receiverType, @RequestParam int receiverId,
			@RequestParam String relatedType, @RequestParam int relatedId,
			@RequestParam float money, @RequestParam String comment
			){
		FinanceUnit unit = new FinanceUnit(relatedType, unitType);
		
		if(unitType.equals("receive")){
			unit.setSender(senderType + "-" + senderId);
		}else if(unitType.equals("send")){
			unit.setReceiver(receiverType + "-" + receiverId);
		}
		unit.setComment(comment);
		unit.setRelatedId(relatedId);
		unit.setMoney(money);
		try{
			financeService.insert(unit);
		}catch(ShopException e){
			return "redirect:/admin/error/shopError";
		}
		return "redirect:/admin/finance/"+unitType+"-all";
	}
	
	@RequestMapping("/edit/{id}")
	public ModelAndView editFinanceUnit(@PathVariable int id){
		FinanceUnit unit = financeService.getFinanceUnitById(id);
		return new ModelAndView("/admin/finance/finance-edit").addObject("financeUnit", unit);
	}
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateFinanceUnit(@RequestParam int id, @RequestParam float money, @RequestParam(required=false) String comment){
		FinanceUnit unit = financeService.getFinanceUnitById(id);
		unit.setMoney(money);
		unit.setComment(comment);
		financeService.update(unit);
		return "redirect:/admin/finance/show/"+id;
	}
	
	@RequestMapping("/showbyorder")
	public ModelAndView showbyorder(@RequestParam int orderId){
		List<FinanceUnit> financeUnits = financeService.getFinanceUnitsByOrderId(orderId);
		return new ModelAndView("/admin/finance/finance-show-base-order").addObject("financeUnits", financeUnits);
	}
	@RequestMapping("/showbytranslationTask")
	public ModelAndView showbyTranslationTask(@RequestParam int translationTaskId){
		List<FinanceUnit> financeUnits = financeService.getFinanceUnitsByTransitionId(translationTaskId);
		return new ModelAndView("/admin/finance/finance-show-base-order").addObject("financeUnits", financeUnits);
	}
	
}
