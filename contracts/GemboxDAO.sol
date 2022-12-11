// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../utils/EnumDeclarations.sol";
import "../utils/StructDeclarations.sol"; 

contract GemboxDAO {

  //-------- GLOBAL VARIABLES ----------------------------------------------------------

  address private owner;     // Owner wallet address
  string public appName;     // Name of App
  uint public lastUpdated;   // Last Contract Update
  uint private lastLotteryPoolId;  // ID of the last lottery pool
  LotteryPoolStruct[] private activePoolList; // List of all the active lottery list 


  //--------- MAPPINGS ------------------------------------------------------------------

  mapping (uint => WinnerStruct) public winners;  // Winners List corresponding to the lotteryId
  

  //--------- MODIFIERS ------------------------------------------------------------------

  modifier onlyOwner() {    // Modifier for restricting access only owner allowed functions
      require(msg.sender == owner, "Unauthorised");
      _;
  }


  //--------- CONSTRUCTOR ------------------------------------------------------------------
  constructor(string memory _app_name){
    owner =  msg.sender;
    appName = _app_name;
    lastUpdated = block.timestamp;
    lastLotteryPoolId = 0;
  }

  
  //--------- FUNCTIONS ------------------------------------------------------------------

  // Create Lottery Pool
  function createPool(
    uint _poolLimit,
    uint _timeLimit,
    uint _lotteyPrice
  ) public onlyOwner returns (LotteryPoolStruct memory poolInfo) {
      uint poolId = lastLotteryPoolId + 1;
      LotteryTicketStruct[] memory initialLotteryList;
      LotteryPoolStruct memory lotteryPool = LotteryPoolStruct({
        poolId: poolId,
        price: _lotteyPrice,
        timeDuration: _timeLimit,
        poolLimit: _poolLimit,
        lotteryList: initialLotteryList,
        status: LotteryStatus.Active
      });
      activePoolList.push(lotteryPool);
      return lotteryPool;
  }

  //To get the array of active pools 
  function getActivePoolList() public view returns (LotteryPoolStruct[] memory) {
    LotteryPoolStruct[] memory pools = new LotteryPoolStruct[](activePoolList.length);
    for (uint i = 0; i < activePoolList.length; i++) {
      LotteryPoolStruct memory pool = activePoolList[i];
      pools[i] = pool;
    }
    return pools;
  }
  
  // Join Lottery Pool
  function joinPool(uint _poolId) view public returns (LotteryTicketStruct memory) {
    LotteryPoolStruct memory selectedPool;
    for (uint i = 0; i < activePoolList.length; i++){
      if (activePoolList[i].poolId == _poolId){
        selectedPool = activePoolList[i];
        break;
      }
    }
    LotteryTicketStruct memory ticket = LotteryTicketStruct({
      ticketNumber: (selectedPool.lotteryList.length + 1),
      poolId: selectedPool.poolId,
      ticketHolder: msg.sender
    });

    // LotteryTicketStruct[] memory lotteryList = selectedPool.lotteryList;
    // lotteyList.push(ticket);
    // selectedPool.lotteryList.push(ticket);
    return ticket;
  }

  // Claim Winning Prize
  function claimPrize() public {

  }

  // Choose Winner
  function chooseWinner() public {
    
  }

}