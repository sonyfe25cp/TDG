package com.omartech.tdg.test;

import com.omartech.tdg.service.PasswordKeyService;

public class TestPasswordKey {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		PasswordKeyService service = new PasswordKeyService();
		for(int i = 0; i< 10; i++){
			String key = service.createKey();
			System.out.println(key);
		}
	}

}
