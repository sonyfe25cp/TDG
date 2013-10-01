package com.omartech.tdg.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.mapper.CountryMapper;
import com.omartech.tdg.model.Country;
import com.omartech.tdg.model.Page;

@Controller
public class CountryAction {
	@Autowired
	private CountryMapper countryMapper;
	
	@RequestMapping("/{userType}/country/new")
	public String newCountry(@PathVariable String userType){
		return "/"+userType+"/country/country-new";
	}
	@RequestMapping("/{userType}/country/create")
	public String createCountry(@PathVariable String userType, @RequestParam String name, @RequestParam String nameInChinese){
		Country country = new Country();
		country.setName(name);
		country.setNameInChinese(nameInChinese);
		countryMapper.insert(country);
		
		return "redirect:/"+userType+"/country/list";
	}
	
	@RequestMapping("/{userType}/country/list")
	public ModelAndView listCountry(@PathVariable String userType, @RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, 
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize,
			HttpSession session){
		List<Country> countries = countryMapper.getCountriesByPage(new Page(pageNo, pageSize));
		return new ModelAndView("/"+userType+"/country/country-list").addObject("countries", countries).addObject("pageNo", pageNo);
	}
	@ResponseBody
	@RequestMapping("/country/list")
	public List<Country> listCountryJson(){
		List<Country> countries = countryMapper.getCountries();
		return countries;
	}
	
	@RequestMapping("/{userType}/country/delete")
	public String delete(@PathVariable String userType, @RequestParam int id){
		countryMapper.delete(id);
		return "redirect:/"+userType+"/country/list";
	}
	
	public CountryMapper getCountryMapper() {
		return countryMapper;
	}
	public void setCountryMapper(CountryMapper countryMapper) {
		this.countryMapper = countryMapper;
	}
}
