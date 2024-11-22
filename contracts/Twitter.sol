// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract Twitter {

    uint256 constant minLength = 5; 
    uint256 constant maxLength = 280;
    uint16  public MAX_TWEET_LENGTH = 280;

    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;
    address public owner; 

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner!!");
        _;
    }

    function changeTweetLength(uint16 newTweetLength) public  onlyOwner{
        MAX_TWEET_LENGTH = newTweetLength;
    }

    function createTweet(string memory _tweet) public {
        require(bytes(_tweet).length >= minLength, "You tweet is too short" );
        require(bytes(_tweet).length <= maxLength, "You tweet is too long");
        
        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    } 

    function likeTweet(uint256 id, address author) external {
        require(tweets[author][id].id == id, "tweet does not exist");

        tweets[author][id].likes++;
    }

    function unlikeTweet(address author, uint256 id) external  {
        require(tweets[author][id].id == id, "tweet does not exist");
        require(tweets[author][id].likes > 0, "Tweet has no likes");

        tweets[author][id].likes--;
    }

    function getTweet(address _owner, uint _i) public view returns (Tweet memory) {
        return tweets[_owner][_i];
    }


    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}