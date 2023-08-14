# swapping.sol
CrossChainSwap Smart Contract
This is a Solidity smart contract for a simple CrossChainSwap functionality. The contract allows users to initiate a swap of ERC20 tokens from one blockchain to another and then complete the swap once the transaction is confirmed on the destination blockchain.

How it Works
Initiate Swap:: To initiate a swap, a user needs to call the initiateSwap function and provide the following parameters:

token: The address of the ERC20 token to be swapped.
amount: The amount of ERC20 tokens to be swapped.
participant: The address of the participant who will receive the tokens on the destination blockchain.
swapHash: A unique identifier (usually generated off-chain) for the swap.
The contract will transfer the specified amount of ERC20 tokens from the caller's address to the contract's address and store the swap details in the swaps mapping.

Complete Swap: Once the swap transaction is confirmed on the destination blockchain, the participant can call the completeSwap function and provide the swapHash. The contract will verify that the participant is the one who initiated the swap and that the swap is not already completed. If the conditions are met, the contract will transfer the swapped tokens from the contract's address to the participant's address, completing the swap.

Requirements
This smart contract uses the OpenZeppelin ERC20 and Ownable libraries. Please make sure to include the relevant dependencies in your project.

License
This smart contract is licensed under the MIT License. Feel free to use, modify, and distribute it as per the terms of the license. However, keep in mind that this contract is provided as a sample and might need further security audits and testing before using it in a production environment.
