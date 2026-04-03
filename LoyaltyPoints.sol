// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title LoyaltyPoints
 * @dev Non-transferable points used for internal protocol rewards.
 */
contract LoyaltyPoints is ERC20, Ownable {
    constructor() ERC20("Protocol Points", "PTS") Ownable(msg.sender) {}

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    /**
     * @dev Overridden to prevent point trading/selling.
     */
    function _update(address from, address to, uint256 value) internal override {
        require(from == address(0) || to == address(0), "Points are non-transferable");
        super._update(from, to, value);
    }
}
