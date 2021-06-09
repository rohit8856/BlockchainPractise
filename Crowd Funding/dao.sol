
pragma solidity ^0.8.0;
import "./funding.sol";

contract dao{
    
    struct projects{
        string name;
        uint256 amount;
        uint256 vote;
    }
    uint256 idtoproject;
     mapping(uint256=> projects) public proj;
     
}
