pragma solidity 0.8.0;

contract Bank{
    
    struct account{
        uint id;
        address user;
       string name;
    }
    
    mapping(address=>account) holders;
    mapping (address => uint) private balances;
    
    uint   contractBalance;                             
    uint   amountTransacted;  
    uint id;
    
    address payable public owner;
    
    constructor()  payable {
        owner = payable(msg.sender);
    }
    
    
    
    function openaccouunt(address _address, string memory _name) public{
        uint aid =id++;
        account memory Account = account(aid,_address,_name);
        holders[msg.sender] = Account;
    }
    
    
    function transferammount(address  _receiver) public payable{
        payable(_receiver).transfer(msg.value);
    }
    
     function deposit() public payable returns (uint) {
        balances[msg.sender] += msg.value;
        return balances[msg.sender];
    }

    
    // function withdraw(uint _with) public returns(uint _re){
    //     if(_with <= balances[msg.sender]){
    //         balances[msg.sender] -= _with;
    //         msg.sender.transfer(_with);
    //     }
        
    // }
    
    function depositsBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    
}