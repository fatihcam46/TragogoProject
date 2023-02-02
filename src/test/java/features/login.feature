Feature: Login functionality

  Background: User on the TRAGOGO vytrack web page.
    * configure driver = { type: 'chrome', executable: 'C:/Program Files/Google/Chrome/Application/chrome.exe' }
    * driver 'https://qa2.vytrack.com/user/login'
    * maximize()
  Scenario Outline:TC1-1-try to login to for truck drivers, store manager, sales manager to vytrack
    * input("input[name='_username']", '<user>')
    * input("input[name='_password']", 'UserUser123')
    * submit().click("button[type='submit']")
    * retry(5, 15000).waitForUrl('https://qa2.vytrack.com/')
    * match driver.url == "https://qa2.vytrack.com/"
    Examples: user credentials
      | user     |
      | user1    |
      | user2    |
      | user3    |
      | user4    |
      | user5    |
      | salesmanager101    |
      | salesmanager102    |
      | salesmanager103    |
      | salesmanager104    |
      | storemanager51    |
      | storemanager52    |
      | storemanager53    |
      | storemanager54    |

  Scenario Outline: TC2- 2- User can not login with any invalid credentials
    * input("input[name='_username']", '<user>')
    * input("input[name='_password']", '<password>')
    * submit().click("button[type='submit']")
   # * match read.class == 'Invalid user name or password.'  oolmadi
    Examples: Wrong credentials
      | user            | password         |
      | user1     | UserUser12      |
      | user1      | UserUser      |
      | user11      | UserUser123      |
      | user      | UserUser123      |
      | salesmanager101      | UserUser12      |
      | salesmanager101       | UserUser      |
      | salesmanager1       | UserUser123      |
      | salesmanager10       | UserUser123   |
      | storemanager51       | UserUser12           |
      | storemanager51       | UserUser1           |
      | storemanager5       | UserUser123           |
      | storemanager       | UserUser123           |




