// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

import "hardhat/console.sol";

contract RandomNumberConsumer is VRFConsumerBaseV2 {

  // variables
  uint64 private s_subscriptionId;
  address private s_owner;
  uint256 public randomNumber;
  bytes32 s_keyHash = 0x474e34a077df58807dbe9c96d3c009b23b3c6d0cce433e59bbf5b34f823bc56c;
  uint32 callbackGasLimit = 40000;
  uint16 requestConfirmations = 3;
  uint32 numWords =  1;

  // interface
  VRFCoordinatorV2Interface COORDINATOR;

  // constructor
  constructor(uint64 subscriptionId, address vrfCoordinator) VRFConsumerBaseV2(vrfCoordinator) {
      COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
      s_owner = msg.sender;
      s_subscriptionId = subscriptionId;
  }

  //modifiers
  modifier onlyOwner() {
    require(msg.sender == s_owner);
    _;
  }

  function fulfillRandomWords(
    uint256 requestId,
    uint256[] memory randomWords
  ) internal override {
    uint256 d20Value = (randomWords[0] % 20) + 1;
    console.log(d20Value);
    // emit DiceLanded(requestId, d20Value);
  }

  function getRandomNumber() public onlyOwner returns (uint256 requestId) {
    // Will revert if subscription is not set and funded.
    requestId = COORDINATOR.requestRandomWords(
      s_keyHash,
      s_subscriptionId,
      requestConfirmations,
      callbackGasLimit,
      numWords
    );
  }
  

}