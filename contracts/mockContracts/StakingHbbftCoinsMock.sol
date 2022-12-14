//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import './StakingHbbftBaseMock.sol';
import '../../contracts/base/StakingHbbftCoins.sol';


contract StakingHbbftCoinsMock is StakingHbbftCoins, StakingHbbftBaseMock {
    function _getMaxCandidates()
    internal
    pure
    override(StakingHbbftBase, StakingHbbftBaseMock)
    virtual
    returns(uint256) {
        return 100;
    }

    function _sendWithdrawnStakeAmount(address payable _to, uint256 _amount)
    override(StakingHbbftBase, StakingHbbftCoins)
    virtual
    internal {
        if (!_to.send(_amount)) {
            // We use the `Sacrifice` trick to be sure the coins can be 100% sent to the receiver.
            // Otherwise, if the receiver is a contract which has a revert in its fallback function,
            // the sending will fail.
            (new Sacrifice2){value: _amount}(_to);
        }
    }
}
