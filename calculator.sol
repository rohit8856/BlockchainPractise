pragma solidity ^0.7.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4-solc-0.7/contracts/math/SafeMath.sol';

contract Calculator{
    
    using SafeMath for uint256;
    
    uint immutable nottobeadded;
    
    constructor(uint256 _notadded)
    {
        nottobeadded = _notadded;
    }
    
   
     function tryAdd(uint256 a, uint256 b) public pure returns (bool, uint256) {
    return a.tryAdd(b);     
     }
     
     function trySub(uint256 a, uint256 b) public pure returns (bool, uint256) {
    return a.trySub(b);     
     }
     
     function tryDiv(uint256 a, uint256 b) public pure returns (bool, uint256) {
    return a.tryDiv(b);     
     }
     
     function tryMul(uint256 a, uint256 b) public pure returns (bool, uint256) {
    return a.tryMul(b);     
     }
     
     function tryMod(uint256 a, uint256 b) public pure returns (bool, uint256) {
    return a.tryMod(b);     
     }
     
     function loop(uint _upto) public view returns(uint){
         uint total;
         uint i=1;
         while(i<_upto){
             if(i%nottobeadded == 0){
                 break;
             }
             total +=i;
             i++;
         }
         return total;
         
     }
     
     
     
     
}