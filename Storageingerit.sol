pragma solidity ^0.8.0;


contract Storage
{
    
    enum Roleassigned{user,admin}
    uint  rid=0;
    uint uid=0;
    mapping(address => uint) roleoftheuser;
    
    struct database{
    Roleassigned role;
    uint id;
    string name;
    uint age;
    address useradd;
    }
    

mapping(uint => database) public user;
mapping(address =>bool) private admin;
mapping(address => bool) private notadmin;


event Databasestored(uint id, address ofuser);
event getdetails(uint id , Roleassigned role , string name);
event NewAdmin(address admin, address newAdmin, uint256 timestamp);
event NewUser(address newUser, uint256 timestamp);

modifier onlyadmin(){
    require(admin[msg.sender]," Only Admin Can Set new admin ");
    _;
}
 

 

    
    
 function setuser(uint uid,string memory _name,uint _age) internal   returns(bool){
   uint uid =  uid++;
//   Roleassigned.role = Roleassigned.user;
   user[uid].name = _name;
   user[uid].age = _age;
   notadmin[msg.sender] = true;
   emit NewUser(msg.sender,block.timestamp);
   return true;
 }
 
 function setadmin(address _admin) public onlyadmin{
     require(
         !notadmin[_admin] );
         roleoftheuser[msg.sender] = rid;
         rid++;
         emit NewAdmin(msg.sender,_admin,block.timestamp);
 }
 
 
 function getuser(uint id) public returns(string memory , uint ,address){
     return(user[id].name, user[id].age,user[id].useradd);
 }
 
 constructor(){
       admin[msg.sender] = true;
       emit NewAdmin(address(0),msg.sender,block.timestamp);
   }
   
   
   function update(uint _id,string memory _name, uint _age) public onlyadmin returns(bool){
       user[_id].name = _name;
       user[_id].age = _age;
       return true;
   }

}




contract Controller is Storage{
   Storage public _store;
   
   
   function deploynameage(string memory name,uint age) public {
       _store = new Storage();
       _store.setuser(uid , name , age );
   }
   
   function deploygetuser(uint id) public  returns(string memory , uint ,address){
       return _store.getuser(id);
   }
   
   
    
    
}