//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./UpgradeabilityAdmin.sol";


contract UpgradeableOwned is UpgradeabilityAdmin {
    /// @dev Access check: revert unless `msg.sender` is the owner of the contract.
    modifier onlyOwner() {
        require(msg.sender == _admin(), "only admin is allowed to call this function");
        _;
    }
}
