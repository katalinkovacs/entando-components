/*
 * Copyright 2013-Present Entando Corporation (http://www.entando.com) All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package com.agiletec.plugins.jpaddressbook;

import junit.framework.Test;
import junit.framework.TestSuite;
import com.agiletec.plugins.jpaddressbook.aps.system.services.addressbook.TestAddressBookDAO;
import com.agiletec.plugins.jpaddressbook.aps.system.services.addressbook.TestAddressBookManager;
import com.agiletec.plugins.jpaddressbook.aps.system.services.addressbook.TestAddressBookSearcherDAO;
import com.agiletec.plugins.jpaddressbook.apsadmin.addressbook.TestContactAction;
import com.agiletec.plugins.jpaddressbook.apsadmin.addressbook.TestContactFinderAction;

public class AllTests {
	
	public static Test suite() {
		TestSuite suite = new TestSuite("Test for jpaddressbook");
		System.out.println("Test for jpaddressbook");
		
		suite.addTestSuite(TestAddressBookDAO.class);
		suite.addTestSuite(TestAddressBookSearcherDAO.class);
		suite.addTestSuite(TestAddressBookManager.class);

		suite.addTestSuite(TestContactFinderAction.class);
		suite.addTestSuite(TestContactAction.class);
		
		return suite;
	}
	
}