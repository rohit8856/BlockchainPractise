pragma solidity ^0.8.0;
contract Enum{
    
    enum userrole{user,admin,general}
    
    mapping(address => userrole) private _userroles;
    
    modifier notuser(){
        require(_userroles[msg.sender] != userrole.admin,"User only not adming");
        _;
    }
    
    function setuserrole () public{
        _userroles[msg.sender] = userrole.admin;
    }
     function setadminrole () public{
        _userroles[msg.sender] = userrole.admin;
    }
     function getuser () public view returns(userrole role_){
        role_= _userroles[msg.sender];
    }
    
}