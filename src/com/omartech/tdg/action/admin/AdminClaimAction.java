package com.omartech.tdg.action.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.ClaimItem;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.service.ClaimService;

@Controller
@RequestMapping("/admin/claim")
public class AdminClaimAction {

	@Autowired
	private ClaimService claimService;
	
	@RequestMapping("/list/{claimType}")
	public ModelAndView list(
			@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, 
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize,
			@PathVariable String claimType
			){
		List<ClaimItem> claimItems = claimService.getClaimItemsByClaimTypeByPage(claimType, new Page(pageNo, pageSize));
		
		return new ModelAndView("/admin/claim/list").addObject("claims", claimItems).addObject("pageNo", pageNo).addObject("claimType", claimType);
	}
	
	@RequestMapping("/show")
	public ModelAndView show(@RequestParam int id){
		ClaimItem claimItem = claimService.getClaimItemById(id);
		return new ModelAndView("/admin/claim/show").addObject("claim", claimItem);
	}
	@RequestMapping("/edit")
	public ModelAndView edit(@RequestParam int id){
		ClaimItem claimItem = claimService.getClaimItemById(id);
		return new ModelAndView("/admin/claim/edit").addObject("claim", claimItem);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(@RequestParam String commentByAdmin, @RequestParam int id, @RequestParam int status, @RequestParam int percent){
		ClaimItem claimItem = claimService.getClaimItemById(id);
		claimItem.setCommentByAdmin(commentByAdmin);
		String type = claimItem.getClaimType();
		claimService.updateStatusWithMoney(id, status, percent);
		return "redirect:/admin/claim/list/"+type;
	}
	@RequestMapping("/updateStatus")
	public String update(@RequestParam int status, @RequestParam int id){
		claimService.updateStatus(id, status);
		return "redirect:/admin/claim/list";
	}
}
