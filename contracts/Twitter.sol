// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract Twitter {

    uint256 constant minLength = 5; 
    uint256 constant maxLength = 280;

    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;



    function createTweet(string memory _tweet) public {
        require(bytes(_tweet).length >= minLength, "You tweet is too short" );
        require(bytes(_tweet).length <= maxLength, "You tweet is too long");
        
        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    } 

    function getTweet(address _owner, uint _i) public view returns (Tweet memory) {
        return tweets[_owner][_i];
    }


    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}