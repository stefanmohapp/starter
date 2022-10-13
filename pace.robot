*** Settings ***

Documentation           Test suite for Pace starter.
Library                 QWeb
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Test Cases ***

Test the home page
    [Documentation]     Go to the web shop, and verify that the slogan text appears on the page.
    GoTo                https://qentinelqi.github.io/shop/
    VerifyText          Find your spirit animal

Check the navigation menu items
    [Documentation]     Go to the shop homepage and verify the menu items.
    GoTo                https://qentinelqi.github.io/shop/
    VerifyText          Products
    VerifyText          Our Story
    VerifyText          Contact

Shop for products
    [Documentation]     Select a product, verify details on the page,
    ...                 add the product to the cart and continue shopping.
    GoTo                https://qentinelqi.github.io/shop/
    ClickText           Sacha the Deer
    VerifyText          Slim Fit, 5oz 100% Cotton T-Shirt.
    ClickText           Add to cart
    VerifyText          Cart summary
    VerifyText          Sacha the Deer
    ClickText           Continue shopping

Continue shopping
    [Documentation]     Add a second product to the cart.
    AppState            Home
    ClickText           Gavin the Tiger
    VerifyText          His favorite meal is chickpea salad with a lemon juice dressing.
    VerifyText          $9.00
    ClickText           Add to cart
    ClickText           Continue shopping
    # Check if we've exited the "cart" by looking for text in the footer.
    VerifyText          Fur, Inc.

*** Keywords ***

Home
    [Documentation]     Set the application state to the shop home page.
    GoTo                https://qentinelqi.github.io/shop/

# Pro Tip: In this Keywords section, you could combine QWords to make your own keywords using
#          the structure shown above. The pro way is to define them in a separate file and import
#          that file under Settings.
