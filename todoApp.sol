// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

contract TodoList {
  
  struct Task {
    uint id;
    string content;
    bool completed;
  }

  Task[] public todos;
  mapping(address => Task[]) public tasks;

  function createTask(uint _id, string memory _content) public {
    todos.push(Task(_id,_content,false));
    tasks[msg.sender] = todos;
  }

  function addTaskByAddress(address _address) public {
    tasks[_address].push(Task(2,"Shehryar",false));
  }

  function getTaskByAddress(address _address) public view returns(Task[] memory) {
    return tasks[_address];
  }

  function taskDeleteByAddressById(address _address,uint _id) public {
    // Task[] memory getTask  = tasks[_address][_id];
    delete tasks[_address][_id];
  }


  
}