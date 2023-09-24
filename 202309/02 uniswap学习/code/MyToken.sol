// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.9.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.0;
interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint256);
    function totalSupply() external view returns (uint256);
    function balanceOf(address _owner) external view returns (uint256 balance);
    function transfer(address _to, uint256 _value) external returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
    function approve(address _spender, uint256 _value) external returns (bool success);
    function allowance(address _owner, address _spender) external view returns (uint256 remaining);
}

contract MyToken is IERC20 {
    mapping (address => uint256) balances;

    mapping (address => mapping (address => uint256)) allowances;

    uint256 private _total = 1_000_000_000; 

    string _name;

    string _symbol;

    constructor(string memory __name, string memory __symbal) {
        balances[msg.sender] = _total;
        _name = __name;
        _symbol = __symbal;
    }

    function name() external view override returns (string memory) {
        return _name;
    }

    function symbol() external view override returns (string memory) {
        return _symbol;
    }

    function decimals() external view override returns (uint256) {
        return 1000_000;
    }

    function totalSupply() external view override returns (uint256) {
        return _total;
    }

    function balanceOf(
        address _owner
    ) external view override returns (uint256 balance) {
        return balances[_owner];
    }

    function transfer(
        address _to,
        uint256 _value
    ) external override returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external override returns (bool success) {
        require(allowances[_from][_to] >= _value, "You don't have enough allowance");
        _approve(_from, _to, allowances[_from][_to] - _value);
        _transfer(_from, _to, _value);
        return true;
    }

    function approve(
        address _spender,
        uint256 _value
    ) external override returns (bool success) {
        _approve(msg.sender, _spender, _value);
        return true;
    }

    function allowance(
        address _owner,
        address _spender
    ) external view override returns (uint256 remaining) {
        return allowances[_owner][_spender];
    }

    function _approve(address _from, address _spender, uint256 _value) private{
        allowances[_from][_spender] = _value;
    }
  
    function _transfer(
        address _from,
        address _to,
        uint256 _value
    ) private {
        require(_from != address(0), "From address shouldn't be zero!");
        require(balances[_from] >= _value, "You don't have enough money!");
        balances[_from] = balances[_from] - _value;
        balances[_to] = balances[_to] + _value;
    }
}