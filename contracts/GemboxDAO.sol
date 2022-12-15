// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../utils/EnumDeclarations.sol";
import "../utils/StructDeclarations.sol"; 

contract GemboxDAO {

  //-------- GLOBAL VARIABLES ----------------------------------------------------------

  string public appName;  // Name of App
  address private owner;  // Owner wallet address
  bytes32[] private activePools; // Active Lottery Pools

  //--------- MAPPINGS ------------------------------------------------------------------

  mapping (bytes32 => LotteryPoolStruct) private LotteryPool;
  

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
  
  //--------- PUBLIC FUNCTIONS ------------------------------------------------------------------

  // Create Lottery Pool
  function createPool(
    address _creatorAddress,
    uint _price,
    uint _timeDuration,
    uint _poolLimit
  ) public onlyOwner {
    bytes32 id = _generatePoolId(_timeDuration,_creatorAddress);
  }

  //To get the array of active pools 
  function getActivePoolList() public view  {
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