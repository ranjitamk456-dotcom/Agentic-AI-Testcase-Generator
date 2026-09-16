Feature: User Login

  Scenario: Successful login with valid credentials
    Given Active, registered user; not logged in
    And the test data is Email: user@example.com
Password: CorrectPass123!
    When 1. Open Login page
    When 2. Enter email
    When 3. Enter password
    When 4. Click Log In
    Then User is redirected to Dashboard; a session cookie is created

  Scenario: Login fails with correct email but wrong password
    Given Active, registered user; not locked
    And the test data is Email: user@example.com
Password: WrongPass!
    When 1. Open Login page
    When 2. Enter email
    When 3. Enter wrong password
    When 4. Click Log In
    Then Inline error "Invalid email or password" shown; URL stays on login page; no session created

  Scenario: Login attempt with unregistered email
    Given No account exists for the provided email
    And the test data is Email: unknown@example.com
Password: AnyPass123!
    When 1. Open Login page
    When 2. Enter unregistered email
    When 3. Enter any password
    When 4. Click Log In
    Then Generic error "Invalid email or password" displayed; user remains on login page; no session created

  Scenario: Login attempt with both fields blank
    Given User is on Login page
    And the test data is Email: (blank)
Password: (blank)
    When 1. Open Login page
    When 2. Leave email and password empty
    When 3. Click Log In
    Then Inline validation prompts to fill required fields; no request sent to server

  Scenario: Login attempt with invalid email format
    Given User is on Login page
    And the test data is Email: invalid-email
Password: AnyPass123!
    When 1. Open Login page
    When 2. Enter invalid email format
    When 3. Enter any password
    When 4. Click Log In
    Then Inline message "Enter a valid email address" shown; no request sent

  Scenario: Account lock after 5 consecutive failed attempts within 15 minutes
    Given Active, registered user; account not currently locked
    And the test data is Email: user@example.com
Password: WrongPass! (repeated attempts)
    When 1. Open Login page
    When 2. Perform 5 login attempts with correct email and wrong password within 15 minutes
    When 3. On 5th attempt, observe lockout message
    When 4. Attempt login again with correct credentials
    Then After 5th failed attempt, message "Your account is locked. Try again later." displayed; subsequent correct credentials still show lockout message

  Scenario: Email case‑insensitivity verification
    Given Active, registered user; not logged in
    And the test data is Email: USER@EXAMPLE.COM
Password: CorrectPass123!
    When 1. Open Login page
    When 2. Enter email in different case
    When 3. Enter correct password
    When 4. Click Log In
    Then Login succeeds and user is redirected to Dashboard; email case does not affect authentication

  Scenario: Session persistence after browser refresh
    Given User has successfully logged in and session is active
    And the test data is N/A
    When 1. Perform successful login (see TC-001)
    When 2. Refresh the browser page
    When 3. Observe current page
    Then User remains on Dashboard; session cookie persists; no re‑login required

  Scenario: Login attempt with deactivated account
    Given User account is deactivated in the system
    And the test data is Email: deactivated@example.com
Password: AnyPass123!
    When 1. Open Login page
    When 2. Enter deactivated account email
    When 3. Enter any password
    When 4. Click Log In
    Then Message "This account is inactive. Contact support." displayed; user is not logged in
