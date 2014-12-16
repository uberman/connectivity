@smoke
Feature: Nuvo website is functional by customers
  Scenario Outline: Different areas of the Nuvo website are viewable by visitors
    Given a new visitor to the Nuvo website
    When the user clicks on the navigation <tabs> and <ids>
    Then the user is redirected to other <areas> in the website
  Examples:
    |tabs |ids| areas|
    |Enterprise|19|enterprise|
    |Agency    |17|agency    |
    |Blog      |327|blog     |

  Scenario Outline: Visitors can view the different products on the site
    Given a new visitor to the Nuvo website
    When the user mouses over Products and clicks <links> and <ids>
    Then the user is redirected to the <products> on the website
  Examples:
    |links|ids|products|
    |Listings|129|listings|
    |Opinions|85|opinions|

  Scenario: Visitors can get the Free 5-Star Guide
    Given a new visitor to the Nuvo website
    When the user clicks on the 5-Star Guide button
    Then the user gets redirected to the 5-Star guide landing page

  Scenario: Visitors can initiate request for Contact
    Given a new visitor to the Nuvo website
    When the user starts the request for Contact
    Then the user can fill in contact info
    And they are redirected to the Thank You page

  Scenario Outline: Visitors can initiate request for Contact with different Referrers
    Given a new visitor to the Nuvo website
    When the user starts the request for Contact
    Then the user can fill in contact info with different <referrers>
    And they are redirected to the Thank You page
  Examples:
    |referrers|
    | PPC     |
    |Email    |
    |Display  |
    |LinkedIn |
    |Organic  |
    |PR       |
    |Referral |

  Scenario Outline: Visitors can initiate request for Contact with different Industries
    Given a new visitor to the Nuvo website
    When the user starts the request for Contact
    Then the user can fill in contact info with different <industries>
    And they are redirected to the Thank You page
  Examples:
    |industries|
    |Advertising|
    |Agriculture|
    |Apparel |
    |Banking |
    |Biotechnology|
    |Chemicals    |
    |Communications|
    |Construction  |
    |Consulting    |
    |Education     |

  Scenario Outline: Visitors to the site can click through the footers
    Given a new visitor to the Nuvo website
    When the user navigates the site on the <footers>
    Then the user is redirected to other <areas> in the website
  Examples:
    |footers|areas|
    |Products|listings|
    |Enterprise|enterprise|
    |Agency    |agency    |
    |Connectivity Competitors|listing-management-competition|
    |About Us                |about-us                      |
    |Careers                 |careers                       |
    |Privacy Policy          |privacy-policy                |
    |Terms and Conditions of Use|terms-of-service           |



