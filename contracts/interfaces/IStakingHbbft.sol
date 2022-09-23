//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;


interface IStakingHbbft {
    // ================================================ Events ========================================================
    /// @dev Emitted by the `claimOrderedWithdraw` function to signal the staker withdrew the specified
    /// amount of requested coins from the specified pool during the specified staking epoch.
    /// @param fromPoolStakingAddress The pool from which the `staker` withdrew the `amount`.
    /// @param staker The address of the staker that withdrew the `amount`.
    /// @param stakingEpoch The serial number of the staking epoch during which the claim was made.
    /// @param amount The withdrawal amount.
    event ClaimedOrderedWithdrawal(
        address indexed fromPoolStakingAddress,
        address indexed staker,
        uint256 indexed stakingEpoch,
        uint256 amount
    );

    /// @dev Emitted by the `moveStake` function to signal the staker moved the specified
    /// amount of stake from one pool to another during the specified staking epoch.
    /// @param fromPoolStakingAddress The pool from which the `staker` moved the stake.
    /// @param toPoolStakingAddress The destination pool where the `staker` moved the stake.
    /// @param staker The address of the staker who moved the `amount`.
    /// @param stakingEpoch The serial number of the staking epoch during which the `amount` was moved.
    /// @param amount The stake amount which was moved.
    event MovedStake(
        address fromPoolStakingAddress,
        address indexed toPoolStakingAddress,
        address indexed staker,
        uint256 indexed stakingEpoch,
        uint256 amount
    );

    /// @dev Emitted by the `orderWithdraw` function to signal the staker ordered the withdrawal of the
    /// specified amount of their stake from the specified pool during the specified staking epoch.
    /// @param fromPoolStakingAddress The pool from which the `staker` ordered a withdrawal of the `amount`.
    /// @param staker The address of the staker that ordered the withdrawal of the `amount`.
    /// @param stakingEpoch The serial number of the staking epoch during which the order was made.
    /// @param amount The ordered withdrawal amount. Can be either positive or negative.
    /// See the `orderWithdraw` function.
    event OrderedWithdrawal(
        address indexed fromPoolStakingAddress,
        address indexed staker,
        uint256 indexed stakingEpoch,
        int256 amount
    );

    /// @dev Emitted by the `stake` function to signal the staker placed a stake of the specified
    /// amount for the specified pool during the specified staking epoch.
    /// @param toPoolStakingAddress The pool in which the `staker` placed the stake.
    /// @param staker The address of the staker that placed the stake.
    /// @param stakingEpoch The serial number of the staking epoch during which the stake was made.
    /// @param amount The stake amount.
    event PlacedStake(
        address indexed toPoolStakingAddress,
        address indexed staker,
        uint256 indexed stakingEpoch,
        uint256 amount
    );

    /// @dev Emitted by the `withdraw` function to signal the staker withdrew the specified
    /// amount of a stake from the specified pool during the specified staking epoch.
    /// @param fromPoolStakingAddress The pool from which the `staker` withdrew the `amount`.
    /// @param staker The address of staker that withdrew the `amount`.
    /// @param stakingEpoch The serial number of the staking epoch during which the withdrawal was made.
    /// @param amount The withdrawal amount.
    event WithdrewStake(
        address indexed fromPoolStakingAddress,
        address indexed staker,
        uint256 indexed stakingEpoch,
        uint256 amount
    );

    function incrementStakingEpoch() external;
    function initialize(
        address,
        address[] calldata,
        uint256,
        uint256,
        uint256,
        uint256,
        uint256,
        uint256,
        bytes32[] calldata,
        bytes16[] calldata
    ) external;
    function addPool(address, bytes calldata, bytes16) external payable;
    function setPoolInfo(bytes calldata, bytes16) external;
    function removePool(address) external;
    function removePools() external;
    function removeMyPool() external;
    function setStakingEpochStartTime(uint256) external;
    function moveStake(address, address, uint256) external;
    function stake(address) external payable;
    function withdraw(address, uint256) external;
    function orderWithdraw(address, int256) external;
    function claimOrderedWithdraw(address) external;
    function setCandidateMinStake(uint256) external;
    function setDelegatorMinStake(uint256) external;
    function notifyKeyGenFailed() external;
    function notifyAvailability(address) external;
    function notifyNetworkOfftimeDetected(uint256) external;
    function getPools() external view returns(address[] memory);
    function getPoolPublicKey(address) external view returns (bytes memory);
    function getPoolInternetAddress(address) external view returns (bytes16);
    function getPoolsInactive() external view returns(address[] memory);
    function getPoolsLikelihood() external view returns(uint256[] memory, uint256);
    function getPoolsToBeElected() external view returns(address[] memory);
    function getPoolsToBeRemoved() external view returns(address[] memory);
    function areStakeAndWithdrawAllowed() external pure returns(bool);
    function isPoolActive(address) external view returns(bool);
    function maxWithdrawAllowed(address, address) external view returns(uint256);
    function maxWithdrawOrderAllowed(address, address) external view returns(uint256);
    // function MAX_CANDIDATES() external pure returns(uint256); // solhint-disable-line func-name-mixedcase
    function getOrderedWithdrawAmount(address, address) external view returns(uint256);
    function poolDelegators(address) external view returns(address[] memory);
    function poolDelegatorsInactive(address) external view returns(address[] memory);
    function stakeAmountByCurrentEpoch(address, address) external view returns(uint256);
    function getRewardWasTaken(address, address, uint256) external view returns(bool);
    function setValidatorIP(address, bytes16 ) external;
    function getStakeAmount(address, address) external view returns(uint256);
    function getStakeAmountTotal(address) external view returns(uint256);
    function getStakeFirstEpoch(address, address) external view returns(uint256);
    function getStakeLastEpoch(address, address) external view returns(uint256);
    // function stakingWithdrawDisallowPeriod() external view returns(uint256);
    function getStakingEpoch() external view returns(uint256);
    function getStakingFixedEpochDuration() external view returns(uint256);
    function startTimeOfNextPhaseTransition() external view returns(uint256);
    function stakingFixedEpochEndTime() external view returns(uint256);
    function getStakingEpochStartTime() external view returns(uint256);
}
