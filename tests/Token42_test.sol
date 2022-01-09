// SPDX-License-Identifier: GPL-3.0
    
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "../contracts/Token42.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuite {

    Token42 token;


    function beforeAll() public {
        token = new Token42();
    }

    function checkValidAmountTransfer() public payable {
        address acc = TestsAccounts.getAccount(1);
        try token.transfer(acc, 42) {
            uint256 balance = token.balanceOf(acc);
            Assert.equal(balance, 42, "Invalid balance");
        } catch Error(string memory reason) {
            Assert.ok(false, "Transfer failed");
        }
    }

    function checkInvalidAmountTransfer() public payable {
        try token.transfer(TestsAccounts.getAccount(1), 43) {
            Assert.ok(false, "Invalid amount exception expected");
        } catch Error(string memory reason) {
            Assert.equal(reason, "Amount given is not an answer", "Invalid reason");
        }
    }
}
