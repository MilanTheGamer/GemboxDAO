// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../utils/EnumDeclarations.sol";
import "../utils/StructDeclarations.sol"; 

import "hardhat/console.sol";

contract GemboxDAO {

  //-------- GLOBAL VARIABLES ----------------------------------------------------------

  string public appName;  // Name of App
  address private owner;  // Owner wallet address
  bytes32[] private activePools; // Active Lottery Pools

  //--------- MAPPINGS ------------------------------------------------------------------

  mapping (bytes32 => LotteryPoolStruct) private LotteryPool; // Mapping containing every Lottery Pool created
  mapping (bytes32 => bytes32[]) private TicketsInPool; // Mapping containing every ticket in a Pool
  mapping (address => bytes32[]) private UserTicketHoldings; // Mapping containing tickets user hold
  

  //--------- MODIFIERS ------------------------------------------------------------------

  modifier onlyOwner() {    // Modifier for restricting access only owner allowed functions
    require(msg.sender == owner, "Unauthorised");
    _;
  }


  //--------- CONSTRUCTOR ------------------------------------------------------------------

  constructor(string memory _app_name){
    owner =  msg.sender;
    appName = _app_name;
  }

  //--------- PRIVATE FUNCTIONS ------------------------------------------------------------------

  function _generatePoolId(uint _timeDuration, address _creatorAddress) private view returns (bytes32) {
    return keccak256(abi.encodePacked(_timeDuration, _creatorAddress, block.timestamp));
  }

  function _generateTicketId(bytes32 _poolId, address _creatorAddress) private view returns (bytes32) {
    return keccak256(abi.encodePacked(_poolId, _creatorAddress, block.timestamp));
  }
  
  //--------- PUBLIC FUNCTIONS ------------------------------------------------------------------

  // Create Lottery Pool
  function createPool(
    address _creatorAddress,
    uint _price,
    uint _timeDuration,
    uint _poolLimit
  ) public returns (LotteryPoolStruct memory)  {
    bytes32 id = _generatePoolId(_timeDuration,_creatorAddress);
    LotteryPool[id] = LotteryPoolStruct(id, _creatorAddress, _price, _timeDuration, _poolLimit, LotteryStatus.Active);
    activePools.push(id);
    return LotteryPool[id];
  }

  //To get the array of active pools 
  function getActivePoolList() public view returns (bytes32[] memory)  {
    return activePools;
  }
  
  // Join Lottery Pool
  function joinPool() view public {
    
  }

  // Claim Winning Prize
  function claimPrize() public {

  }

  // Choose Winner
  function chooseWinner() public {
    
  }

}