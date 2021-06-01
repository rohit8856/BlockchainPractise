pragma solidity ^0.8.0;

contract supply{
    
    uint public p_id = 0;
    uint public u_id =0;


    enum role{user, seller ,admin}
    mapping(address =>uint) public address_provided;
    
    enum producttracking{ordered, dispatched , intransport, delivered}
  
    
    struct track_product{
        uint product_id;
        uint owner_id;
        address product_owner;
        uint timestampp;
        producttracking state;
    }
    mapping(uint =>track_product) public tracker;
    
    
    
    struct product{
        string product_name;
        uint product_cost;
        string specs;
        address product_owner;
    }
    mapping(uint => product) public products;
    
    
    
    struct user_info{
        string user_name;
        string user_pass;
        address user_address;
        string user_type;
    }
    mapping(uint => user_info) public users;
    
function compareStrings(string memory a, string memory b) public view returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }
    
    
    
    
    function providingrole(string memory user_role)public {
        if(compareStrings(user_role,"user")){
            address_provided[msg.sender] = uint(role.user);
        }
        else if(compareStrings(user_role,"Seller")){
            address_provided[msg.sender] = uint256(role.seller);
        }
        else{
            address_provided[msg.sender] = uint256(role.admin);
        }
    }


    function sellerproductdes(uint _id, string memory _name,uint cost,string memory specss) public  returns (uint){
        if(keccak256(abi.encodePacked(users[_id].user_type)) == keccak256(abi.encodePacked("Seller"))){
            
            uint product_idd = p_id++;
            
            products[product_idd].product_name = _name;
            products[product_idd].product_cost = cost;
            products[product_idd].specs = specss ;
            products[product_idd].product_owner = users[_id].user_address;
            
            return  product_idd;
        }
        
        return 0;
    }
    
    function stateOfProduct(uint pid,uint256 _state) public {
        require(address_provided[msg.sender] == 2 ," Admin can change only");
        
        if(_state ==0){
            tracker[pid].state = producttracking.ordered;
        }
        else if(_state == 1){
             tracker[pid].state = producttracking.dispatched;
        }
        else if (_state == 2){
             tracker[pid].state = producttracking.intransport;
        }
        else
        {
             tracker[pid].state = producttracking.delivered;
        }
    }
    

    function getproduct_specs(uint pp_id) public returns (string memory,uint,string memory,address){
         return (products[pp_id].product_name,
         products[pp_id].product_cost,
         products[pp_id].specs,
         products[pp_id].product_owner);

    }



    
    
    
}    
    
  
    
