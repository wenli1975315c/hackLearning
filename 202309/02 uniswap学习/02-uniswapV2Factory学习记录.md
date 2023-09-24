# uniswapV2Factory
uniswapV2Factory是用来创建交易对的工厂，我们平时说的“添加流动性”就是通过uniswapV2Factory创建合约交易对，其代码已在ethscan上开源。
> https://etherscan.io/address/0x5c69bee701ef814a2b6a3edd4b1652cb9cc5aa6f#code

它实现了如下接口：

```JavaScript
interface IUniswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}
```
- feeTo() 方法用来查询uniswapv2协议的收益人
- feeToSetter() 方法用来查询uniswapv2协议的管理员
- getPair(address tokenA, address tokenB) 方法用来获取代币A和代币B的交易对
- allPairs(uint)获取第i个交易对
- allPairsLength() 统计总共有多少个交易对
- createPair(address tokenA, address tokenB) 创建代币A和代币B的交易对
- setFeeTo(address)设置uniswap协议的收益人
- setFeeToSetter(address)设置uniswap协议的管理员
