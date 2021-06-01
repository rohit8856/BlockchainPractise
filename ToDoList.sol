pragma solidity 0.8.0;

contract todolist{
    uint256 taskcount;
    struct Task{
        uint256 id;
        string taskname;
        uint256 createdon;
        uint256 deadline;
        bool completed;
    }
    
    mapping(uint =>Task) public tasks;
    
    
    
function createTask(string memory _taskname, uint256 _deadline ) public returns(bool){
    taskcount++;
    uint256 deadline = block.timestamp + (_deadline*( 1 days));
    Task memory task ;
    task.taskname = _taskname;
    task.id = taskcount;
    task.createdon = block.timestamp;
    task.deadline = deadline;
     tasks[taskcount] = task;
     return true;
}

function tomarkcompleted(uint _id) public returns(bool){
    Task memory _task = tasks[_id];
    _task.completed = true;
    tasks[_id] = _task;
    return true;
}

function deletetask(uint _id) public returns(bool){
  
    delete tasks[_id];
    return true;  
}


function updateDeadline(uint256 _id,uint256 _newdeadline ) public returns(bool){
    Task memory task = tasks[_id];
    uint256 _deadline = task.deadline + (_newdeadline*( 1 days));
    task.deadline = _deadline;
    tasks[_id] = task;
    return true;

}
}