// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

contract VRFD20 is VRFConsumerBaseV2 {

  // variables
  uint64 s_subscriptionId;
  address vrfCoordinator = 0x7a1BaC17Ccc5b313516C5E16fb24f7659aA5ebed;
  bytes32 s_keyHash = 0x4b09e658ed251bcafeebbc69400383d49f344ace09b9576fe248bb02c003fe9f;
  uint32 callbackGasLimit = 40000;
  uint16 requestConfirmations = 3;
  uint32 numWords =  1;

  // constructor
  constructor(uint64 subscriptionId) VRFConsumerBaseV2(vrfCoordinator) {
      COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
      s_owner = msg.sender;
      s_subscriptionId = subscriptionId;
  }

  //...
  modifier onlyOwner() {
      require(msg.sender == s_owner);
      _;
  

}