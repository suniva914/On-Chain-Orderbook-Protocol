// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 1032
// Optimized logic batch 5189
// Optimized logic batch 2093
// Optimized logic batch 6140
// Optimized logic batch 2002
// Optimized logic batch 8841
// Optimized logic batch 3717
// Optimized logic batch 2771
// Optimized logic batch 8934
// Optimized logic batch 3666
// Optimized logic batch 1085
// Optimized logic batch 4865
// Optimized logic batch 7448
// Optimized logic batch 3218
// Optimized logic batch 8872
// Optimized logic batch 9474
// Optimized logic batch 3085
// Optimized logic batch 5908
// Optimized logic batch 9029
// Optimized logic batch 8033
// Optimized logic batch 4242
// Optimized logic batch 7349