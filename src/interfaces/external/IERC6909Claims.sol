// SPDX-License-Identifier: MIT
// 声明开源许可证类型为MIT，允许代码在特定条件下被自由使用

pragma solidity ^0.8.0;
// 指定Solidity编译器版本必须大于等于0.8.0且小于0.9.0

/// @notice 基于ERC6909标准的合约余额声明接口
interface IERC6909Claims {
    /*//////////////////////////////////////////////////////////////
                                事件
    //////////////////////////////////////////////////////////////*/

    /// @notice 操作员授权状态变更事件
    /// @param owner 代币持有者地址
    /// @param operator 被授权操作员地址
    /// @param approved 授权状态（true为授权，false为取消）
    event OperatorSet(address indexed owner, address indexed operator, bool approved);

    /// @notice 特定代币ID的授权额度变更事件
    /// @param owner 代币持有者地址
    /// @param spender 被授权使用代币的地址
    /// @param id 代币ID
    /// @param amount 新的授权额度
    event Approval(address indexed owner, address indexed spender, uint256 indexed id, uint256 amount);

    /// @notice 代币转移事件
    /// @param caller 执行转账操作的调用者地址
    /// @param from 代币转出地址
    /// @param to 代币转入地址
    /// @param id 代币ID
    /// @param amount 转账代币数量
    event Transfer(address caller, address indexed from, address indexed to, uint256 indexed id, uint256 amount);

    /*//////////////////////////////////////////////////////////////
                                函数
    //////////////////////////////////////////////////////////////*/

    /// @notice 查询账户在特定代币ID上的余额
    /// @param owner 要查询的账户地址
    /// @param id 代币ID
    /// @return amount 该账户持有的指定代币数量
    function balanceOf(address owner, uint256 id) external view returns (uint256 amount);

    /// @notice 查询特定代币ID的授权额度
    /// @param owner 代币持有者地址
    /// @param spender 被授权使用代币的地址
    /// @param id 代币ID
    /// @return amount 当前授权额度
    function allowance(address owner, address spender, uint256 id) external view returns (uint256 amount);

    /// @notice 检查操作员授权状态
    /// @param owner 代币持有者地址
    /// @param spender 被检查的操作员地址
    /// @return approved 授权状态（true表示已授权）
    function isOperator(address owner, address spender) external view returns (bool approved);

    /// @notice 转账指定代币ID和数量的代币
    /// @param receiver 代币接收者地址
    /// @param id 代币ID
    /// @param amount 转账代币数量
    /// @return bool 成功返回true（失败时回滚）
    function transfer(address receiver, uint256 id, uint256 amount) external returns (bool);

    /// @notice 从指定发送者转账代币（需有授权）
    /// @param sender 代币发送者地址
    /// @param receiver 代币接收者地址
    /// @param id 代币ID
    /// @param amount 转账代币数量
    /// @return bool 成功返回true（失败时回滚）
    function transferFrom(address sender, address receiver, uint256 id, uint256 amount) external returns (bool);

    /// @notice 设置特定代币ID的授权额度
    /// @param spender 被授权使用代币的地址
    /// @param id 代币ID
    /// @param amount 授权额度数量
    /// @return bool 总是返回true
    function approve(address spender, uint256 id, uint256 amount) external returns (bool);

    /// @notice 设置或取消操作员权限
    /// @param operator 操作员地址
    /// @param approved 授权状态（true为授权，false为取消）
    /// @return bool 总是返回true
    function setOperator(address operator, bool approved) external returns (bool);
}