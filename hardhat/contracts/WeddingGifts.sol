// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract WeddingGifts {

    mapping (address => donationList[]) public donationListPerAddress;

    struct donationList {
        string donaterName;
        address donatedAddress;
        uint256 donationAmount;
    }

    function donateGift(string memory _donaterName, address _donationAddress) public payable {
        donationList memory donation = donationList ({
            donaterName: _donaterName,
            donatedAddress: msg.sender,
            donationAmount: msg.value
        });

        donationListPerAddress[_donationAddress].push(donation);
        (bool sent,) = _donationAddress.call{value: msg.value}("");
        require(sent);

    }

}
