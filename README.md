# On-chain Referral & Loyalty Engine

A professional-grade growth primitive for dApps. This repository implements a "Growth Loop" where users are incentivized to perform on-chain actions and invite others. It features a tiered loyalty system where long-term users earn "Points" at a higher rate, which can be redeemed for governance tokens or protocol discounts.

## Core Features
* **Tiered Rewards:** Users "Level Up" their referral multiplier based on their own transaction volume.
* **On-chain Attribution:** Permanent, tamper-proof mapping of referrers to referees.
* **Automated Point Issuance:** Gas-efficient minting of non-transferable loyalty points.
* **Flat Architecture:** Single-directory layout for the Referral Registry, Point Token, and Reward Logic.

## Logic Flow
1. **Invite:** User A generates a referral link (their address).
2. **Onboard:** User B interacts with the protocol, passing User A's address.
3. **Reward:** User B earns base points; User A earns a percentage "Commission" in points.
4. **Multiplier:** As User A's total referrals grow, their commission percentage increases (e.g., 5% -> 10% -> 15%).

## Setup
1. `npm install`
2. Deploy `LoyaltyEngine.sol`.
