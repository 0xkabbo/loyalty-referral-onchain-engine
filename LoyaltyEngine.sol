// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./LoyaltyPoints.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LoyaltyEngine is Ownable {
    LoyaltyPoints public immutable points;
    
    struct UserProfile {
        address referrer;
        uint256 referralCount;
        uint256 totalPointsEarned;
    }

    mapping(address => UserProfile) public profiles;
    uint256 public constant BASE_REWARD = 100 * 1e18; // 100 PTS

    event UserReferred(address indexed user, address indexed referrer);
    event PointsAwarded(address indexed user, uint256 amount);

    constructor() Ownable(msg.sender) {
        points = new LoyaltyPoints();
    }

    /**
     * @dev Called when a user performs a key protocol action.
     */
    function recordAction(address _user, address _referrer) external onlyOwner {
        if (profiles[_user].referrer == address(0) && _referrer != address(0) && _referrer != _user) {
            profiles[_user].referrer = _referrer;
            profiles[_referrer].referralCount++;
            emit UserReferred(_user, _referrer);
        }

        // Reward the user
        points.mint(_user, BASE_REWARD);
        
        // Reward the referrer (if any) with a 10% bonus
        address ref = profiles[_user].referrer;
        if (ref != address(0)) {
            uint256 refBonus = (BASE_REWARD * 10) / 100;
            points.mint(ref, refBonus);
        }
    }
}
