Feature: Apply Promo Code at Checkout

  Scenario: Apply a valid percentage‑off code (SAVE10) to a ₹1 000 subtotal
    Given User logged in; cart subtotal = ₹1 000
    And the test data is Subtotal = ₹1 000; Promo = SAVE10
    When 1. Go to Checkout
    When 2. Verify displayed subtotal = ₹1 000
    When 3. Enter SAVE10
    When 4. Click Apply
    Then Discount = 10 % × ₹1 000 = ₹100 → New subtotal = ₹900; Order total (incl. shipping & tax) reflects ₹900 subtotal

  Scenario: Boundary – whole‑number discount on ₹1 200 subtotal
    Given User logged in; cart subtotal = ₹1 000
    And the test data is Subtotal = ₹1 200; Promo = SAVE10
    When 1. Go to Checkout
    When 2. Verify displayed subtotal = ₹1 000
    When 3. Enter SAVE10
    When 4. Click Apply
    Then Discount = ₹120 → New subtotal = ₹1 080; Total updates correctly

  Scenario: Verify case‑insensitivity for percentage code
    Given User logged in; cart subtotal = ₹1 000
    And the test data is Subtotal = ₹500; Promo = save10
    When 1. Go to Checkout
    When 2. Verify displayed subtotal = ₹1 000
    When 3. Enter save10
    When 4. Click Apply
    Then Discount = ₹50 → New subtotal = ₹450; Total updates

  Scenario: Leading/trailing spaces are trimmed before validation
    Given User logged in; cart subtotal = ₹1 000
    And the test data is Subtotal = ₹800; Promo =   SAVE10
    When 1. Go to Checkout
    When 2. Verify displayed subtotal = ₹1 000
    When 3. Enter   SAVE10
    When 4. Click Apply
    Then Discount applied as SAVE10 → ₹80 discount, new subtotal = ₹720; Total updates
