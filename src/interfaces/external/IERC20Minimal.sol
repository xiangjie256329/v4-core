// SPDX-License-Identifier: MIT
// 声明开源许可证类型为MIT，允许代码在特定条件下被自由使用

pragma solidity ^0.8.0;
// 指定Solidity编译器版本必须大于等于0.8.0且小于0.9.0

/// @title Uniswap专用最小化ERC20接口
/// @notice 包含Uniswap V3中使用到的ERC20接口子集
interface IERC20Minimal {
    /// @notice 查询账户的代币余额
    /// @param account 要查询余额的账户地址
    /// @return 该账户持有的代币数量
    function balanceOf(address account) external view returns (uint256);

    /// @notice 从调用者账户向接收者转账
    /// @param recipient 接收代币的账户地址
    /// @param amount 要转账的代币数量
    /// @return 成功返回true，失败返回false
    function transfer(address recipient, uint256 amount) external returns (bool);

    /// @notice 查询授权额度
    /// @param owner 代币持有者地址
    /// @param spender 被授权使用代币的地址
    /// @return 当前授权额度
    function allowance(address owner, address spender) external view returns (uint256);

    /// @notice 设置代币使用者的授权额度
    /// @param spender 被授权使用代币的地址
    /// @param amount 授权额度数量
    /// @return 成功返回true，失败返回false
    function approve(address spender, uint256 amount) external returns (bool);

    /// @notice 从发送者向接收者转账（需有授权）
    /// @param sender 代币发送者地址
    /// @param recipient 代币接收者地址
    /// @param amount 转账代币数量
    /// @return 成功返回true，失败返回false
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /// @notice 代币转账事件（transfer或transferFrom触发）
    /// @param from 代币转出地址（余额减少）
    /// @param to 代币转入地址（余额增加）
    /// @param value 转账代币数量
    event Transfer(address indexed from, address indexed to, uint256 value);

    /// @notice 授权额度变更事件
    /// @param owner 设置授权的账户
    /// @param spender 被授权的账户
    /// @param value 新的授权额度
    event Approval(address indexed owner, address indexed spender, uint256 value);
}