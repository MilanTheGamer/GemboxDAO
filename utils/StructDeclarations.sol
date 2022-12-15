// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./EnumDeclarations.sol";

struct LotteryTicketStruct{
  uint ticketNumber;
  uint poolId;
  address ticketHolder;
}

struct LotteryPoolStruct{       // Lotter info object structure
  bytes32 poolId;
  address creatorAddress;
  uint price;
  uint timeDuration;
  uint poolLimit;
  LotteryStatus status;
}


struct WinnerStruct {      // Winner info object structure
  address winner;
  uint lotNumber;
  uint lotteryId;
  uint prize;
} 