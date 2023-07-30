// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CrossChainSwap is Ownable {
    struct Swap {
        address token;
        uint256 amount;
        address participant;
        bool isCompleted;
    }

    mapping(bytes32 => Swap) public swaps;

    function initiateSwap(address token, uint256 amount, address participant, bytes32 swapHash) public {
        IERC20(token).transferFrom(msg.sender, address(this), amount);
        swaps[swapHash] = Swap(token, amount, participant, false);
    }

    function completeSwap(bytes32 swapHash) public {
        require(swaps[swapHash].participant == msg.sender, "Not swap participant");
        require(!swaps[swapHash].isCompleted, "Swap already completed");
        IERC20(swaps[swapHash].token).transfer(msg.sender, swaps[swapHash].amount);
        swaps[swapHash].isCompleted = true;
    }
}