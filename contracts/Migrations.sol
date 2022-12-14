//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;


contract Migrations {
    address public owner;
    uint public last_completed_migration; // solhint-disable-line

    constructor() {
        owner = msg.sender;
    }

    modifier restricted() {
        if (msg.sender == owner) _;
    }

    function setCompleted(uint completed)
    public
    restricted {
        last_completed_migration = completed;
    }

    function upgrade(address new_address)
    public
    restricted { // solhint-disable-line
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
}
