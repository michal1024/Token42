//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token42 is ERC20 {
    constructor() ERC20("Token42", "T42") {
        _mint(_msgSender(), 42*7753000000); //42 tokens for each earthling
    }

    function _beforeTokenTransfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual override {
        super._beforeTokenTransfer(sender, recipient, amount);
        require(_validAmount(amount), "Amount given is not an answer");
    }

    function _validAmount(uint256 amount) private pure returns (bool) {
        return amount % 42 == 0;
    }

    function decimals() public view virtual override returns (uint8) {
        return 0;
    }
}