package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.Country;
import com.omartech.tdg.model.Page;

public interface CountryMapper {
	
	public void insert(Country country);
	public void delete(int id);
	public List<Country> getCountriesByPage(Page page);
	public List<Country> getCountries();
	public Country getCountryById(int id);

}
