// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


contract Calculator {
    uint result = 0;

    function add(uint num) public {
        result += num;
    }

    function subtract(uint num) public {
        result -= num;
    }

    function multiply(uint num) public {
        result *= num;
    }

    function getResult() public view returns (uint) {
        return result;
    }

}