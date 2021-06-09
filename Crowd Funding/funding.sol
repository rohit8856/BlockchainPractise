pragma solidity ^0.8.0;

contract funding{
    
    struct Project{
        address payable ad;
        string name;
        string website;
        uint256 totalamount;
        uint256 minimumamount;
        uint256 currentbalnace;
        uint256 endsat;
        uint256 completeat;
        Status status;
        
    }
    mapping(address=>Project) public project;
    

    enum Status{
        fundraised, fail,successful
    }


    struct Contributors{
        address addr;
        uint256 amount;
    }
    mapping(address => Contributors) public contributions;

 address payable public owner;

    //events 
    
    event projectinitiated(
        address owner, string name, string website, uint256 minimum, uint256 duration
    );
    
    event projectsubmitted(
        address add,uint256 amount
    );
    
    event fundsreceived(address add, uint256 amount, uint256 total
    );
    
    event refund(address add, uint256 amount
    );
    
    event error(
        address add, uint256 amount);
    
    
    
    //constructor
    
    constructor( address payable _owner,uint256 _minimum,uint256 _duration, string memory _name, string memory _website) public payable{
        
        uint256 minimumamount = _minimum * 1 ether;
        
        uint256 endsat = block.timestamp + _duration * 1 seconds;
        owner = payable(msg.sender);
        
        Project memory projectt = Project(_owner, _name, _website, 0, minimumamount, 0, endsat, 0, Status.fundraised);
        project[msg.sender] = projectt;
        emit projectinitiated(_owner,_name,_website,minimumamount,endsat);
    }
    
    
    
    
    // modifiers
    modifier onlyOwner(){
        require(project[msg.sender].ad == msg.sender," Only Owner Allowd");
        _;
    }
    
    modifier checkdeadline(){
        require(block.timestamp >= project[msg.sender].endsat);
        _;
    }
    
    
    modifier projectsuccess(){
        require(!((project[owner].status == Status.fail)));
        _;
    }
    
    
    
    
    //functions
    
    
    function contribute(address payable _add, uint256 _amount) public payable returns(bool){
        require(msg.sender != owner);
        uint256 amount = _amount * 1 ether;
        Contributors memory contri = Contributors(_add,amount);
        contributions[_add] = contri;
        project[owner].currentbalnace +=amount;
        emit fundsreceived(_add,amount,project[owner].currentbalnace);
        return true;
    }
    
    
    function goalacheived() public onlyOwner checkdeadline{
    require(project[owner].status != Status.successful && project[owner].status!=Status.fail );
    if(project[owner].currentbalnace > project[owner].minimumamount){
        project[owner].ad.transfer(project[owner].totalamount);
        project[owner].status = Status.successful;
        
        emit projectsubmitted(project[owner].ad,project[owner].totalamount );
        
    }
    }
    
    function destroy() public onlyOwner  {
        selfdestruct(payable(msg.sender));
    }
    
}