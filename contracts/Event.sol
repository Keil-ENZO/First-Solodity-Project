// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract Event {

event newUserRegistered(address indexed user, string username);

    struct User {
        string username;
        uint256 age;
    }

    mapping(address => User) public users;

    function registerUsers(string memory _username, uint256 _age) public {
        User storage newUser = users[msg.sender];

        newUser.username = _username;
        newUser.age = _age;

        emit newUserRegistered(msg.sender, _username);
    }


}