// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract Twitter {

    mapping(address => string) public tweets;

    function createTweet(string memory _tweet) public {
        tweets[msg.sender] = _tweet;
    } 

    function getTweet(address user) public view returns (string memory) {
        return tweets[user];
    }
}